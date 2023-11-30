//#include "Constants.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <math.h>
#include <iostream>
#include <time.h>


#define WIN_SIZE 8
#define PRIME 3
#define MODULUS 1024
#define TARGET 0
#define MAX_BOUNDARY 10000
#define MAX_CHUNK 4096
#define MIN_CHUNK 8
//calculating hash value for window size = WIN_SIZE
uint64_t hash_func(unsigned char *input, unsigned int pos)
{
	uint64_t hash = 0;
	for(int i =  0; i<WIN_SIZE;i++){
		hash += (input[pos + WIN_SIZE - 1 - i]) * pow(PRIME, i+1);
	}
	return hash;
}

//Calculating rolling hash for the input. Once the hash at some point modulus to some number equals
//target 0, or it hits the maximum chunk size, or reach to the end of file(not packet), we call it a boundary.
/*

*/


//Calculating rolling hash for the input. Once the hash at some point modulus to some number equals
//target 0, or it hits the maximum chunk size, we call it a boundary.
int cdc_window(unsigned char *buff, unsigned int buff_size, char** chunk, uint16_t *chunk_size)
{
	uint64_t *hash = (uint64_t *)malloc(sizeof(uint64_t) * (buff_size - WIN_SIZE));
	int boundary_index = 0;
	int previous_boundary = 0;
	std::cout << "---------------------------------Boundary Index--------------------------------------" << std::endl;
    for(unsigned int i = WIN_SIZE; i<buff_size - WIN_SIZE; i++){
		if(i == WIN_SIZE)
		hash[i] = hash_func(buff, WIN_SIZE);
		else
		hash[i] = hash[i-1] * PRIME - buff[i-1]*pow(PRIME, WIN_SIZE+1) + buff[i+WIN_SIZE-1]*PRIME;
		if((((hash[i] % MODULUS) == TARGET)&&(i-previous_boundary>=MIN_CHUNK))||(i-previous_boundary>=MAX_CHUNK)||(i==buff_size-WIN_SIZE-1)) {
		// if((((hash[i] % MODULUS) == TARGET)&&(i-previous_boundary>=MIN_CHUNK))||(i-previous_boundary>=MAX_CHUNK)||(i==buff_size-WIN_SIZE)) {

			printf("The index %d is a boundary\n", i); //Print out the boundary we found.
			chunk[boundary_index] = (char*)malloc(sizeof(char)*MAX_CHUNK);
			if(i<buff_size-WIN_SIZE-1){
				memcpy(chunk[boundary_index], buff+previous_boundary, i-previous_boundary);
				chunk_size[boundary_index] = i - previous_boundary;
			}else{
				memcpy(chunk[boundary_index], buff+previous_boundary, buff_size-previous_boundary);  //because the hash cannot calculate after buff_size-win_size, the last chunk copy will be different.
				chunk_size[boundary_index] = i - previous_boundary + WIN_SIZE + 1;
			}
			previous_boundary = i;
            boundary_index++;
			//printf("The hash calculated at this index is %d\n",hash[i]); //Print out the hash value calculated at this char.
			// printf("The calculated 8 bytes are: %c%c%c%c%c%c%c%c\n",buff[i],buff[i+1],buff[i+2],buff[i+3],buff[i+4],buff[i+5],buff[i+6],buff[i+7]); //print out the 8 characters that hash based on.
        }
		
	}
	free(hash);
	
	return boundary_index;

}
void test_print_chunk(char** chunk, int boundary_num, uint16_t* chunk_size){
	FILE *outfd = fopen("output_cpu.txt", "a+");
	
	for(int i=0;i<boundary_num;i++){
      printf("The chunk %d has content of:\n",i);
	  printf("%s\n",chunk[i]);
	  //int result = fputs(chunk[i],outfd);
	  fprintf(outfd,"%s",chunk[i]);
	  //int bytes_written = fwrite(chunk[i], 1, chunk_size[i], outfd);
	}
	fclose(outfd);
}
//this function simulate a series of packets with random length, not needed in the final implementation
int create_packet(unsigned char* const buff, unsigned char* packet, int* current_position_p, int* packet_length_p, int file_size){
	int current_position = *current_position_p;
	int packet_length = *packet_length_p;
	if((current_position + packet_length)<file_size){
		//memcpy(packet, buff+current_position, packet_length);
		strncpy((char*)(packet), (char*)(buff)+current_position, packet_length);
		current_position += packet_length;
		*current_position_p = current_position;
		printf("Random packet generated:\n");
		printf("%s\n",packet);
		return 0;
	}
	else{
		//memcpy(packet, buff+current_position, (file_size-current_position));
		strncpy((char*)(packet), (char*)(buff)+current_position,(file_size-current_position));
		*current_position_p = file_size;
		*packet_length_p = (file_size-current_position);
		printf("Random packet generated:\n");
		printf("%s\n",packet);
		return 1;
	}

}
//main function for testing. Shouldn't be included in the final interface.
int main()
{
	uint16_t* chunk_size = (uint16_t *)malloc((sizeof(uint16_t) * MAX_BOUNDARY ));
    char *ArrayOfChunks[MAX_BOUNDARY];
/*Simulating packets from file*/
	FILE* fp = fopen("test.txt","r" );
	if(fp == NULL ){
		perror("fopen error");
		return 0;
	}

	fseek(fp, 0, SEEK_END); // seek to end of file
	int file_size = ftell(fp); // get current file pointer
	fseek(fp, 0, SEEK_SET); // seek back to beginning of file

	unsigned char* buff = (unsigned char *)malloc((sizeof(unsigned char) * file_size ));	
	if(buff == NULL)
	{
		perror("not enough space");
		fclose(fp);
		return 0;
	}

	int bytes_read = fread(&buff[0],sizeof(unsigned char),file_size,fp);
	unsigned char* const ready_file = buff; 
	unsigned char* packet;
	int current_position = 0;
	int boundary_num = 0;
	int leftover_position =0;
	//int max_packet_length = 1024;
	while(current_position<file_size){
		time_t t;
		srand((unsigned) time(&t));
		int rand_num = rand();
		printf("random number: %d\n", rand_num);
		int packet_length = (rand_num % 1024) + 1;
		printf("packet length: %d\n", packet_length);
     	packet = (unsigned char *)malloc((sizeof(unsigned char) * (packet_length+1)));
		int is_last_packet = create_packet(ready_file, packet, &current_position, &packet_length, file_size);
		// if already have packet, just call cdc as below, need to supply:
		// a int representing if it is last packet, 1 means last packet.
		// a int initially 0
		// the boundary_num which is also 0 at beginning.
		boundary_num = cdc(packet, packet_length, ArrayOfChunks, chunk_size, is_last_packet, &leftover_position, boundary_num);
		if(!packet){
			free(packet);
		}
	}
	
	test_print_chunk(ArrayOfChunks, boundary_num, chunk_size);
	free(chunk_size);
	return 0;
} 