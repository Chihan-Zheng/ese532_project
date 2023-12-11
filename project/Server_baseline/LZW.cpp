#include "Constants.h"


/*
    LZW function: For compression
    Input: 
    in: pointer to input chunk under certan HASH
    in_length: length of input chunk
    send_data: the output data: 32bits header + compressed data
*/
uint16_t LZW (char *in, uint16_t in_length, uint16_t *send_data){
    uint16_t dict[MAX_DICT_SIZE][256] = {0};         //SIZE may be extended in the for loop
    uint16_t store_array[in_length] = {0};
    uint16_t code = (uint16_t)*in;    //current code
    uint16_t next_code = 256;         //next new code
    uint8_t next_char = ' ';          //next char of in
    uint16_t temp_code;               //temp to store existed code
    uint16_t j = 0;                   //index of store array (should j++ every time after store)
    unsigned char shift = 0;

    /* std::cout << "input chunk length: " << in_length <<std::endl; */
    for (int i = 0; i < (in_length - 1); i++){
        next_char = *(in + i + 1);       //next character
        if ((temp_code = dict[code][next_char]) != 0){     //check strings exist or not
            code = temp_code;                       //if exists, then go to the code to match next character
        }else{
            if (j == 0){   //the first code
                shift = 3;
                store_array[0] = code << shift;
                // std::cout << "code: " << next_code << std::endl;
                dict[code][next_char] = next_code++;     //encode new code
                code = next_char;       //restart from the next_character
                j++;
            }else{       
                if (shift < 13){      //check whether empty space of store_array[j-1] is greater than 13
                    shift = shift + 3;
                    store_array[j] = code << shift;     //xxxxx00 yyyyyyyy -> xxxxx|yy yyyyyy00 (shift here is 2)
                    shift = 16 - shift;      
                    store_array[j-1] = store_array[j-1] | (code >> shift);
                    shift = 16 - shift;
                    store_array[j-1] = swap_endian_16(store_array[j-1]);
                    j++;
                }else{
                    char vacant_bit_number = shift - 13;      //the rest bits number after code is written to store_array[j-1]
                    store_array[j-1] = store_array[j-1] | (code << vacant_bit_number);
                    shift = vacant_bit_number;     
                    //do not j++ here 
                }
                // printf("shift: %d\n", shift);
                // std::cout << "code: " << next_code << std::endl;
                dict[code][next_char] = next_code++;     //encode new code
                code = next_char;       //restart from the next_character
            }
        }
    }
    //deal with the last part of chunk or if there is only one character in chunk
    if (in_length == 1) {      //if chunk length is 1: a single character
        shift = shift + 3;
        store_array[j] = code << shift;
        store_array[j] = swap_endian_16(store_array[j]);
    }else{ 
        if (shift < 13){ 
            shift = shift + 3;
            store_array[j] = code << shift;
            store_array[j] = swap_endian_16(store_array[j]);
            shift = 16 - shift;
            store_array[j-1] = store_array[j-1] | (code >> shift);        //store the last part of in
            store_array[j-1] = swap_endian_16(store_array[j-1]);
            shift = 16 - shift;
        }else{
            char vacant_bit_number = shift - 13;
            store_array[j-1] = store_array[j-1] | (code << vacant_bit_number);
            store_array[j-1] = swap_endian_16(store_array[j-1]);
            j = j - 1;
            shift = vacant_bit_number;
        }
    }

    //-----------------------generate LZW output----------------------------
    uint32_t header = 0;
    uint16_t compressed_length = (j+1) * sizeof(uint16_t);    //j is entry number of store_array

    if (shift >= 8){
        compressed_length = compressed_length - 1;
    }
    header = compressed_length << 1;
    // header = swap_endian_32(header);    //do not swap endian for header
    memcpy(send_data, &header, 4);
    memcpy(send_data + 2, store_array, compressed_length);
    //-----------------------------------------------------------------------------
    return (compressed_length + 4);
    
}
