#include "Constants.h"


int main()
{
    char *ArrayOfChunks[MAX_BOUNDARY];
    std::unordered_map<string, uint32_t> chunkTable;
    uint32_t deDup_header;     //output of deDup function
    // uint16_t *send_data_arr_total = (unsigned char *)malloc((sizeof(unsigned char) * file_size));  ///
    char LZW_inChunk[MAX_CHUNK];
    uint16_t LZW_output_length;        
    uint16_t LZW_send_data[Max_Chunk_Size + 2];     //Max_Chunk_Size + 32bits header -> unit is 16bits

    // if (send_data_arr_total == NULL){
    //     std::cerr << "Could not malloc send_data_arr_total." << std::endl;
    //     exit (EXIT_FAILURE);
    // }

    if (LZW_send_data == NULL){
        std::cerr << "Could not calloc LZW_send_data." << std::endl;
        exit (EXIT_FAILURE);
    }

    FILE *File = fopen("./compressed_data.bin", "wb");
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

    total_timer.start();
    cdc_timer.start();
    int boundary_num = cdc("LittlePrince.txt", ArrayOfChunks, chunk_size);   //boundary_num should use char?
    cdc_timer.stop();
    // int arr_offset = 0;
    std::cout << "-------------------------------Chunks Info-------------------------------------" << std::endl;
    std::cout << "chunk number: " << boundary_num << std::endl;
	for (int i = 0; i < boundary_num; i++){
        deDup_timer.start();
        deDup_header = deDup(ArrayOfChunks[i], chunk_size[i], chunkTable, std::ref(SHA_timer));
        deDup_timer.stop();
        if (deDup_header & 1u){
            // deDup_header = swap_endian_32(deDup_header);   //do not swap endian for header
            std::cout << "deDup_header - boundary: " << i << std::endl;
            if (fwrite(&deDup_header, 1, sizeof(deDup_header), File) != sizeof(deDup_header))
                Exit_with_error("fwrite dedup header to compressed_data.bin failed");
            deDup_final_bytes += sizeof(deDup_header);
            // memcpy(send_data_arr_total + arr_offset, &deDup_header, sizeof(deDup_header));
            // arr_offset += sizeof(deDup_header) / 2;
        }else{
            std::cout << "\n" << "LZW_header - boundary: " << i << std::endl;
            uint16_t in_length = chunk_size[i];
            uint16_t LZW_output_length = 0;
            
            LZW_timer.start();
            LZW_hybrid_hash_HW(ArrayOfChunks[i], &in_length, LZW_send_data, &LZW_output_length);
            LZW_timer.stop();
            std::cout << "LZW_output_length[" << i << "]: " << LZW_output_length << "\n" <<std::endl;
            if (fwrite(LZW_send_data, 1, LZW_output_length, File) != LZW_output_length)
                Exit_with_error("fwrite LZW output to compressed_data.bin failed");
            memset(LZW_send_data, 0, (Max_Chunk_Size + 2) * sizeof(uint16_t));
            LZW_total_input_bytes += in_length;
			LZW_final_bytes += LZW_output_length;

            // memcpy(send_data_arr_total + arr_offset, LZW_send_data, LZW_output_length);
            // arr_offset += LZW_output_length / 2;
        }
    }
    
    fseek(File, 0, SEEK_END); // seek to end of file
	int file_size = ftell(File); // get current file pointer
	fseek(File, 0, SEEK_SET); // seek back to beginning of file

    if (fclose(File) != 0)
        Exit_with_error("fclose for send_data failed");
    total_timer.stop();
    
    //---------------------------------print time and compress ratio---------------------------------------
    std::cout << "------------------------------Function Execution Time-------------------------------" << std::endl;
    std::cout << "Total latency of CDC is: " << cdc_timer.latency() << " ms." << std::endl;
    std::cout << "Total latency of SHA is: " << SHA_timer.latency() << " ms." << std::endl;
    std::cout << "Total latency of deDup is: " << deDup_timer.latency() << " ms." << std::endl;
    std::cout << "Total latency of LZW is: " << LZW_timer.latency() << " ms." << std::endl;
    std::cout << "Total time taken from CDC to get output file is: " << total_timer.latency() << " ms." << std::endl;
    std::cout << "------------------------------------------------------------------------------------" << std::endl;
    std::cout << "Average latency of SHA is: " << SHA_timer.avg_latency() << " ms." << std::endl;
    std::cout << "Average latency of deDup is: " << deDup_timer.avg_latency() << " ms." << std::endl;
    std::cout << "Average latency of LZW is: " << LZW_timer.avg_latency() << " ms." << std::endl;
    std::cout << "-----------------------------------Compress Ratio-----------------------------------" << std::endl;
    FILE* input_file = fopen("LittlePrince.txt","r");
	if(input_file == NULL ){
		perror("fopen error");
		return 0;
	}
	fseek(input_file, 0, SEEK_END); // seek to end of file
	int input_file_size = ftell(input_file); // get current file pointer
	fseek(input_file, 0, SEEK_SET); // seek back to beginning of file
    if (fclose(input_file) != 0)
    	Exit_with_error("fclose for input_file failed");
    printf("input file with %dB\n", input_file_size);
	printf("encode file with %dB\n", file_size);
	printf("Compressed ratio: %.2f%%\n", (file_size * 100.0 / input_file_size));
    float LZW_contribution = (LZW_total_input_bytes - LZW_final_bytes) * 100.0 / (input_file_size - file_size);
	float deDup_contribution = 100.0 - LZW_contribution;
	printf("Compression Contribution of deDup: %.2f%%\n", deDup_contribution);
	printf("Compression Contribution of LZW: %.2f%%\n", LZW_contribution);
    std::cout << "-----------------------------------------------------------------------------------" << std::endl;
    //-------------------------------end of print time---------------------------------------




//-------------------------------- for testing one character: a(LZW) ---------------------------------
/*     FILE* fp = fopen("LZW_test.txt","r" );
	if(fp == NULL ){
		perror("fopen error");
		return 0;
	}

	fseek(fp, 0, SEEK_END); // seek to end of file
	int file_size = ftell(fp); // get current file pointer
	fseek(fp, 0, SEEK_SET); // seek back to beginning of file

	char* buff = (char *)malloc((sizeof(unsigned char) * file_size ));	
	if(buff == NULL)
	{
		perror("not enough space");
		fclose(fp);
		return 0;
	}

	int bytes_read = fread(&buff[0],sizeof(unsigned char),file_size,fp);
 
    uint16_t *LZW_send_data = (uint16_t *)calloc(Max_Chunk_Size + 2, sizeof(uint16_t));
    uint16_t in_length = file_size;
    uint16_t LZW_output_length;  


    FILE *File = fopen("./compressed_data.bin", "wb");
    if (File == NULL)
        Exit_with_error("fopen for send_data failed");

    LZW_output_length = LZW(buff, in_length, LZW_send_data);
    std::cout << "input buff: " << buff << std::endl;
    std::cout << "compressed length: " << LZW_output_length << std::endl;

    for (int i = 0; i < LZW_output_length / 2; i++){
        std::cout << "send_data[" << i << "]: "<< LZW_send_data[i] << std::endl;
    }

    if (fwrite(LZW_send_data, 1, LZW_output_length, File) != LZW_output_length)
        Exit_with_error("fwrite LZW output to compressed_data.bin failed");

    if (fclose(File) != 0)
        Exit_with_error("fclose for send_data failed"); */
//------------------------------------------ end of test --------------------------------------------------


	return 0;
}
