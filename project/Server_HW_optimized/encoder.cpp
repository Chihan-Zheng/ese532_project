#include "Constants.h"
#include <CL/cl2.hpp>

#define NUM_PACKETS 8
#define pipe_depth 4
#define DONE_BIT_L (1 << 7)
#define DONE_BIT_H (1 << 15)

int offset = 0;
unsigned char* file;

void handle_input(int argc, char* argv[], int* blocksize) {
	int x;
	extern char *optarg;

	while ((x = getopt(argc, argv, ":b:")) != -1) {
		switch (x) {
		case 'b':
			*blocksize = atoi(optarg);
			printf("blocksize is set to %d optarg\n", *blocksize);
			break;
		case ':':
			printf("-%c without parameter\n", optopt);
			break;
		}
	}
}

int main(int argc, char* argv[]) {
	if (argc < 2)
	{
		std::cout << "No compressed file defined\n";
		return 1;
	}

	stopwatch ethernet_timer;
	unsigned char* input[NUM_PACKETS];
	int writer = 0;
	int done = 0;
	int length = 0;
	int count = 0;
	ESE532_Server server;

	//-----------------------------------------Host Start------------------------------------------------
	EventTimer timer2;
    std::cout << "Running Encoding Task" << std::endl;
    // ------------------------------------------------------------------------------------
    // Step 1: Initialize the OpenCL environment
    // ------------------------------------------------------------------------------------
    timer2.add("OpenCL Initialization");
    cl_int err;
    std::string binaryFile = "LZW_hybrid_hash_HW.xclbin";
    unsigned fileBufSize;
    std::vector<cl::Device> devices = get_xilinx_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context(device, NULL, NULL, NULL, &err);
    char *fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    cl::Program program(context, devices, bins, NULL, &err);
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);
    cl::Kernel krnl_LZW(program, "LZW_hybrid_hash_HW", &err);

	 // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
	char *ArrayOfChunks[MAX_BOUNDARY];
	char *ArrayOfChunks_temp[MAX_BOUNDARY];
    std::unordered_map<string, uint32_t> chunkTable;
    uint32_t deDup_header;     //output of deDup function
	uint16_t *LZW_input_length;
    uint16_t *LZW_output_length;   
	uint16_t *LZW_send_data;     
    // uint16_t *LZW_send_data = (uint16_t *)calloc(Max_Chunk_Size + 2, sizeof(uint16_t));     //Max_Chunk_Size + 32bits header -> unit is 16bits

    timer2.add("Allocate contiguous OpenCL buffers");

    cl::Buffer Input_buf;
	cl::Buffer In_length_buf;
    cl::Buffer Output_buf;
	cl::Buffer Output_length_buf;

	std::vector<cl::Event> write_done(MAX_BOUNDARY);
	std::vector<cl::Event> write_waitlist;
	std::vector<std::vector<cl::Event>> execute_waitlist(MAX_BOUNDARY);
	std::vector<cl::Event> execute_done(MAX_BOUNDARY);
	std::vector<cl::Event> read_waitlist;
	std::vector<cl::Event> read_done(MAX_BOUNDARY);
	std::atomic<bool> fwrite_flag[MAX_BOUNDARY];

	uint16_t Input_buf_size = Max_Chunk_Size;
	uint16_t Output_buf_size = (Max_Chunk_Size + 2) * sizeof(uint16_t);
 
	Input_buf = cl::Buffer(context, CL_MEM_READ_ONLY, Input_buf_size, NULL, &err);
	Output_buf = cl::Buffer(context, CL_MEM_WRITE_ONLY, Output_buf_size, NULL, &err);
	In_length_buf = cl::Buffer(context, CL_MEM_READ_ONLY, sizeof(uint16_t), NULL, &err);
	Output_length_buf = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(uint16_t), NULL, &err);

	//--------------map buffers----------
