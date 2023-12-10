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
    // std::cout << "Running Encoding Task" << std::endl;
    // ------------------------------------------------------------------------------------
    // Step 1: Initialize the OpenCL environment
    // ------------------------------------------------------------------------------------
    timer2.add("OpenCL Initialization");
    cl_int err;
    // std::string binaryFile = "LZW_hybrid_hash_HW.xclbin";
	std::string binaryFile = "krnl_LZW.xclbin";
    unsigned fileBufSize;
	auto constexpr num_cu = 5;
	// char num_chunks_krnl = 4;

    std::vector<cl::Device> devices = get_xilinx_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context(device, NULL, NULL, NULL, &err);
    char *fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    cl::Program program(context, devices, bins, NULL, &err);
	cl_ulong maxAllocSize = device.getInfo<CL_DEVICE_MAX_MEM_ALLOC_SIZE>();
	std::cout << "Max CL::buffer size: " << maxAllocSize << " bytes" << std::endl;
    std::vector<cl::CommandQueue> q(num_cu);
	std::vector<cl::Kernel> krnls(num_cu);
	for (int i = 0; i < num_cu; i++) {
		// OCL_CHECK(err, krnls[i] = cl::Kernel(program, "LZW_hybrid_hash_HW", &err));
		OCL_CHECK(err, krnls[i] = cl::Kernel(program, "krnl_LZW", &err));
		OCL_CHECK(err, q[i] = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE 
																| CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err));
	}

	 // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
	uint64_t *cdc_hash = (uint64_t *)malloc(sizeof(uint64_t) * (BLOCKSIZE - WIN_SIZE));
	// char *ArrayOfChunks[MAX_BOUNDARY];
	char *ArrayOfChunks_LZW[num_cu];
	uint32_t *cdc_offset;   //cdc chunks offset: should be cdc_offset += chunks' size 
	uint16_t *chunk_size = (uint16_t *)malloc(sizeof(uint16_t));      //input chunk size to cdc
	uint16_t *chunk_size_dedup = (uint16_t *)malloc(sizeof(uint16_t));     //input chunk size to dedup
	uint16_t *chunk_size_LZW = (uint16_t *)malloc(sizeof(uint16_t));       //input chunk size to LZW
	char *cdc_finished;         //flag whether cdc has finished: it's the output "pipeline_drained" of cdc
	char *pipeline_drained;     //determine the stage in draining pipeline: 2 -> the last stage of pipeline: only execute LZW or not
	uint num_chunks_total = 0;
	uint16_t *ArrayOfCode[ArrayOfCodeNum];     //Array to store all the codes need to be written to file
											//the first 16bits determine whether the chunk is deduplicated or not: 1 -> dedup; 0 -> LZW
	uint16_t *ArrayOfOutputLength_LZW;     //Array to store the output codes length of each chunk: len=ArrayOfCodeNum`
	uint64_t chunks_idx_offset = 0;
    std::unordered_map<string, uint32_t> chunkTable;     //hash table in dedup
    uint32_t deDup_header;     //output of deDup function    //header from dedup
	uint32_t deDup_header_LZW;      //header propagated to LZW
	uint16_t *LZW_input_length[num_cu];     //the input chunks bytes size of each compute unit
    uint16_t *LZW_output_length[num_cu];    //the output code bytes size of each compute unit
	uint16_t *LZW_send_data[num_cu];        //the output code of each compute unit
	char LZW_chunks_cnt = 0;                //indicates the chunk index in current kernel: 0 -> num_chunks_krnl (the number of chunks each kernel receives)
	uint32_t LZW_chunks_idx[num_cu][num_chunks_krnl];            //store the chunk index of the LZW chunks (needed when writing output code to file)
	char num_used_krnls = 0;                //the number of actual used kernels
	char LZW_done_flg = 0;
    // uint16_t *LZW_send_data = (uint16_t *)calloc(Max_Chunk_Size + 2, sizeof(uint16_t));     //Max_Chunk_Size + 32bits header -> unit is 16bits

	uint boundary_idx = 0;      //used to record boundary number of a packet: 0, 1, 2, ...
	uint32_t krnl_in_offset[num_cu] = {0};    //offset for chunk size of a single kernel: used when store input chunks of one kernel
	char krnl_chunks_cnt[num_cu] = {0};      //count how many chunk a kernel has
	char krnl_idx = 0;              //index for each kernel

	*chunk_size = 0;    //initialize input chunk size
	*chunk_size_dedup = 0;
	*chunk_size_LZW = 0;

	cdc_offset = (uint32_t *)malloc(sizeof(uint32_t));
	cdc_finished = (char *)malloc(sizeof(char));
	pipeline_drained = (char *)malloc(sizeof(char));

	char *chunk_cdc = (char *)malloc(Max_Chunk_Size);    //output chunk from cdc
	char *chunk_dedup = (char *)malloc(Max_Chunk_Size);   //output chunk propagated to dedup
	char *chunk_LZW = (char *)malloc(Max_Chunk_Size);     //output chunk propagated to LZW
	char *chunk_temp = (char *)malloc(Max_Chunk_Size);     //used for pointer exchange for these chunk pointers

	if (cdc_hash  == NULL){
		std::cerr << "Could not malloc cdc_hash." << std::endl;
		exit (EXIT_FAILURE);
	}

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
		std::cerr << "Could not malloc LZW_chunks_cnt chunk_cdc ." << std::endl;
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
		std::cerr << "Could not malloc chunk_temp ." << std::endl;
		exit (EXIT_FAILURE);
	}

	for (int i = 0; i < ArrayOfCodeNum; i++){
		ArrayOfCode[i] = (uint16_t *)calloc(Max_Chunk_Size + 1, sizeof(uint16_t));    //malloc and initialize ArrayOfCode to 0's
		if (ArrayOfCode[i] == NULL){
			std::cerr << "Could not malloc ArrayOfCode[" << i << "]." << std::endl;
			exit (EXIT_FAILURE);
		}
	}

	ArrayOfOutputLength_LZW = (uint16_t *)malloc(sizeof(uint16_t) * ArrayOfCodeNum);
	if (ArrayOfOutputLength_LZW  == NULL){
		std::cerr << "Could not malloc ArrayOfOutputLength_LZW ." << std::endl;
		exit (EXIT_FAILURE);
	}

    timer2.add("Allocate contiguous OpenCL buffers");

	//---: define buffers
	std::vector<cl::Buffer> Input_buf(num_cu);   
	std::vector<cl::Buffer> Output_buf(num_cu);
	std::vector<cl::Buffer> In_length_buf(num_cu);
	std::vector<cl::Buffer> Output_length_buf(num_cu);

	//---: do not need these. Using this will prevent from overlapping. Using q.finish() to sync
