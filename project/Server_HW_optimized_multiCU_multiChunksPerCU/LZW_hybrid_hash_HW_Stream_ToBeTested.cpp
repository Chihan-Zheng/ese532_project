#include "Constants.h"
#include <hls_stream.h>

/* uint16_t swap_endian_16(uint16_t value) {
    return (value >> 8) | (value << 8);
}
 */
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

static void read_input(char *in, uint16_t input_length, 
                        hls::stream<char>& inStream_in){
    mem_rd:
        for (int i = 0; i < input_length; i++){
            // #pragma HLS loop_tripcount min = input_length max = input_length
            inStream_in << in[i];
        }
}

void compute_LZW(hls::stream<char>& inStream_in, uint16_t input_length,
                 hls::stream<ap_uint<CODE_LEN>>& outStream_code, hls::stream<char>& outStream_code_flg){
    // #pragma HLS interface m_axi port=in bundle=aximm1
    // #pragma HLS interface m_axi port=input_length bundle=aximm1
    // #pragma HLS interface m_axi port=send_data bundle=aximm2
    // #pragma HLS interface m_axi port=output_length bundle=aximm2
    // #pragma HLS dataflow

    uint16_t in_length = input_length;
    // create hash table and assoc mem
    ap_uint<BUCKET_LEN> hash_table[CAPACITY][BUCKETS_NUM];
    // #pragma HLS array_partition variable=hash_table block factor=128 dim=1
    assoc_mem my_assoc_mem;
    // #pragma HLS array_partition variable=my_assoc_mem.upper_key_mem complete
    // #pragma HLS array_partition variable=my_assoc_mem.middle_key_mem complete
    // #pragma HLS array_partition variable=my_assoc_mem.lower_key_mem complete

    // make sure the memories are clear
    for(int i = 0; i < CAPACITY; i++){
        // #pragma HLS unroll factor=128
        for (int j = 0; j < BUCKETS_NUM; j++){
            hash_table[i][j] = 0;
        }
    }

    my_assoc_mem.fill = 0;
    for(int i = 0; i < 512; i++)
    {
        #pragma HLS unroll
        my_assoc_mem.upper_key_mem[i] = 0;
        my_assoc_mem.middle_key_mem[i] = 0;
        my_assoc_mem.lower_key_mem[i] = 0;
    }

    uint16_t store_array[MAX_CHUNK];
    ap_uint<CODE_LEN> next_code = 256;
    ap_uint<CODE_LEN> prefix_code = inStream_in.read();
    ap_uint<CODE_LEN> code = 0;
    unsigned char next_char = 0;
    uint16_t j = 0;                   //index of store array (should j++ every time after store)
    unsigned char shift = 0;
    unsigned char shift_offset = 16 - CODE_LEN;
    ap_uint<CODE_LEN> i = 0;

    for (int i = 0; i < (in_length - 1); i++)
    {   
        // #pragma HLS loop_tripcount min = (in_length - 1) max = (in_length - 1)
        next_char = inStream_in.read();

        bool hit = 0;
        //--------------------------------------------------------------lookup--------------------------------------------------------------------------------
        ap_uint<KEY_LEN> key = (prefix_code.to_uint() << 8) + next_char;
        //-------------------------------hash_lookup-----------------------------------
        for (int j = 0; j < BUCKETS_NUM; j++){
            // #pragma HLS unroll
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

            unsigned int address;
            for(address = 0; address < ASSOC_MEM_SIZE; address++)
            {
                // #pragma HLS unroll
                // #pragma HLS pipeline
                // if((match >> address) & 0x1)
                if(match.test(address))
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
                #pragma HLS unroll
                ap_uint<BUCKET_LEN> lookup = hash_table[my_hash(key)][j];
                ap_uint<1> valid = (lookup >> (KEY_LEN + CODE_LEN)) & 0x1;
                if(!valid)
                {
                    hash_table[my_hash(key)][j] = (1UL << (KEY_LEN + CODE_LEN)) | (next_code.to_uint64() << KEY_LEN) | key;
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
                // return 1;
            }

            //-------------------------------------insert code to store_array------------------------------------------
            outStream_code << prefix_code;
            outStream_code_flg << 1;
            //-------------------------------------end insert code to store_array------------------------------------------

            next_code += 1;
            prefix_code = next_char;
        }
        else
        {
            prefix_code = code;
        }
    }
    outStream_code << prefix_code;
    outStream_code_flg << 0;

}

static void write_result(hls::stream<ap_uint<CODE_LEN>>& outStream_code, hls::stream<ap_uint<CODE_LEN>>& outStream_code_flg, 
                        uint16_t *send_data, uint16_t *output_length){
    
    uint16_t j = 0;                   //index of store array (should j++ every time after store)
    unsigned char shift = 0;
    unsigned char shift_offset = 16 - CODE_LEN;
    ap_uint<CODE_LEN> prefix_code;
    while(outStream_code_flg.read()){
        prefix_code = outStream_code.read();
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
    }
    //deal with the last part of chunk or if there is only one character in chunk
    prefix_code = outStream_code.read();
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
    *output_length = compressed_length + 4;
    // return (compressed_length + 4);

}

//****************************************************************************************************************
void krnl_LZW(char *in, uint16_t *input_length, uint16_t *send_data, uint16_t *output_length)
{
    static hls::stream<char> inStream_in("in_stream");
    static hls::stream<ap_uint<CODE_LEN>> outStream_code("outStream_code");
    static hls::stream<char> outStream_code_flg("outStream_code_flg");
    #pragma HLS interface m_axi port=in bundle=aximm0
    #pragma HLS interface m_axi port=input_length bundle=aximm1
    #pragma HLS interface m_axi port=send_data bundle=aximm1
    #pragma HLS interface m_axi port=output_length bundle=aximm0
    #pragma HLS stream variable = inStream_in
    #pragma HLS stream variable = outStream_code
    #pragma HLS stream variable = outStream_code_flg
    #pragma HLS dataflow

    char num_chunks = 0;
    uint32_t input_offset = 0;
    uint32_t output_offset = 0;
    uint16_t input_length_temp[num_chunks_krnl];

    for (int i = 0; i < num_chunks_krnl; i++){
        if (input_length[i]){
            num_chunks++;
            input_length_temp[i] = input_length[i];
        }
    }

    for (int i = 0; i < num_chunks; i++){
        read_input((in + input_offset), input_length_temp[i], inStream_in);
        compute_LZW(inStream_in, input_length_temp[i], outStream_code, outStream_code_flg);
        write_result(outStream_code, outStream_code_flg, (send_data + output_offset), &output_length[i])

        input_offset += input_length_temp[i];
        output_offset += (output_length[i] + sizeof(uint16_t) - 1) / sizeof(uint16_t);   //ceil(a/b) = (a+b-1)/b
    }
}