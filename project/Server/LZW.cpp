#include "Constants.h"


/*
    LZW function: For compression
    Input: 
    in: pointer to input chunk under certan HASH
    in_length: length of input chunk
    send_data: the output data: 32bits header + compressed data
*/
uint16_t LZW (char *in, uint16_t in_length, uint16_t *send_data){
    uint16_t dict[DICT_SIZE][256];         //SIZE may be extended in the for loop
    uint16_t store_array[in_length];
    uint16_t code = (uint16_t)*in;    //current code
    uint16_t next_code = 256;         //next new code
    uint8_t next_char = ' ';          //next char of in
    uint16_t temp_code;               //temp to store existed code
    uint16_t j = 0;                   //index of store array (should j++ every time after store)
    unsigned char shift = 0;

    for (int i = 0; i < (in_length - 1); i++){
        next_char = *(in + 1);       //next character
        if (temp_code = dict[code][next_char]){     //check strings exist or not
            code = temp_code;                       //if exists, then go to the code to match next character
        }else{
            if (j == 0){
                shift = 3;
                store_array[0] = code << shift;
            }else{
                shift = shift + 3;
                store_array[j] = code << shift;
                shift = 16 - shift;
                store_array[j-1] = store_array[j-1] | (code >> shift);
                shift = 16 - shift;
                j++;
                
                dict[code][next_char] = next_code++;     //encode new code
                code = next_char;       //restart from the next_character
            }
        }
        in++;
    }
    shift = shift + 3;
    store_array[j] = code << shift;
    shift = 16 - shift;
    store_array[j-1] = store_array[j-1] | (code >> shift);        //store the last part of in

    //-----------------------generate LZW output----------------------------
    uint32_t header = 0;
    uint16_t compressed_length = (j+1) * sizeof(uint16_t);    //j is entry number of store_array

    header = compressed_length << 1;
    memcpy(send_data, &header, 4);
    memcpy(send_data + 4, store_array, compressed_length);
    //-----------------------------------------------------------------------------
    return (compressed_length + 4);
    
}
