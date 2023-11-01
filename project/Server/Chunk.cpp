#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <iostream>

#define WIN_SIZE 8
#define PRIME 3
#define MODULUS 1024
#define TARGET 0
#define MAX_BOUNDARY 256
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

//This is just to print the chunk for testing
void print_chunk(unsigned char* buff, unsigned int* chunk_boundaries, int boundary_index){
	printf("The chunk %d has the content of:\n",boundary_index-1);
	for(int x = chunk_boundaries[boundary_index-1];x<chunk_boundaries[boundary_index];x++){
		printf("%c",buff[x]);
	}
	printf("\n");
}
//Calculating rolling hash for the input. Once the hash at some point modulus to some number equals
//target 0, or it hits the maximum chunk size, we call it a boundary.
void cdc_window(unsigned char *buff, unsigned int buff_size, unsigned int* chunk_boundaries)
{
	uint64_t *hash = (uint64_t *)malloc(sizeof(uint64_t) * (buff_size - WIN_SIZE));
	int boundary_index = 1;
	chunk_boundaries[0] = 0;
    for(unsigned int i = WIN_SIZE; i<buff_size - WIN_SIZE; i++){
		if(i == WIN_SIZE)
		hash[i] = hash_func(buff, WIN_SIZE);
		else
		hash[i] = hash[i-1] * PRIME - buff[i-1]*pow(PRIME, WIN_SIZE+1) + buff[i+WIN_SIZE-1]*PRIME;
		if((((hash[i] % MODULUS) == TARGET)&&(i-chunk_boundaries[boundary_index-1]>=MIN_CHUNK))||(i-chunk_boundaries[boundary_index-1]>=MAX_CHUNK)) {
            chunk_boundaries[boundary_index] = i;
            printf("The index %d is a boundary\n", i);
			printf("The hash calculated at this index is %d\n",hash[i]);
			printf("The calculated 8 bytes are: %c%c%c%c%c%c%c%c\n",buff[i],buff[i+1],buff[i+2],buff[i+3],buff[i+4],buff[i+5],buff[i+6],buff[i+7]);
			//print_chunk(buff, chunk_boundaries,boundary_index);
            boundary_index++;
        }
		
	}
	free(hash);

}
//read the input file and call the rolling hash function.
void cdc( const char* file, unsigned int* chunk_boundaries )
{
	FILE* fp = fopen(file,"r" );
	if(fp == NULL ){
		perror("fopen error");
		return;
	}

	fseek(fp, 0, SEEK_END); // seek to end of file
	int file_size = ftell(fp); // get current file pointer
	fseek(fp, 0, SEEK_SET); // seek back to beginning of file

	unsigned char* buff = (unsigned char *)malloc((sizeof(unsigned char) * file_size ));	
	if(buff == NULL)
	{
		perror("not enough space");
		fclose(fp);
		return;
	}

	int bytes_read = fread(&buff[0],sizeof(unsigned char),file_size,fp);

	cdc_window(buff, file_size,chunk_boundaries);

    free(buff);
    return;
}
//main function for testing. Shouldn't be included in the final interface.
int main()
{
	unsigned int* chunk_boundaries = (unsigned int*)malloc(sizeof(unsigned int) * MAX_BOUNDARY); 
    cdc("test.txt",chunk_boundaries);
	free(chunk_boundaries);
	return 0;
}