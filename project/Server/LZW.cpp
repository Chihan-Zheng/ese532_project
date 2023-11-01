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
void LZW (char *in, char *store_array, int in_length){
    uint16_t dict[DICT_SIZE][256];         //SIZE may be extended in the for loop
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
}
