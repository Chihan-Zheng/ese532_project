#ifndef SRC_CONSTANTS_
#define SRC_CONSTANTS_

#include "./common/Utilities.h"

#define DICT_SIZE (8192)    //can start from 256, then extend based on need in LZW for loop
#define CODE_LENGTH (13)
#define Max_Chunk_Size (pow(2, CODE_LENGTH))
#define MAX_BOUNDARY 256


int cdc( const char* file, char** chunk);
uint32_t deDup(char* inputChunk, std::unordered_map<uint64_t, uint32_t>& chunkTable);
uint16_t LZW (char *in, uint16_t in_length, uint16_t *send_data);

#endif





