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
	pin_main_thread_to_cpu0();
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
    // std::string binaryFile = "LZW_hybrid_hash_HW.xclbin";
	std::string binaryFile = "krnl_LZW.xclbin";
    unsigned fileBufSize;
	auto constexpr num_cu = 4;

    std::vector<cl::Device> devices = get_xilinx_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context(device, NULL, NULL, NULL, &err);
    char *fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    cl::Program program(context, devices, bins, NULL, &err);
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err);
	std::vector<cl::Kernel> krnls(num_cu);
	for (int i = 0; i < num_cu; i++) {
		// OCL_CHECK(err, krnls[i] = cl::Kernel(program, "LZW_hybrid_hash_HW", &err));
		OCL_CHECK(err, krnls[i] = cl::Kernel(program, "krnl_LZW", &err));
	}

	 // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
	// char *ArrayOfChunks[MAX_BOUNDARY];
	char *ArrayOfChunks_LZW[num_cu];
	uint32_t *cdc_offset;
	uint16_t *chunk_size = (uint16_t *)malloc(sizeof(uint16_t));
	uint16_t *chunk_size_dedup = (uint16_t *)malloc(sizeof(uint16_t));
	uint16_t *chunk_size_LZW = (uint16_t *)malloc(sizeof(uint16_t));
	char *cdc_finished;
	char *pipeline_drained;
	uint16_t *ArrayOfCode[MAX_BOUNDARY];
	uint16_t ArrayOfOutputLength_LZW[MAX_BOUNDARY];
    std::unordered_map<string, uint32_t> chunkTable;
    uint32_t deDup_header;     //output of deDup function
	uint32_t deDup_header_LZW;
	uint16_t *LZW_input_length[num_cu];
    uint16_t *LZW_output_length[num_cu];   
	uint16_t *LZW_send_data[num_cu];
	char LZW_chunks_cnt = 0;
	char LZW_chunks_idx[num_cu];
	char num_used_krnls = 0;     
    // uint16_t *LZW_send_data = (uint16_t *)calloc(Max_Chunk_Size + 2, sizeof(uint16_t));     //Max_Chunk_Size + 32bits header -> unit is 16bits

	*chunk_size = 0;
	*chunk_size_dedup = 0;
	*chunk_size_LZW = 0;

	cdc_offset = (uint32_t *)malloc(sizeof(uint32_t *));
	cdc_finished = (char *)malloc(sizeof(char));
	pipeline_drained = (char *)malloc(sizeof(char));

	char *chunk_cdc = (char *)malloc(Max_Chunk_Size);
	char *chunk_dedup = (char *)malloc(Max_Chunk_Size);
	char *chunk_LZW = (char *)malloc(Max_Chunk_Size);
	char *chunk_temp = (char *)malloc(Max_Chunk_Size);

	if (cdc_offset == NULL){
		std::cerr << "Could not malloc cdc_offset  ." << std::endl;
		exit (EXIT_FAILURE);
	}

	if (cdc_finished   == NULL){
		std::cerr << "Could not malloc cdc_finished  ." << std::endl;
		exit (EXIT_FAILURE);
	}

	if (pipeline_drained  == NULL){
		std::cerr << "Could not malloc pipeline_drained ." << std::endl;
		exit (EXIT_FAILURE);
	}

	if (chunk_cdc  == NULL){
		std::cerr << "Could nLZW_chunks_cntot malloc chunk_cdc ." << std::endl;
		exit (EXIT_FAILURE);
	}

	if (chunk_dedup == NULL){
		std::cerr << "Could not malloc chunk_dedup ." << std::endl;
		exit (EXIT_FAILURE);
	}

	if (chunk_LZW  == NULL){
		std::cerr << "Could not malloc chunk_LZW ." << std::endl;
		exit (EXIT_FAILURE);
	}

	if (chunk_temp == NULL){
		std::cerr << "Cototal_timer.stop();uld not malloc chunk_temp ." << std::endl;
		exit (EXIT_FAILURE);
	}

	for (int i = 0; i < MAX_BOUNDARY; i++){
		// ArrayOfChunks[i] = (char *)malloc(sizeof(char) * Max_Chunk_Size);
		ArrayOfCode[i] = (uint16_t *)calloc(Max_Chunk_Size + 1, sizeof(uint16_t));
		// if (ArrayOfChunks[i] == NULL){
		// 	std::cerr << "Could not malloc ArrayOfChunks[" << i << "]." << std::endl;
		// 	exit (EXIT_FAILURE);
		// }
		if (ArrayOfCode[i] == NULL){
			std::cerr << "Could not malloc ArrayOfCode[" << i << "]." << std::endl;
			exit (EXIT_FAILURE);
		}
	}

    timer2.add("Allocate contiguous OpenCL buffers");

	std::vector<cl::Buffer> Input_buf(num_cu);
	std::vector<cl::Buffer> Output_buf(num_cu);
	std::vector<cl::Buffer> In_length_buf(num_cu);
	std::vector<cl::Buffer> Output_length_buf(num_cu);

	std::vector<cl::Event> write_done(MAX_BOUNDARY);
	// std::vector<cl::Event> write_waitlist;
	std::vector<std::vector<cl::Event>> write_waitlist(num_cu);
	std::vector<std::vector<cl::Event>> execute_waitlist(MAX_BOUNDARY);
	std::vector<cl::Event> execute_done(MAX_BOUNDARY);
	// std::vector<cl::Event> read_waitlist;
	std::vector<std::vector<cl::Event>> read_waitlist(num_cu);
	std::vector<cl::Event> read_done(MAX_BOUNDARY);

	uint16_t Input_buf_size = Max_Chunk_Size;
	uint16_t Output_buf_size = (Max_Chunk_Size + 2) * sizeof(uint16_t);

	for (int j = 0; j < num_cu; j++){
		OCL_CHECK(err,
				Input_buf[j] = cl::Buffer(context, CL_MEM_READ_ONLY, Input_buf_size, NULL, &err));
		OCL_CHECK(err,
				Output_buf[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, Output_buf_size, NULL, &err));
		OCL_CHECK(err,
				In_length_buf[j] = cl::Buffer(context, CL_MEM_READ_ONLY, sizeof(uint16_t), NULL, &err));
		OCL_CHECK(err,
				Output_length_buf[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(uint16_t), NULL, &err));
		
		LZW_send_data[j] = (uint16_t*)q.enqueueMapBuffer(Output_buf[j], CL_TRUE, CL_MAP_READ, 0, Output_buf_size, NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map LZW_send_data failed\n");
		LZW_input_length[j] = (uint16_t*)q.enqueueMapBuffer(In_length_buf[j], CL_TRUE, CL_MAP_WRITE, 0, sizeof(uint16_t), NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map LZW_input_length failed\n");
		LZW_output_length[j] = (uint16_t*)q.enqueueMapBuffer(Output_length_buf[j], CL_TRUE, CL_MAP_READ, 0, sizeof(uint16_t), NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map LZW_output_length failed\n");
	}

	for (int j = 0; j < num_cu; j++){
		ArrayOfChunks_LZW[j] = (char*)q.enqueueMapBuffer(Input_buf[j], CL_TRUE, CL_MAP_WRITE, 0, Max_Chunk_Size, NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map ArrayOfChunks_LZW failed\n");
	}
	//-----------------------------------------
	//--------------------------------------encode define--------------------------------------------
    FILE *File = fopen(argv[1], "wb");
    if (File == NULL)
        Exit_with_error("fopen for send_data failed");

/*     uint16_t *chunk_size = (uint16_t *)malloc(sizeof(uint16_t) * MAX_BOUNDARY);
    if (chunk_size == NULL){
        std::cerr << "Could not calloc chunk_size." << std::endl;
        exit (EXIT_FAILURE);
    } */
	
	stopwatch cdc_timer;
    stopwatch SHA_timer;
    stopwatch deDup_timer;
    stopwatch LZW_timer;
    stopwatch total_timer;
	int deDup_final_bytes = 0;
	int LZW_final_bytes = 0;
	int LZW_total_input_bytes = 0;
	std::thread core_1_thread;
	std::thread core_2_thread;
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
	// printf("First packet length is: %d\n", length);
	total_timer.start();
	//last message
	while (!done) {
		printf("enter large while loop\n");

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

		//--- define flags for kernel
		timer2.add("Running the encoding\n");
		//-------------------------------------start encoding-----------------------------------------------
		int boundary_idx = 0;
		int loop_cnt = 0;
		*cdc_offset = 0;
		*cdc_finished = 0;
		*pipeline_drained = 0;   //refresh pipeline_drained flag to 0
		
		if (count == 2) {
			//--- 2 packet:
			memcpy(&file[offset], &buffer[HEADER], length);
			offset += length;
		}else{
			//--- 1 packet:
			offset += length;
		}
		
		// printf("before reaching pipeline while loop\n");
		while (*pipeline_drained < 3){
// printf("\nchunk idx:\t%d:\nchunk for deDup:\n%s\n", boundary_idx - 1,chunk_dedup);
// printf("loop_cnt:\t%d\n", loop_cnt);
			if(!(*cdc_finished)){
				if (count == 2) {
					// printf("enter cdc, loop: %d\n", loop_cnt);
					//--- 2 packet:
					/* if (fread(buffer, 1, offset, &file[0]) != offset)
						Exit_with_error("fread for first two packets failed"); */
					cdc_timer.start();
					// printf("before cdc, loop: %d\n", loop_cnt);
					core_1_thread = std::thread(&cdc, file, offset, chunk_cdc, chunk_size, cdc_offset, cdc_finished);
					// printf("after cdc, loop: %d\n", loop_cnt);
					pin_thread_to_cpu(core_1_thread, 1);
					// cdc(file, offset, chunk, chunk_size, cdc_offset, cdc_finished);   //boundary_num should use char?
					cdc_timer.stop();
					/* FILE *outfd = fopen("test_chunks.bin", "wb");
					int bytes_written = fwrite(&file[0], 1, offset, outfd); */
				}else{
					//--- 1 packet:
					cdc_timer.start();
					core_1_thread = std::thread(&cdc, &buffer[2], length, chunk_cdc, chunk_size, cdc_offset, cdc_finished);
					pin_thread_to_cpu(core_1_thread, 1);
					// cdc(&buffer[2], length, chunk, chunk_size, cdc_offset, cdc_finished);   //boundary_num should use char?
					cdc_timer.stop();
				}
			}
			
			// std::promise<uint32_t> deDup_header_promise;
    		// std::future<uint32_t> deDup_header_future = deDup_header_promise.get_future();
		
			// printf("for loop i: %d\n", i);
			if ((loop_cnt > 0) && (*pipeline_drained < 2)){
				// printf("enter deDup, loop: %d\n", loop_cnt);
				deDup_timer.start();
				// printf("dedup chunk_size: %d, loop: %d\n", *chunk_size_dedup, loop_cnt);
				// printf("chunk dedup:\n%s\n", chunk_cdc);
				core_2_thread = std::thread(&deDup, 
											chunk_dedup, *chunk_size_dedup, std::ref(chunkTable), std::ref(SHA_timer), 
											std::ref(deDup_header));
				// printf(" deDup header: %x\n", deDup_header);
				pin_thread_to_cpu(core_2_thread, 2);
				// deDup_header = deDup_header_future.get();
				// deDup_header = deDup(chunk_dedup, chunk_size, chunkTable, std::ref(SHA_timer));
				deDup_timer.stop();
				/* if ((deDup_header & 1u)){
					// std::cout << "deDup_header - boundary: " << (loop_cnt - 1) << std::endl;
					// printf("-----------------------------------------------\n"); 
					// if (fwrite(&deDup_header, 1, sizeof(deDup_header), File) != sizeof(deDup_header))
					// 	Exit_with_error("fwrite dedup header to compressed_data.bin failed");
					memcpy(ArrayOfCode[loop_cnt - 1] + 1, &deDup_header, sizeof(deDup_header));
					*ArrayOfCode[loop_cnt - 1] = 1;
					deDup_final_bytes += sizeof(deDup_header);
				} */
			}
			// printf("before enter LZW, loop: %d\n", loop_cnt);
			if ((!(deDup_header_LZW & 1u) || (*pipeline_drained == 2)) && (loop_cnt > 1)){
				//-----------------------map Input Buffer-----------------------------------
				if (!(deDup_header_LZW & 1u)){
					/* ArrayOfChunks_LZW[LZW_chunks_cnt] = (char*)q.enqueueMapBuffer(Input_buf[LZW_chunks_cnt], CL_TRUE, CL_MAP_WRITE, 0, *chunk_size_LZW, NULL, NULL, &err);
					if (err != CL_SUCCESS) 
						printf("map ArrayOfChunks_LZW failed\n"); */
					memcpy(ArrayOfChunks_LZW[LZW_chunks_cnt], chunk_LZW, *chunk_size_LZW);
					*LZW_input_length[LZW_chunks_cnt] = *chunk_size_LZW;
					LZW_chunks_idx[LZW_chunks_cnt] = loop_cnt - 2;
				/* 	printf("\nLZW_header - boundary:%d\n", LZW_chunks_idx[LZW_chunks_cnt]);
					printf("-----------------------------------------------\n"); */
					// printf("LZW chunk size: %d\n", *chunk_size_LZW);
					/* if (pipeline_drained == 0){
						LZW_chunks_idx[LZW_chunks_cnt] = boundary_idx - 2;
					}else if(pipeline_drained == 1){
						LZW_chunks_idx[LZW_chunks_cnt] = boundary_idx - 1;
					}else{
						LZW_chunks_idx[LZW_chunks_cnt] = boundary_idx;
					} */

					// std::cout << "\n" << "LZW_header - boundary: " << LZW_chunks_idx[LZW_chunks_cnt] << "" << std::endl;
				}
				//------------------------------------------------------------------------------
// printf("debug----------pipeline_drained:\t%d\n", *pipeline_drained);
				if ((LZW_chunks_cnt < (num_cu - 1)) && (*pipeline_drained < 2)){
					LZW_chunks_cnt++;
				}else{
					if (LZW_chunks_cnt == (num_cu - 1)){
						num_used_krnls = num_cu;
					}else if (deDup_header_LZW & 1u){
						num_used_krnls = LZW_chunks_cnt;
					}else{
						num_used_krnls = LZW_chunks_cnt + 1;
					}
					LZW_chunks_cnt = 0;
					LZW_timer.start();
					// LZW_output_length = LZW_hybrid_hash_HW(ArrayOfChunks[i], in_length, LZW_send_data);
					//--------------------------------kernel computation --------------------------------
/* 					for (int j = 0; j < num_used_krnls; j++){
						OCL_CHECK(err, err = krnls[j].setArg(0, Input_buf[j]));
						OCL_CHECK(err, err = krnls[j].setArg(1, In_length_buf[j]));
						OCL_CHECK(err, err = krnls[j].setArg(2, Output_buf[j]));
						OCL_CHECK(err, err = krnls[j].setArg(3,Output_length_buf[j]));

						OCL_CHECK(err, err = q.enqueueMigrateMemObjects({Input_buf[j], In_length_buf[j]}, 0, 
																		&write_waitlist[j], &write_done[j]));
						write_waitlist[j].push_back(write_done[j]);
						execute_waitlist[j].push_back(write_done[j]);
						
						OCL_CHECK(err, err = q.enqueueTask(krnls[j], &execute_waitlist[j], &execute_done[j]));
						read_waitlist[j].push_back(execute_done[j]);
						OCL_CHECK(err, err = q.enqueueMigrateMemObjects({Output_buf[j], Output_length_buf[j]}, 
																		CL_MIGRATE_MEM_OBJECT_HOST, &read_waitlist[j], &read_done[j]));
						read_waitlist[j].push_back(read_done[j]);
					} */

					for (int j = 0; j < num_used_krnls; j++){
						OCL_CHECK(err, err = krnls[j].setArg(0, Input_buf[j]));
						OCL_CHECK(err, err = krnls[j].setArg(1, In_length_buf[j]));
						OCL_CHECK(err, err = krnls[j].setArg(2, Output_buf[j]));
						OCL_CHECK(err, err = krnls[j].setArg(3,Output_length_buf[j]));

						OCL_CHECK(err, err = q.enqueueMigrateMemObjects({Input_buf[j], In_length_buf[j]}, 0));
						
						OCL_CHECK(err, err = q.enqueueTask(krnls[j]));
					}

					OCL_CHECK(err, err = q.finish());

					for (int j = 0; j < num_used_krnls; j++){
						OCL_CHECK(err, err = q.enqueueMigrateMemObjects({Output_buf[j], Output_length_buf[j]}, CL_MIGRATE_MEM_OBJECT_HOST));
					}

				/* 	for (int j = 0; j < num_used_krnls; j++){
						q.enqueueUnmapMemObject(Input_buf[j], ArrayOfChunks_LZW[j]);
					} */

					OCL_CHECK(err, err = q.finish());
					LZW_timer.stop();
				/* 	for (int j = 0; j < num_used_krnls; j++){
						read_done[j].wait();
					} */

// printf("debug------------num_used_krnls:\t%d\n", num_used_krnls);
					for (int j = 0; j < num_used_krnls; j++){
// printf("debug------------LZW_output_length[%d]:\t%d\n", j, *LZW_output_length[j]);
						memcpy(ArrayOfCode[LZW_chunks_idx[j]] + 1, LZW_send_data[j], *LZW_output_length[j]);
						ArrayOfOutputLength_LZW[LZW_chunks_idx[j]] = *LZW_output_length[j];
						/* q.enqueueUnmapMemObject(Input_buf[j], ArrayOfChunks_LZW[j]); */
						LZW_total_input_bytes += *LZW_input_length[j];
						LZW_final_bytes += *LZW_output_length[j];
					}
					// LZW_timer.stop();
				}
			}
			//--------------------------------kernel computation --------------------------------
// printf("after-------------------------------------------------------------------------LZW_header - boundary:%d\n", LZW_chunks_idx[LZW_chunks_cnt]);
			if (!loop_cnt){
				core_1_thread.join();
			}else if((*pipeline_drained < 1) && (loop_cnt >0)){
				// printf("pipeline_drain: %d\n", *pipeline_drained);
				// printf("cdc_finished: %d\n", *cdc_finished);
				// printf("before join pipeline < 1, loop: %d\n", loop_cnt);
				core_1_thread.join();
				// printf("before join pipeline < 1 core2, loop: %d\n", loop_cnt);
				core_2_thread.join();
				// printf("after join pipeline < 1, loop: %d\n", loop_cnt);
			}else if((*pipeline_drained < 2) && (*cdc_finished)){
				// printf("before join pipeline < 2, loop: %d\n", loop_cnt);
				core_2_thread.join();
				// printf("after join pipeline < 2, loop: %d\n", loop_cnt);

			}
			
			// printf("after thread join: %d\n", loop_cnt);
// printf("\nchunk idx:\t%d:\nchunk from cdc:\n%s\n", boundary_idx,chunk_cdc);
			// std::cout << "--------------------------Header Types for this Iteration------------------------------------" << std::endl;
			if ((deDup_header & 1u) && (loop_cnt > 0) && (*pipeline_drained < 2)){
				// std::cout << "deDup_header - boundary: " << (loop_cnt - 1) << std::endl;
				memcpy(ArrayOfCode[loop_cnt - 1] + 1, &deDup_header, sizeof(deDup_header));
				*ArrayOfCode[loop_cnt - 1] = 1;
				deDup_final_bytes += sizeof(deDup_header);
			}
			
			if (!(deDup_header_LZW & 1u) && (loop_cnt > 1)){
				// printf("LZW_header - boundary:%d\n", (loop_cnt - 2));
			}
			// std::cout << "-----------------------------------------------------------------------------------\n" << std::endl;
			*chunk_size_LZW = *chunk_size_dedup;
			*chunk_size_dedup = *chunk_size;
			
			chunk_temp = chunk_dedup;
			chunk_dedup = chunk_LZW;
			chunk_LZW = chunk_temp;

			chunk_temp = chunk_cdc;
			chunk_cdc = chunk_dedup;
			chunk_dedup = chunk_temp;

			deDup_header_LZW = deDup_header;
			
			loop_cnt++;
			if (!(*cdc_finished)){
				boundary_idx++;
			}
			
			if (*cdc_finished){
				(*pipeline_drained)++;
			}
		}
		
		//------ writing output code:
		for (int i = 0; i <= boundary_idx; i++){
			if (*ArrayOfCode[i] && 1){
				if (fwrite(ArrayOfCode[i] + 1, 1, sizeof(uint32_t), File) != sizeof(uint32_t))
					Exit_with_error("fwrite dedup header to compressed_data.bin failed");
			}else{
				if (fwrite(ArrayOfCode[i] + 1, 1, ArrayOfOutputLength_LZW[i], File) != ArrayOfOutputLength_LZW[i])
					Exit_with_error("fwrite LZW output to compressed_data.bin failed");
			}			
		}			
	}					
	//---------------------------------------end encoding----------------------------------------------
	total_timer.stop();
	for (int j = 0; j < num_used_krnls; j++){
		q.enqueueUnmapMemObject(Input_buf[j], ArrayOfChunks_LZW[j]);
	}
	q.finish();

	printf("q finished\n");

	//----------------------------------File of codes-------------------------------------------
	fseek(File, 0, SEEK_END); // seek to end of file
	int file_size = ftell(File); // get current file pointer
	fseek(File, 0, SEEK_SET); // seek back to beginning of file

    if (fclose(File) != 0)
    	Exit_with_error("fclose for send_data failed");
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
	free(cdc_offset);
	free(cdc_finished);
	free(pipeline_drained);
	// free(chunk_cdc);
	// free(chunk_dedup);
	// free(chunk_LZW);
	// free(chunk_temp);
	for (int i = 0; i < MAX_BOUNDARY; i++){
		// free(ArrayOfChunks[i]);
		free(ArrayOfCode[i]);
	}
	// ------------------------------------------------------------------------------------
    // Step 5: Release Allocated Resources
    // ------------------------------------------------------------------------------------
    std::cout << "--------------- Key execution times ---------------"
    << std::endl;
    timer2.print();

	for (int j = 0; j < num_cu; j++){
		q.enqueueUnmapMemObject(Output_buf[j], LZW_send_data[j]);
		q.enqueueUnmapMemObject(In_length_buf[j], LZW_input_length[j]);
		q.enqueueUnmapMemObject(Output_length_buf[j], LZW_output_length[j]);
	}
	
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


