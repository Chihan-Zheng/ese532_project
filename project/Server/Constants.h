#ifndef SRC_CONSTANTS_
#define SRC_CONSTANTS_

#include "./common/Utilities.h"

#define MAX_DICT_SIZE (8192)    //can start from 256, then extend based on need in LZW for loop
#define CODE_LENGTH (13)
#define Max_Chunk_Size (pow(2, CODE_LENGTH))
#define MAX_BOUNDARY 256

#define WIN_SIZE 8
#define PRIME 3
#define MODULUS 1024
#define TARGET 0
#define MAX_BOUNDARY 256
#define MAX_CHUNK 4096
#define MIN_CHUNK 8

uint64_t hash_func(unsigned char *input, unsigned int pos);
int cdc( const char* file, char** chunk, uint16_t *chunk_size);
uint64_t basicHash(char* input, size_t length);
uint32_t deDup(char* inputChunk, uint16_t chunk_size, std::unordered_map<uint64_t, uint32_t>& chunkTable);
uint16_t LZW (char *in, uint16_t in_length, uint16_t *send_data);

#endif





