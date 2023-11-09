#include "encoder.h"

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include "server.h"
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "stopwatch.h"
#include "Constants.h"

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
	stopwatch ethernet_timer;
	unsigned char* input[NUM_PACKETS];
	int writer = 0;
	int done = 0;
	int length = 0;
	int count = 0;
	ESE532_Server server;

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

	//last message
	while (!done) {
		printf("Reach while loop\n");
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
		memcpy(&file[offset], &buffer[HEADER], length);

		offset += length;
		writer++;
	}
	//----------------------------------encode-------------------------------------------
	char *ArrayOfChunks[MAX_BOUNDARY];
    std::unordered_map<uint64_t, uint32_t> chunkTable;
    uint32_t deDup_header;     //output of deDup function
    uint16_t LZW_output_length;        
    uint16_t *LZW_send_data = (uint16_t *)calloc(Max_Chunk_Size + 2, sizeof(uint16_t));     //Max_Chunk_Size + 32bits header -> unit is 16bits

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

	FILE *input_file = fopen("input_text.txt", "wb");
	int bytes_written = fwrite(&file[0], 1, offset, input_file);
    int boundary_num = cdc("input_text.txt", ArrayOfChunks, chunk_size);   //boundary_num should use char?
    std::cout << "chunk number: " << boundary_num << std::endl;
	for (int i = 0; i < boundary_num; i++){
        deDup_header = deDup(ArrayOfChunks[i], chunk_size[i], chunkTable);
        if (deDup_header & 1u){
            std::cout << "deDup_header - boundary: " << i << std::endl;
            if (fwrite(&deDup_header, 1, sizeof(deDup_header), File) != sizeof(deDup_header))
                Exit_with_error("fwrite dedup header to compressed_data.bin failed");
        }else{
            std::cout << "LZW_header - boundary: " << i << std::endl;
            uint16_t in_length = chunk_size[i];
            LZW_output_length = LZW(ArrayOfChunks[i], in_length, LZW_send_data);
            std::cout << "LZW_output_length[" << i << "]: " << LZW_output_length << "\n" <<std::endl;
            if (fwrite(LZW_send_data, 1, LZW_output_length, File) != LZW_output_length)
                Exit_with_error("fwrite LZW output to compressed_data.bin failed");
            memset(LZW_send_data, 0, (Max_Chunk_Size + 2) * sizeof(uint16_t));
        }
    }
	fseek(File, 0, SEEK_END); // seek to end of file
	int file_size = ftell(File); // get current file pointer
	fseek(File, 0, SEEK_SET); // seek back to beginning of file

    if (fclose(File) != 0)
    Exit_with_error("fclose for send_data failed");
	//----------------------------------end of encode-------------------------------------------

	// // write file to root and you can use diff tool on board
	// FILE *outfd = fopen("output_cpu.bin", "wb");
	// int bytes_written = fwrite(&file[0], 1, offset, outfd);
	// printf("write file with %d\n", bytes_written);
	// fclose(outfd);
	printf("input file with %dB\n", offset);
	printf("encode file with %dB\n", file_size);
	printf("Compressed ratio: %d%\n", (file_size * 100 / offset));

	for (int i = 0; i < NUM_PACKETS; i++) {
		free(input[i]);
	}

	free(file);
	std::cout << "--------------- Key Throughputs ---------------" << std::endl;
	float ethernet_latency = ethernet_timer.latency() / 1000.0;
	// float input_throughput = (bytes_written * 8 / 1000000.0) / ethernet_latency; // Mb/s
	float input_throughput = (offset * 8 / 1000000.0) / ethernet_latency; // Mb/s
	std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
			<< " (Latency: " << ethernet_latency << "s)." << std::endl;

	return 0;
}

