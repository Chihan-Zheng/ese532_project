#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "Constants.h"


/*
    LZW function: For compression
    Input: 
    in: pointer to input chunk under certan HASH
    store_array: pointer to array under certain HASH ->char* HASH_CHUNKS[MAX_HASH_SIZE] 
                                                     -> store_array = HASH_CHUNKS[some hash]
    in_length: length of input chunk
*/
uint16_t LZW (char *in, int in_length, char *send_data){
    uint16_t dict[DICT_SIZE][256];         //SIZE may be extended in the for loop
    char store_array[in_length];
    uint16_t code = (uint16_t)*in;    //current code
    uint16_t next_code = 256;         //next new code
    uint8_t next_char = ' ';          //next char of in
    uint16_t temp_code;               //temp to store existed code
    uint16_t j = 0;                   //index of store array (should j++ every time after store)

    for (int i = 0; i < (in_length - 1); i++){
        next_char = *(in + 1);       //next character
        if (temp_code = dict[code][next_char]){     //check strings exist or not
            code = temp_code;                       //if exists, then go to the code to match next character
        }else{
            store_array[j++] = code;        //store code (output code)
            dict[code][next_char] = next_code++;     //encode new code
            code = next_char;       //restart from the next_character
        }
        in++;
    }
    store_array[j++] = code;        //store the last part of in

    uint32_t header = 0;
    uint16_t compressed_length = 0;
    compressed_length = sizeof(store_array);

    // char LZW_output[4 + compressed_length];      //8bits boundary
    header = compressed_length << 1;
    memcpy(send_data, &header, 4);
    memcpy(send_data, store_array, compressed_length);

    return (compressed_length + 4);

}
