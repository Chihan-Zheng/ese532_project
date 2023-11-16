#include "Constants.h"

unsigned int my_hash(ap_uint<KEY_LEN> key)
{
    unsigned int hashed = 0;

    for(int i = 0; i < KEY_LEN; i++)
    {
        hashed += (key >> i)&0x01;
        hashed += hashed << 10;
        hashed ^= hashed >> 6;
    }
    hashed += hashed << 3;
    hashed ^= hashed >> 11;
    hashed += hashed << 15;

    return hashed & ((1<<HASH_BIT_NUM) - 1);
    // return hashed & 0x7FFF;          // hash output is 15 bits
}

//****************************************************************************************************************
typedef struct
{   
    // Each key_mem has a 9 bit address (so capacity = 2^9 = 512)
    // and the key is 20 bits, so we need to use 3 key_mems to cover all the key bits.
    // The output width of each of these memories is 64 bits, so we can only store 64 key
    // value pairs in our associative memory map.

    ap_int<ASSOC_MEM_SIZE> upper_key_mem[512]; // the output of these  will be 64 bits wide (size of unsigned long).
    ap_int<ASSOC_MEM_SIZE> middle_key_mem[512];
    ap_int<ASSOC_MEM_SIZE> lower_key_mem[512]; 
    ap_int<CODE_LEN> value[ASSOC_MEM_SIZE];    // value store is 64 deep, because the lookup mems are 64 bits wide
    unsigned int fill;         // tells us how many entries we've currently stored 
} assoc_mem;

