#include "Constants.h"

/* current status */
/* The code is tested using the provided “LittlePrince.txt” and Benjamin Franklin’s autobiography. 
The current cdc algorithm will modulate the hash value by MODULUS and as long as the result equals 0,
it will take the index as a boundary. So the cdc works, but the chunk it produces will not likely be 
duplicated. We can play with the window size/modulus/max chunk size to see if it can be improved.
Nota that we are sending a array of char arrays.
*/


// #define WIN_SIZE 8
// #define PRIME 3
// #define MODULUS 1024
// #define TARGET 0
// #define MAX_BOUNDARY 256
// #define MAX_CHUNK 4096
// #define MIN_CHUNK 8
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
//target 0, or it hits the maximum chunk size, we call it a boundary.
void cdc_window(unsigned char *buff, unsigned int buff_size, char* chunk, uint16_t *chunk_size, uint16_t *offset_buff, char *pipeline_drained)
{
    unsigned char *buff_new = buff + &offset_buff;
    unsigned int buff_size_new = buff_size - &offset_buff;
    
	uint64_t *hash = (uint64_t *)malloc(sizeof(uint64_t) * (buff_size_new - WIN_SIZE));
    
	std::cout << "---------------------------------Boundary Index--------------------------------------" << std::endl;
    for(unsigned int i = WIN_SIZE; i<buff_size_new - WIN_SIZE; i++){
		if(i == WIN_SIZE)
		hash[i] = hash_func(buff_new, WIN_SIZE);
		else
		hash[i] = hash[i-1] * PRIME - buff_new[i-1]*pow(PRIME, WIN_SIZE+1) + buff_new[i+WIN_SIZE-1]*PRIME;
		if((((hash[i] % MODULUS) == TARGET)&&(i>=MIN_CHUNK))||(i>=MAX_CHUNK)||(i==buff_size_new-WIN_SIZE-1)) {
		// if((((hash[i] % MODULUS) == TARGET)&&(i-previous_boundary>=MIN_CHUNK))||(i-previous_boundary>=MAX_CHUNK)||(i==buff_size_new-WIN_SIZE)) {

			printf("The index %d is a boundary\n", i + &offset_buff + 1); //Print out the boundary we found.
			chunk = (char*)malloc(sizeof(char)*MAX_CHUNK);
			if(i<buff_size_new-WIN_SIZE-1){
				memcpy(chunk, buff_new, i);
				*chunk_size = i;
			}else{
				memcpy(chunk, buff_new, buff_size_new);  //because the hash cannot calculate after buff_size_new-win_size, the last chunk copy will be different.
				*chunk_size = i + WIN_SIZE + 1;
                &pipeline_drained = 1;
			}
            
            &offset_buff += i;
			//printf("The hash calculated at this index is %d\n",hash[i]); //Print out the hash value calculated at this char.
			// printf("The calculated 8 bytes are: %c%c%c%c%c%c%c%c\n",buff[i],buff[i+1],buff[i+2],buff[i+3],buff[i+4],buff[i+5],buff[i+6],buff[i+7]); //print out the 8 characters that hash based on.
        }
		
	}
	free(hash);
}
//read the input file and call the rolling hash function.
// int cdc( const char* file, char** chunk, uint16_t *chunk_size)
void cdc( unsigned char* buff, int buff_size, char* chunk, uint16_t *chunk_size, uint16_t *offset_buff, char *pipeline_drained)
{
	// FILE* fp = fopen(file,"r" );
	// if(fp == NULL ){
	// 	perror("fopen error");
	// 	return 0;
	// }

	// fseek(fp, 0, SEEK_END); // seek to end of file
	// int file_size = ftell(fp); // get current file pointer
	// fseek(fp, 0, SEEK_SET); // seek back to beginning of file

	// unsigned char* buff = (unsigned char *)malloc((sizeof(unsigned char) * file_size ));	
	// if(buff == NULL)
	// {
	// 	perror("not enough space");
	// 	fclose(fp);
	// 	return 0;
	// }

	// int bytes_read = fread(&buff[0],sizeof(unsigned char),file_size,fp);
	
	cdc_window(buff,  buff_size, chunk, chunk_size, offset_buff, pipeline_drained);

    // free(buff);
}

/* void test_print_chunk(char** chunk, int boundary_num){
	for(int i=0;i<boundary_num;i++){
      printf("The chunk %d has content of:\n",i);
	  printf("%s\n",chunk[i]);
	}
	
} */
//main function for testing. Shouldn't be included in the final interface.
/* int main()
{
	uint16_t chunk_size;
    char *ArrayOfChunks[MAX_BOUNDARY];
	int boundary_num = cdc("test.txt", ArrayOfChunks, &chunk_size);
	test_print_chunk(ArrayOfChunks, boundary_num);
	return 0;
} */
