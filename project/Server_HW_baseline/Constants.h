#ifndef SRC_CONSTANTS_
#define SRC_CONSTANTS_

#include "./common/Utilities.h"

#define MAX_DICT_SIZE (8192)    //can start from 256, then extend based on need in LZW for loop
#define CODE_LEN 13
#define Max_Chunk_Size (1 << CODE_LEN)

#define WIN_SIZE 8
#define PRIME 3
#define MODULUS 1024
#define TARGET 0
#define MAX_BOUNDARY 512
#define MAX_CHUNK 4096
#define MIN_CHUNK 8

#define HASH_BIT_NUM 15
#define CAPACITY (1 << HASH_BIT_NUM) // hash output is 15 bits, and we have 1 entry per bucket, so capacity is 2^15
#define KEY_LEN (CODE_LEN + 8)
#define BUCKETS_NUM 1
#define BUCKET_LEN (KEY_LEN + CODE_LEN + 1)

#define MATCH_UNITS_COLUMN_NUM 1
#define ASSOC_MEM_SIZE (72 * MATCH_UNITS_COLUMN_NUM)

uint64_t hash_func(unsigned char *input, unsigned int pos);
int cdc( unsigned char* buff, int buff_size, unsigned char** chunk, uint16_t *chunk_size);
uint64_t basicHash(unsigned char* input, size_t length);
uint32_t deDup(unsigned char* inputChunk, uint16_t chunk_size, 
               std::unordered_map<string, uint32_t>& chunkTable, stopwatch& stopwatch);
unsigned int my_hash(ap_uint<KEY_LEN> key);
void LZW_hybrid_hash_HW(unsigned char *in, uint16_t *input_length, 
                        uint16_t *send_data, uint16_t *output_length);

#endif