/* 	std::vector<cl::Event> write_done(MAX_BOUNDARY);
	// std::vector<cl::Event> write_waitlist;
	std::vector<std::vector<cl::Event>> write_waitlist(num_cu);
	std::vector<std::vector<cl::Event>> execute_waitlist(MAX_BOUNDARY);
	std::vector<cl::Event> execute_done(MAX_BOUNDARY);
	// std::vector<cl::Event> read_waitlist;
	std::vector<std::vector<cl::Event>> read_waitlist(num_cu);
	std::vector<cl::Event> read_done(MAX_BOUNDARY);
 */
	//---: declare buffers size (num_chunks_krnl -> the number of chunks that each kernel receives)
	uint32_t Input_buf_size = Max_Chunk_Size * num_chunks_krnl;
	uint32_t Output_buf_size = (Max_Chunk_Size + 2) * num_chunks_krnl * sizeof(uint16_t);
	uint32_t In_length_buf_size = sizeof(uint16_t) * num_chunks_krnl;
	uint32_t Output_length_buf_size = sizeof(uint16_t) * num_chunks_krnl;

	for (int j = 0; j < num_cu; j++){
		//---: set buffers' properties
		OCL_CHECK(err,
				Input_buf[j] = cl::Buffer(context, CL_MEM_READ_ONLY, Input_buf_size, NULL, &err));
		OCL_CHECK(err,
				Output_buf[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, Output_buf_size, NULL, &err));
		OCL_CHECK(err,
				In_length_buf[j] = cl::Buffer(context, CL_MEM_READ_ONLY, In_length_buf_size, NULL, &err));
		OCL_CHECK(err,
				Output_length_buf[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, Output_length_buf_size, NULL, &err));
		
		//--- : map buffers to local variables
		LZW_send_data[j] = (uint16_t*)q[j].enqueueMapBuffer(Output_buf[j], CL_TRUE, CL_MAP_READ, 0, Output_buf_size, NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map LZW_send_data failed\n");
		LZW_input_length[j] = (uint16_t*)q[j].enqueueMapBuffer(In_length_buf[j], CL_TRUE, CL_MAP_WRITE, 0, In_length_buf_size, NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map LZW_input_length failed\n");
		LZW_output_length[j] = (uint16_t*)q[j].enqueueMapBuffer(Output_length_buf[j], CL_TRUE, CL_MAP_READ, 0, Output_length_buf_size, NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map LZW_output_length failed\n");
	}

	for (int j = 0; j < num_cu; j++){
		ArrayOfChunks_LZW[j] = (char*)q[j].enqueueMapBuffer(Input_buf[j], CL_TRUE, CL_MAP_WRITE, 0, (Max_Chunk_Size * num_chunks_krnl), NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map ArrayOfChunks_LZW failed\n");
	}
	//-----------------------------------------
	//--------------------------------------encode define--------------------------------------------
    FILE *File = fopen(argv[1], "wb");
    if (File == NULL)
        Exit_with_error("fopen for send_data failed");

	//---: declare timers to time functions and total time of encoding process
	stopwatch cdc_timer;
    stopwatch SHA_timer;
    stopwatch deDup_timer;
    stopwatch LZW_timer;
    stopwatch total_timer;

	int deDup_final_bytes = 0; //total bytes of dedup headers
	int LZW_final_bytes = 0;   //total bytes of LZW compressed data
	int LZW_total_input_bytes = 0;   //total bytes of all LZW input chunks  (used for compression ratio & contribution of dedup and LZW)
	std::thread core_1_thread;   //thread 1 in core 1 (for CDC)
	std::thread core_2_thread;   // thread 2 in core 2 (for sha and dedup)
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
	// total_timer.start();
	//last message

	*cdc_offset = 0;         //refresh value before encoding the next packet
	while (!done) {
		// printf("\nenter large while loop\n");

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
		writer++;
		
		// ------------------------------------------------------------------------------------
		// Step 3: Start encoding
		// ------------------------------------------------------------------------------------

		//-------------------------------------start encoding-----------------------------------------------
		//--- define flags for kernel
		uint loop_cnt = 0;          //pipeline while loop's loop index
		*cdc_finished = 0;
		*pipeline_drained = 0;   //refresh pipeline_drained flag to 0
		char num_krnl_loop_wr = 0;      //the number of iteration when writing the codes to file of one kernel
		uint32_t krnl_wr_offset = 0;    //offset for output code size of a single kernel: used when writing output codes to file

		if (count == 2) {
			//--- 2 packet:
			memcpy(&file[offset], &buffer[HEADER], length);
			offset += length;
		}else{
			//--- 1 packet:
			memcpy(&file[offset], &buffer[HEADER], length);
			offset += length;
		}
		
		// printf("before reaching pipeline while loop\n");
		timer2.add("Running the encoding\n");
		total_timer.start();

		while (*pipeline_drained < 3){      //*pipeline_drain = 2 is the last stage (*pipeline_drain++ every iterationwhen cdc finishes)
// printf("\nchunk idx:\t%d:\nchunk for deDup:\n%s\n", boundary_idx - 1,chunk_dedup);
// printf("loop_cnt:\t%d\n", loop_cnt);
			
			/* for (int i = 0; i < Max_Chunk_Size; i++){    //needed when have to print out chunks
				chunk_cdc[i] = 0;
			} */

			if(!(*cdc_finished)){   //if cdc hasn't finished
				if (count == 2) {   //the first two packet enter this situation
					// printf("enter cdc, loop: %d\n", loop_cnt);
					//--- 2 packet:
					/* if (fread(buffer, 1, offset, &file[0]) != offset)
						Exit_with_error("fread for first two packets failed"); */
					// printf("before cdc, loop: %d\n", loop_cnt);
					core_1_thread = std::thread(&cdc, file, offset, chunk_cdc, chunk_size, cdc_offset, cdc_finished, std::ref(cdc_timer), cdc_hash, done);
					num_chunks_total++;
					// printf("after cdc, loop: %d\n", loop_cnt);
					pin_thread_to_cpu(core_1_thread, 1);
					// cdc(file, offset, chunk, chunk_size, cdc_offset, cdc_finished);   //boundary_num should use char?
					/* FILE *outfd = fopen("test_chunks.bin", "wb");
					int bytes_written = fwrite(&file[0], 1, offset, outfd); */
				}else{    //other packets go into here
					//--- 1 packet:

// printf("buffer:%p\n", &buffer[2]);
// printf("length: %d\n", length);
// printf("chunk_cdc:\n%s\n\n", chunk_cdc);
// printf("chunk_size: %d\n", *chunk_size);
// printf("cdc_offset: %d\n", *cdc_offset);
// printf("cdc_finished: %d\n", *cdc_finished);
					core_1_thread = std::thread(&cdc, file, offset, chunk_cdc, chunk_size, cdc_offset, cdc_finished, std::ref(cdc_timer), cdc_hash, done);
					num_chunks_total++;

					pin_thread_to_cpu(core_1_thread, 1);
					// cdc(&buffer[2], length, chunk, chunk_size, cdc_offset, cdc_finished);   //boundary_num should use char?
				}
			}
			// printf("for loop i: %d\n", i);
			if ((loop_cnt > 0) && (*pipeline_drained < 2)){    //dedup start from the second iteration and stop when *pipeline_drain == 1
				// printf("enter deDup, loop: %d\n", loop_cnt);
				// printf("dedup chunk_size: %d, loop: %d\n", *chunk_size_dedup, loop_cnt);
				// printf("chunk dedup:\n%s\n", chunk_cdc);
				core_2_thread = std::thread(&deDup, 
											chunk_dedup, *chunk_size_dedup, std::ref(chunkTable), std::ref(SHA_timer), std::ref(deDup_timer),
											std::ref(deDup_header));
				// printf(" deDup header: %x\n", deDup_header);

				pin_thread_to_cpu(core_2_thread, 2);

				// deDup_header = deDup(chunk_dedup, chunk_size, chunkTable, std::ref(SHA_timer));
				/* if ((deDup_header & 1u)){dd
					// std::cout << "deDup_header - boundary: " << (loop_cnt - 1) << std::endl;
					// printf("-----------------------------------------------\n"); 
					// if (fwrite(&deDup_header, 1, sizeof(deDup_header), File) != sizeof(deDup_header))
					// 	Exit_with_error("fwrite dedup header to compressed_data.bin failed");
					memcpy(ArrayOfCode[loop_cnt - 1] + 1, &deDup_header, sizeof(deDup_header));
					*ArrayOfCode[loop_cnt - 1] = 1;
					deDup_final_bytes += sizeof(deDup_header);
				} */
			}
// printf("before done:\t%d\n", done);	
			// printf("before enter LZW, loop: %d\n", loop_cnt);
			//---: if (the chunk is LZW chunk or the last stage of pipeline) and loop_cnt >= 2  ---> go to LZW part (doesn't mean execute LZW)

			if ((!(deDup_header_LZW & 1u) || ((*pipeline_drained == 2) && done)) && (loop_cnt > 1)){
				//-----------------------map Input Buffer-----------------------------------
				if (!(deDup_header_LZW & 1u)){
					memcpy(ArrayOfChunks_LZW[krnl_idx] + krnl_in_offset[krnl_idx], chunk_LZW, *chunk_size_LZW);   //store chunk to LZW in ArrayOfChunks_LZW
// printf("done:\t%d\n", done);	
// printf("boundary_idx: \t%d\n", boundary_idx);
// printf("num_chunks_total:\t%d\n", num_chunks_total);																				//krnl_idx declare which kernel the chunk should be sent to
					krnl_in_offset[krnl_idx] += *chunk_size_LZW;      //used to move the pointer of ArrayOfChunks_LZW[krnl_idx]
					LZW_input_length[krnl_idx][LZW_chunks_cnt] = *chunk_size_LZW;       //store LZW input chunk length for all kernels
					LZW_chunks_idx[krnl_idx][LZW_chunks_cnt] = chunks_idx_offset + loop_cnt - 2;            //store the LZW chunk index among all chunks
					/* printf("\nLZW_header - boundary:%d\n", LZW_chunks_idx[krnl_idx][LZW_chunks_cnt]);
					printf("-----------------------------------------------\n"); */
					// printf("LZW chunk size: %d\n", *chunk_size_LZW);
					// std::cout << "\n" << "LZW_header - boundary: " << LZW_chunks_idx[LZW_chunks_cnt] << "" << std::endl;
				}

				//------------------------------------------------------------------------------
// printf("enter LZW loop\n");
// printf("debug----------pipeline_drained:\t%d\n", *pipeline_drained);

// printf("debug: kernel idx: %d\n", krnl_idx);
				if (((LZW_chunks_cnt < (num_chunks_krnl - 1)) || (krnl_idx < (num_cu - 1))) && !((*pipeline_drained == 2) && (done))){
					krnl_chunks_cnt[krnl_idx]++;
					krnl_idx++;
					if (krnl_idx == num_cu){
						LZW_chunks_cnt++;
						krnl_idx = 0;
// printf("pipeline drain = %d\n", *pipeline_drained);
// printf("kernel ++\n");
					}
				}else{
					if (!LZW_chunks_cnt){
						if (deDup_header_LZW & 1u){
							num_used_krnls = krnl_idx;
						}else{
							num_used_krnls = krnl_idx + 1;
							krnl_chunks_cnt[krnl_idx]++;
						}
					}else{
						num_used_krnls = num_cu;
						if (!(deDup_header_LZW & 1u)){
							krnl_chunks_cnt[krnl_idx]++;
						}
					}

					for (int i = 0; i < num_used_krnls; i++){
						for (int j = krnl_chunks_cnt[i]; j < num_chunks_krnl; j++){
							LZW_input_length[i][j] = 0;
						}
					}
// printf("\n--------------------------------pipeline_drain: %d\n", *pipeline_drained);
					LZW_timer.start();
					// LZW_output_length = krnl_LZW(ArrayOfChunks[i], in_length, LZW_send_data);
					//--------------------------------kernel computation --------------------------------
					for (int j = 0; j < num_used_krnls; j++){
						// krnl_LZW(ArrayOfChunks_LZW[j], LZW_input_length[j], LZW_send_data[j], LZW_output_length[j]);}				
			 			OCL_CHECK(err, err = krnls[j].setArg(0, Input_buf[j]));
						OCL_CHECK(err, err = krnls[j].setArg(1, In_length_buf[j]));
						OCL_CHECK(err, err = krnls[j].setArg(2, Output_buf[j]));
						OCL_CHECK(err, err = krnls[j].setArg(3,Output_length_buf[j]));

						OCL_CHECK(err, err = q[j].enqueueMigrateMemObjects({In_length_buf[j]}, 0));
						OCL_CHECK(err, err = q[j].enqueueMigrateMemObjects({Input_buf[j]}, 0));
					}

// printf("before kernel\n");
					for (int j = 0; j < num_used_krnls; j++){
						OCL_CHECK(err, err = q[j].finish());	
						OCL_CHECK(err, err = q[j].enqueueTask(krnls[j]));
					}
// printf("after input\n");
					for (int j = 0; j < num_used_krnls; j++){
						OCL_CHECK(err, err = q[j].finish());
						OCL_CHECK(err, err = q[j].enqueueMigrateMemObjects({Output_buf[j], Output_length_buf[j]}, CL_MIGRATE_MEM_OBJECT_HOST));
					}
// printf("after task\n");
					for (int j = 0; j < num_used_krnls; j++){
						OCL_CHECK(err, err = q[j].finish());
					}     					 
					/* for (int j = 0; j < num_used_krnls; j++){
						read_done[j].wait();
					} */
					LZW_timer.stop();

// printf("debug------------num_used_krnls:\t%d\n", num_used_krnls);
					for (int j = 0; j < num_used_krnls; j++){
						num_krnl_loop_wr = krnl_chunks_cnt[j];
// printf("debug------------krnl_chunks_cnt[%d]:\t%d\n", j, krnl_chunks_cnt[j]);
						for (int i = 0; i < num_krnl_loop_wr; i++){
							memcpy(ArrayOfCode[LZW_chunks_idx[j][i]] + 1, (LZW_send_data[j] + krnl_wr_offset), 
								LZW_output_length[j][i]);
							krnl_wr_offset += ((LZW_output_length[j][i] + sizeof(uint16_t) - 1) / sizeof(uint16_t));
// printf("LZW_chunks_idx[%d][%d]: %d\n", j, i, LZW_chunks_idx[j][i]);
							ArrayOfOutputLength_LZW[LZW_chunks_idx[j][i]] = LZW_output_length[j][i];
// printf("LZW_output_length[%d][%d]: %d\n", j, i, LZW_output_length[j][i]);
							/* q.enqueueUnmapMemObject(Input_buf[j], ArrayOfChunks_LZW[j]); */
							LZW_total_input_bytes += LZW_input_length[j][i];
							LZW_final_bytes += LZW_output_length[j][i];
						}
						krnl_wr_offset = 0;
					}

					for (int i = 0; i < num_cu; i++){
						krnl_in_offset[i] = 0;
						krnl_chunks_cnt[i] = 0;
						krnl_in_offset[i] = 0;
					}

					LZW_chunks_cnt = 0;
					krnl_idx = 0;
					// LZW_done_flg = 1;
					// LZW_timer.stop();
				}
// printf("after LZW\n");
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
				memcpy(ArrayOfCode[chunks_idx_offset + loop_cnt - 1] + 1, &deDup_header, sizeof(deDup_header));
				*ArrayOfCode[chunks_idx_offset + loop_cnt - 1] = 1;
				deDup_final_bytes += sizeof(deDup_header);
			}
		
/* 			if (!(deDup_header_LZW & 1u) && (loop_cnt > 1)){
				// printf("LZW_header - boundary:%d\n", (loop_cnt - 2));
			} */
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
				if (*pipeline_drained == 3){
					boundary_idx++;
				}
			}

		}
		total_timer.stop();
		chunks_idx_offset = boundary_idx;

		// boundary_idx = 0;

		if (boundary_idx > (ArrayOfCodeNum - BLOCKSIZE)){
			Exit_with_error("ArrayOfCodeNum is not enough! The chunk number exceeds (ArrayOfCodeNUM - PacketSize). Please expand ArrayOfCode by increasing ArrayOfCodeNum.");
		}
// printf("after a packet\n");
// printf("done: %d\n", done);

		done &= ((offset - *cdc_offset) == 0);
	}					
	//---------------------------------------end encoding----------------------------------------------
	//------ writing output code:
	for (int i = 0; i < boundary_idx; i++){
		if (*ArrayOfCode[i] && 1){
			if (fwrite(ArrayOfCode[i] + 1, 1, sizeof(uint32_t), File) != sizeof(uint32_t))
				Exit_with_error("fwrite dedup header to compressed_data.bin failed");
		}else{
			if (fwrite(ArrayOfCode[i] + 1, 1, ArrayOfOutputLength_LZW[i], File) != ArrayOfOutputLength_LZW[i])
				Exit_with_error("fwrite LZW output to compressed_data.bin failed");
			// printf("ArrayOfOutputLength_LZW[%d]: %d\n", i, ArrayOfOutputLength_LZW[i]);
		}			
	}	
	
	// total_timer.stop();
// printf("outside while loop\n");
	for (int j = 0; j < num_cu; j++){
		q[j].enqueueUnmapMemObject(Input_buf[j], ArrayOfChunks_LZW[j]);
		q[j].enqueueUnmapMemObject(Output_buf[j], LZW_send_data[j]);
		q[j].enqueueUnmapMemObject(In_length_buf[j], LZW_input_length[j]);
		q[j].enqueueUnmapMemObject(Output_length_buf[j], LZW_output_length[j]);
	}
	for (int j = 0; j < num_cu; j++){
		OCL_CHECK(err, err = q[j].finish());
	}
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
	free(cdc_hash);
	// free(chunk_cdc);
	// free(chunk_dedup);
	// free(chunk_LZW);
	// free(chunk_temp);
	for (int i = 0; i < ArrayOfCodeNum; i++){
		// free(ArrayOfChunks[i]);
		free(ArrayOfCode[i]);
	}
	free(ArrayOfOutputLength_LZW);
	// ------------------------------------------------------------------------------------
    // Step 5: Release Allocated Resources
    // ------------------------------------------------------------------------------------
    std::cout << "--------------- Key execution times ---------------"
    << std::endl;
    timer2.print();
	
	 //---------------------------------print functions execution time---------------------------------------------------------
    std::cout << "------------------------------Functions Execution Time-------------------------------" << std::endl;
    std::cout << "Total latency of CDC is: " << cdc_timer.latency() << " ms." << std::endl;
    std::cout << "Total latency of SHA is: " << SHA_timer.latency() << " ms." << std::endl;
    std::cout << "Total latency of deDup is: " << deDup_timer.latency() << " ms." << std::endl;
    std::cout << "Total latency of LZW is: " << LZW_timer.latency() << " ms.\n" << std::endl;
    std::cout << "Total time taken from CDC to get output file is: " << total_timer.latency() << " ms." << std::endl;
	float total_latency = total_timer.latency() / 1000.0;
	float overall_throughput = (offset * 8 / 1000000.0) / total_latency;
	std::cout << "Overall throughput: " << overall_throughput << " Mb/s." << std::endl;
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
	printf("Totoal chunks number is: %d\n", num_chunks_total);
	printf("input file with %dB\n", offset);
	printf("encode file with %dB\n\n", file_size);
	printf("Compressed ratio: %.2f%%\n", (file_size * 100.0 / offset));
	float LZW_contribution = (LZW_total_input_bytes - LZW_final_bytes) * 100.0 / (offset - file_size);
	float deDup_contribution = 100.0 - LZW_contribution;
	printf("Compression Contribution of deDup: %.2f%%\n", deDup_contribution);
	printf("Compression Contribution of LZW: %.2f%%\n", LZW_contribution);
	return 0;
}