//****************************************************************************************************************
uint16_t LZW_hybrid_hash_HW(char in[Max_Chunk_Size], uint16_t in_length, uint16_t *send_data)
{
    // create hash table and assoc mem
    ap_uint<BUCKET_LEN> hash_table[CAPACITY][BUCKETS_NUM];
    assoc_mem my_assoc_mem;

    // make sure the memories are clear
    for(int i = 0; i < CAPACITY; i++){
        for (int j = 0; j < BUCKETS_NUM; j++){
            hash_table[i][j] = 0;
         }
    }

    my_assoc_mem.fill = 0;
    for(int i = 0; i < 512; i++)
    {
        my_assoc_mem.upper_key_mem[i] = 0;
        my_assoc_mem.middle_key_mem[i] = 0;
        my_assoc_mem.lower_key_mem[i] = 0;
    }

    // init the memories with the first 256 codes
 /*    for(unsigned long i = 0; i < 256; i++)
    {
        bool collision = 0;
        ap_uint<KEY_LEN> key = (i << 8) + 0UL; // lower 8 bits are the next char, the upper bits are the prefix code

        // insert(hash_table, &my_assoc_mem, key, i, &collision);
        //-------------------------------------------insert------------------------------------------------------
        // hash_insert(hash_table, key, value, collision);
        //--------------------------hash_insert-----------------------
        //std::cout << "hash_insert():" << std::endl;
        ap_uint<CODE_LEN> value = i;

        for (int i = 0; i < BUCKETS_NUM; i++){
            ap_uint<BUCKET_LEN> lookup = hash_table[my_hash(key)][i];
            ap_uint<1> valid = (lookup >> (KEY_LEN + CODE_LEN)) & 0x1;

            if(!valid)
            {   
                hash_table[my_hash(key)][i] = (1UL << (KEY_LEN + CODE_LEN)) | (value.to_uint() << KEY_LEN) | key;
                collision = 0;
                break;
            }
            collision = 1;
        }
        //-----------------------end hash_insert-------------------------

        if(collision)
        {
            // assoc_insert(mem, key, value, collision);
            //------------------------assoc_insert------------------------------------
            if(my_assoc_mem.fill < ASSOC_MEM_SIZE)
            {
                ap_int<ASSOC_MEM_SIZE> mask = 1;
                my_assoc_mem.upper_key_mem[(key >> 18)%512] |= (mask << my_assoc_mem.fill);  // set the fill'th bit to 1, while preserving everything else
                my_assoc_mem.middle_key_mem[(key >> 9)%512] |= (mask << my_assoc_mem.fill);  // set the fill'th bit to 1, while preserving everything else
                my_assoc_mem.lower_key_mem[(key >> 0)%512] |= (mask << my_assoc_mem.fill);   // set the fill'th bit to 1, while preserving everything else
                my_assoc_mem.value[my_assoc_mem.fill] = value;
                my_assoc_mem.fill++;
                collision = 0;
            }
            else
            {
                collision = 1;
            }
            //------------------------end assoc_insert-------------------------------
        }
        //------------------------------------------end insert-----------------------------------------------------------
    } */
    
    uint16_t store_array[MAX_CHUNK];
    ap_uint<CODE_LEN> next_code = 256;
    ap_uint<CODE_LEN> prefix_code = in[0];
    ap_uint<CODE_LEN> code = 0;
    unsigned char next_char = 0;
    uint16_t j = 0;                   //index of store array (should j++ every time after store)
    unsigned char shift = 0;
    unsigned char shift_offset = 16 - CODE_LEN;
    ap_uint<CODE_LEN> i = 0;

    for (int i = 0; i < (in_length - 1); i++)
    {   
        next_char = in[i + 1];

        bool hit = 0;
        //--------------------------------------------------------------lookup--------------------------------------------------------------------------------
        ap_uint<KEY_LEN> key = (prefix_code.to_uint() << 8) + next_char;
        //-------------------------------hash_lookup-----------------------------------
        for (int j = 0; j < BUCKETS_NUM; j++){
            ap_uint<BUCKET_LEN> lookup = hash_table[my_hash(key)][j];

            // [valid][value][key]
            ap_uint<KEY_LEN> stored_key = lookup & ((1<<KEY_LEN) - 1);       // stored key is 20 bits
            ap_uint<CODE_LEN> value = (lookup >> KEY_LEN) & ((1<<CODE_LEN) - 1);      // value is 12 bits
            ap_uint<1> valid = (lookup >> (KEY_LEN + CODE_LEN)) & 0x1; // valid is 1 bit

            if(valid && (key == stored_key))
            {
                hit = 1;
                code = value;
                break;
            }
        }
    //-------------------------------end hash_lookup-----------------------------------
        if(!hit)
        {
            //-----------------------------assoc_lookup-----------------------
            ap_int<ASSOC_MEM_SIZE> match_high = my_assoc_mem.upper_key_mem[(key >> 18)%512];
            ap_int<ASSOC_MEM_SIZE> match_middle = my_assoc_mem.middle_key_mem[(key >> 9)%512];
            ap_int<ASSOC_MEM_SIZE> match_low  = my_assoc_mem.lower_key_mem[(key >> 0)%512];

            ap_int<ASSOC_MEM_SIZE> match = match_high & match_middle & match_low;

            unsigned int address = 0;
            for(; address < ASSOC_MEM_SIZE; address++)
            {
                if((match >> address) & 0x1)
                {   
                    break;
                }
            }

            if(address != ASSOC_MEM_SIZE)
            {
                code = my_assoc_mem.value[address];
                hit = 1;
            }
            else
            {
                hit = 0;
            }
            //-----------------------------end assoc_lookup--------------------------
        }
        //-------------------------------------------------------end loopup-------------------------------------------------------------------------

        if(!hit)
        {
            uint32_t written_code = prefix_code.to_uint();

            bool collision = 0;
            // insert(hash_table, &my_assoc_mem, (prefix_code << 8) + next_char, next_code, &collision);
            //--------------------------------------------------------------------------------insert-----------------------------------------------------------------------
            // hash_insert(hash_table, key, value, collision);
            //--------------------------hash_insert-----------------------
            for (int j = 0; j < BUCKETS_NUM; j++){
                ap_uint<BUCKET_LEN> lookup = hash_table[my_hash(key)][j];
                ap_uint<1> valid = (lookup >> (KEY_LEN + CODE_LEN)) & 0x1;
                if(!valid)
                {
                    hash_table[my_hash(key)][j] = (1UL << (KEY_LEN + CODE_LEN)) | (next_code.to_uint() << KEY_LEN) | key;
                    collision = 0;
                    break;
                }
                collision = 1;
            }
            //-----------------------end hash_insert-------------------------
            
            if(collision)
            {
                // assoc_insert(mem, key, value, collision);
                //------------------------assoc_insert------------------------------------
                if(my_assoc_mem.fill < ASSOC_MEM_SIZE)
                {
                    ap_int<ASSOC_MEM_SIZE> mask = 1;
                    my_assoc_mem.upper_key_mem[(key >> 18)%512] |= (mask << my_assoc_mem.fill);  // set the fill'th bit to 1, while preserving everything else
                    my_assoc_mem.middle_key_mem[(key >> 9)%512] |= (mask << my_assoc_mem.fill);  // set the fill'th bit to 1, while preserving everything else
                    my_assoc_mem.lower_key_mem[(key >> 0)%512] |= (mask << my_assoc_mem.fill);   // set the fill'th bit to 1, while preserving everything else
                    my_assoc_mem.value[my_assoc_mem.fill] = next_code;
                    my_assoc_mem.fill++;
                    collision = 0;
                }
                else
                {
                    collision = 1;
                }
                //------------------------end assoc_insert-------------------------------
            }
            //------------------------------------------------------------------------end insert----------------------------------------------------------------------------

            if(collision)
            {
                std::cout << "ERROR: FAILED TO INSERT! NO MORE ROOM IN ASSOC MEM!" << std::endl;
                return 1;
            }

            //-------------------------------------insert code to store_array------------------------------------------
            if (j == 0){   //the first code
                shift = shift_offset;
                store_array[0] = prefix_code.to_uint() << shift;
                j++;
            }else{       
                if (shift < CODE_LEN){      //check whether empty space of store_array[j-1] is greater than 13
                    shift = shift + shift_offset;
                    store_array[j] = prefix_code.to_uint() << shift;     //xxxxx00 yyyyyyyy -> xxxxx|yy yyyyyy00 (shift here is 2)
                    shift = 16 - shift;      
                    store_array[j-1] = store_array[j-1] | (prefix_code.to_uint() >> shift);
                    shift = 16 - shift;
                    store_array[j-1] = swap_endian_16(store_array[j-1]);
                    j++;
                }else{
                    char vacant_bit_number = shift - CODE_LEN;      //the rest bits number after code is written to store_array[j-1]
                    store_array[j-1] = store_array[j-1] | (prefix_code.to_uint() << vacant_bit_number);
                    shift = vacant_bit_number;     
                    //do not j++ here 
                }
            }
            //-------------------------------------end insert code to store_array------------------------------------------

            next_code += 1;
            prefix_code = next_char;
        }
        else
        {
            prefix_code = code;
        }
    }

    //deal with the last part of chunk or if there is only one character in chunk
    if (in_length == 1) {      //if chunk length is 1: a single character
        shift = shift + shift_offset;
        store_array[j] = prefix_code.to_uint() << shift;
        store_array[j] = swap_endian_16(store_array[j]);
    }else{ 
        if (shift < CODE_LEN){ 
            shift = shift + shift_offset;
            store_array[j] = prefix_code.to_uint() << shift;
            store_array[j] = swap_endian_16(store_array[j]);
            shift = 16 - shift;
            store_array[j-1] = store_array[j-1] | (prefix_code.to_uint() >> shift);        //store the last part of in
            store_array[j-1] = swap_endian_16(store_array[j-1]);
            shift = 16 - shift;
        }else{
            char vacant_bit_number = shift - CODE_LEN;
            store_array[j-1] = store_array[j-1] | (prefix_code.to_uint() << vacant_bit_number);
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

    std::cout << std::endl << "assoc mem entry count: " << my_assoc_mem.fill << std::endl;
    return (compressed_length + 4);
}