/* 	for (int i = 0; i < MAX_BOUNDARY; i++){
		ArrayOfChunks[i] = (char*)q.enqueueMapBuffer(Input_buf[i], CL_TRUE, CL_MAP_WRITE, 0, Input_buf_size, NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map ArrayOfChunks failed\n");
	} */
	
	LZW_send_data = (uint16_t*)q.enqueueMapBuffer(Output_buf, CL_TRUE, CL_MAP_READ, 0, Output_buf_size, NULL, NULL, &err);
	if (err != CL_SUCCESS) 
		printf("map LZW_send_data failed\n");

	LZW_input_length = (uint16_t*)q.enqueueMapBuffer(In_length_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(uint16_t), NULL, NULL, &err);
	if (err != CL_SUCCESS) 
		printf("map LZW_input_length failed\n");
	LZW_output_length = (uint16_t*)q.enqueueMapBuffer(Output_length_buf, CL_TRUE, CL_MAP_READ, 0, sizeof(uint16_t), NULL, NULL, &err);

	if (err != CL_SUCCESS) 
		printf("map LZW_output_length failed\n");
	//-----------------------------------------
	//--------------------------------------encode define--------------------------------------------
    FILE *File = fopen(argv[1], "wb");
    if (File == NULL)
        Exit_with_error("fopen for send_data failed");

    uint16_t *chunk_size = (uint16_t *)malloc(sizeof(uint16_t) * MAX_BOUNDARY);
    if (chunk_size == NULL){
        std::cerr << "Could not calloc chunk_size." << std::endl;
        exit (EXIT_FAILURE);
    }
	
	stopwatch cdc_timer;
    stopwatch SHA_timer;
    stopwatch deDup_timer;
    stopwatch LZW_timer;
    stopwatch total_timer;
	int deDup_final_bytes = 0;
	int LZW_final_bytes = 0;
	int LZW_total_input_bytes = 0;
	//--------------------------------end encode define----------------------------------

	// default is 2k
	int blocksize = BLOCKSIZE;

	// set blocksize if decalred through command line
	handle_input(argc, argv, &blocksize);

	file = (unsigned char*) malloc(sizeof(unsigned char) * 70000000);
	if (file == NULL) {
		printf("help\n");
	}

	for (int i = 0; i < NUM_PACKETS; i++) {
		input[i] = (unsigned char*) malloc(
				sizeof(unsigned char) * (NUM_ELEMENTS + HEADER));
		if (input[i] == NULL) {
			std::cout << "aborting " << std::endl;
			return 1;
		}
	}

	server.setup_server(blocksize);

	writer = pipe_depth;
	server.get_packet(input[writer]);
	count++;

	// get packet
	unsigned char* buffer = input[writer];

	// decode
	done = buffer[1] & DONE_BIT_L;
	length = buffer[0] | (buffer[1] << 8);
	length &= ~DONE_BIT_H;
	// printing takes time so be weary of transfer rate
	//printf("length: %d offset %d\n",length,offset);

	// we are just memcpy'ing here, but you should call your
	// top function here.
	memcpy(&file[offset], &buffer[HEADER], length);

	offset += length;
	writer++;
	printf("First packet length is: %d\n", length);

	total_timer.start();
	//last message
	while (!done) {

		// reset ring buffer
		if (writer == NUM_PACKETS) {
			writer = 0;
		}

		ethernet_timer.start();
		server.get_packet(input[writer]);
		ethernet_timer.stop();

		count++;

		// get packet
		unsigned char* buffer = input[writer];

		// decode
		done = buffer[1] & DONE_BIT_L;
		length = buffer[0] | (buffer[1] << 8);
		length &= ~DONE_BIT_H;
		//printf("length: %d offset %d\n",length,offset);
		/* memcpy(&file[offset], &buffer[HEADER], length);
		offset += length; */
		writer++;
		// ------------------------------------------------------------------------------------
		// Step 3: Start encoding
		// ------------------------------------------------------------------------------------

		//refresh fwrite_flag[MAX_BOUNDARY]
		for (int i = 0; i < MAX_BOUNDARY; i++){
			fwrite_flag[i].store(false);
		}

		//--- define flags for kernel
		timer2.add("Running the encoding");
		//-------------------------------------start encoding-----------------------------------------------
		int boundary_num = 0;
		// printf("before cdc\n");
		if (count == 2) {
			//--- 2 packet:
			memcpy(&file[offset], &buffer[HEADER], length);
			offset += length;
			printf("Second packet length is: %d\n", length);
			// if (fread(buffer, 1, offset, &file[0]) != offset)
 			// 	Exit_with_error("fread for first two packets failed");
    		cdc_timer.start();
    		boundary_num = cdc(file, offset, ArrayOfChunks_temp, chunk_size);   //boundary_num should use char?
   			cdc_timer.stop();
			// printf("reach first cdc\n");
			FILE *outfd = fopen("test_chunks.bin", "wb");
			int bytes_written = fwrite(&file[0], 1, offset, outfd);
		}else{
			//--- 1 packet:
			offset += length;
			cdc_timer.start();
			boundary_num = cdc(&buffer[2], length, ArrayOfChunks_temp, chunk_size);   //boundary_num should use char?
			cdc_timer.stop();
		}
		// printf("after cdc\n");

		std::cout << "-------------------------------Chunks Info-------------------------------------" << std::endl;
		std::cout << "chunk number: " << boundary_num << std::endl;
		for (int i = 0; i < boundary_num; i++){
			// printf("for loop i: %d\n", i);
			deDup_timer.start();
			deDup_header = deDup(ArrayOfChunks_temp[i], chunk_size[i], chunkTable, std::ref(SHA_timer));
			deDup_timer.stop();
			if (deDup_header & 1u){
				std::cout << "deDup_header - boundary: " << i << std::endl;
				if (fwrite(&deDup_header, 1, sizeof(deDup_header), File) != sizeof(deDup_header))
					Exit_with_error("fwrite dedup header to compressed_data.bin failed");
				deDup_final_bytes += sizeof(deDup_header);
			}else{
				//-----------------------map Input Buffer-----------------------------------
				ArrayOfChunks[i] = (char*)q.enqueueMapBuffer(Input_buf, CL_TRUE, CL_MAP_WRITE, 0, chunk_size[i], NULL, NULL, &err);
				memcpy(ArrayOfChunks[i], ArrayOfChunks_temp[i], chunk_size[i]);
				//------------------------------------------------------------------------------
				if (err != CL_SUCCESS) 
					printf("map ArrayOfChunks failed\n");
				std::cout << "\n" << "LZW_header - boundary: " << i << std::endl;
				*LZW_input_length = chunk_size[i];
				LZW_timer.start();
				// LZW_output_length = LZW_hybrid_hash_HW(ArrayOfChunks[i], in_length, LZW_send_data);
				// printf("before kernel\n");
				//--------------------------------kernel computation --------------------------------
				krnl_LZW.setArg(0, Input_buf);
				krnl_LZW.setArg(1, In_length_buf);
				krnl_LZW.setArg(2, Output_buf);
				krnl_LZW.setArg(3, Output_length_buf);

				q.enqueueMigrateMemObjects({Input_buf, In_length_buf}, 0 /* 0 means from host*/, &write_waitlist, &write_done[i]);
				write_waitlist.push_back(write_done[i]);
			
				q.enqueueWaitForEvents(read_waitlist);
				execute_waitlist[i].push_back(write_done[i]);
				q.enqueueTask(krnl_LZW, &execute_waitlist[i], &execute_done[i]);

				read_waitlist.push_back(execute_done[i]);
				q.enqueueMigrateMemObjects({Output_buf, Output_length_buf}, CL_MIGRATE_MEM_OBJECT_HOST, &read_waitlist, &read_done[i]);
				read_waitlist.push_back(read_done[i]);
				//--------------------------------kernel computation --------------------------------
				// read_done[i].wait();
				
				// printf("after kernel\n");
				LZW_timer.stop();
				// printf("after while loop i: %d\n", i);
				// std::cout << "LZW_output_length[" << i << "]: " << LZW_output_length << "\n" << std::endl;
				if (fwrite(LZW_send_data, 1, *LZW_output_length, File) != *LZW_output_length)
					Exit_with_error("fwrite LZW output to compressed_data.bin failed");
				// fwrite_flag[i] = true;
				// std::cout << "fwrite_flag[" << i << "]: " << fwrite_flag[i] << std::endl;
				// memset(LZW_send_data, 0, (Max_Chunk_Size + 2) * sizeof(uint16_t));
				LZW_total_input_bytes += *LZW_input_length;
				LZW_final_bytes += *LZW_output_length;
				q.enqueueUnmapMemObject(Input_buf, ArrayOfChunks[i]);
			}
		}
		//---------------------------------------end encoding----------------------------------------------
	}
	q.finish();
	printf("q finished\n");

	//----------------------------------File of codes-------------------------------------------
	fseek(File, 0, SEEK_END); // seek to end of file
	int file_size = ftell(File); // get current file pointer
	fseek(File, 0, SEEK_SET); // seek back to beginning of file

    if (fclose(File) != 0)
    	Exit_with_error("fclose for send_data failed");
	total_timer.stop();
	//----------------------------------end of encode-------------------------------------------
	// printf("after end of encoder\n");
	// // write file to root and you can use diff tool on board
	// FILE *outfd = fopen("output_cpu.bin", "wb");
	// FILE *outfd = fopen("test_chunks.txt", "wb");
	// int bytes_written = fwrite(&file[0], 1, offset, outfd);
	// printf("write file with %d\n", bytes_written);
	// fclose(outfd);
	for (int i = 0; i < NUM_PACKETS; i++) {
		free(input[i]);
	}
	// printf("after free input\n");

	free(file);
	// ------------------------------------------------------------------------------------
    // Step 5: Release Allocated Resources
    // ------------------------------------------------------------------------------------
    std::cout << "--------------- Key execution times ---------------"
    << std::endl;
    timer2.print();

 	q.enqueueUnmapMemObject(Output_buf, LZW_send_data);
	q.enqueueUnmapMemObject(In_length_buf, LZW_input_length);
	q.enqueueUnmapMemObject(Output_length_buf, LZW_output_length);
	
	 //---------------------------------print functions execution time---------------------------------------------------------
    std::cout << "------------------------------Functions Execution Time-------------------------------" << std::endl;
    std::cout << "Total latency of CDC is: " << cdc_timer.latency() << " ms." << std::endl;
    std::cout << "Total latency of SHA is: " << SHA_timer.latency() << " ms." << std::endl;
    std::cout << "Total latency of deDup is: " << deDup_timer.latency() << " ms." << std::endl;
    std::cout << "Total latency of LZW is: " << LZW_timer.latency() << " ms.\n" << std::endl;
    std::cout << "Total time taken from CDC to get output file is: " << total_timer.latency() << " ms." << std::endl;
	float total_latency = total_timer.latency() / 1000.0;
	float overall_throughput = (offset * 8 / 1000000000.0) / total_latency;
	std::cout << "Overall throughput: " << overall_throughput << " Gb/s." << std::endl;
    std::cout << "------------------------------------------------------------------------------------" << std::endl;
    std::cout << "Average latency of SHA is: " << SHA_timer.avg_latency() << " ms." << std::endl;
    std::cout << "Average latency of deDup is: " << deDup_timer.avg_latency() << " ms." << std::endl;
    std::cout << "Average latency of LZW is: " << LZW_timer.avg_latency() << " ms." << std::endl;
    //-----------------------------------------end of print time--------------------------------------------------------------
	std::cout << "-----------------------------------Key Throughputs ---------------------------------" << std::endl;
	float ethernet_latency = ethernet_timer.latency() / 1000.0;
	// float input_throughput = (bytes_written * 8 / 1000000.0) / ethernet_latency; // Mb/s
	float input_throughput = (offset * 8 / 1000000.0) / ethernet_latency; // Mb/s
	std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
			<< " (Latency: " << ethernet_latency << "s)." << std::endl;
	std::cout << "-----------------------------------Compress Ratio-----------------------------------" << std::endl;
	printf("input file with %dB\n", offset);
	printf("encode file with %dB\n\n", file_size);
	printf("Compressed ratio: %.2f%%\n", (file_size * 100.0 / offset));
	float LZW_contribution = (LZW_total_input_bytes - LZW_final_bytes) * 100.0 / (offset - file_size);
	float deDup_contribution = 100.0 - LZW_contribution;
	printf("Compression Contribution of deDup: %.2f%%\n", deDup_contribution);
	printf("Compression Contribution of LZW: %.2f%%\n", LZW_contribution);

	return 0;
}

