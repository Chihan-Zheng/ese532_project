#include <math.h>

#define DICT_SIZE (8192)    //can start from 256, then extend based on need in LZW for loop
#define CODE_LENGTH (13)
#define Max_Chunk_Size (pow(2, CODE_LENGTH))
