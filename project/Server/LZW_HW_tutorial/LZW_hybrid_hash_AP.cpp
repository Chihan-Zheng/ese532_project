#include <iostream>
#include <vector>
#include <unordered_map>
#include <stdlib.h>
#include <fstream>
#include <sstream>
#include "ap_int.h"
//****************************************************************************************************************
#define HASH_BIT_NUM 15
#define CAPACITY (1 << HASH_BIT_NUM) // hash output is 15 bits, and we have 1 entry per bucket, so capacity is 2^15
#define KEY_LEN 20
#define BUCKETS_NUM 3
#define CODE_LEN 13
#define BUCKET_LEN (KEY_LEN + CODE_LEN + 1)

#define MATCH_UNITS_COLUMN_NUM 1
#define ASSOC_MEM_SIZE (72 * MATCH_UNITS_COLUMN_NUM)
// #define CAPACITY 4096
// try  uncommenting the line above and commenting line 6 to make the hash table smaller 
// and see what happens to the number of entries in the assoc mem 
// (make sure to also comment line 27 and uncomment line 28)

void Exit_with_error(const char *s)
{
    printf("%s\n", s);
    exit(EXIT_FAILURE);
}

unsigned int my_hash(ap_uint<KEY_LEN> key)
{
    key &= (1<<KEY_LEN) - 1; // make sure the key is only 20 bits

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
    // return hashed & 0xFFF;   
}

void hash_lookup(ap_uint<BUCKET_LEN> hash_table[CAPACITY][BUCKETS_NUM], ap_uint<KEY_LEN> key, 
                bool* hit, ap_uint<CODE_LEN>* result)
{
    //std::cout << "hash_lookup():" << std::endl;
    key &= (1<<KEY_LEN) - 1; // make sure key is only 20 bits 

    for (int i = 0; i < BUCKETS_NUM; i++){
        ap_uint<BUCKET_LEN> lookup = hash_table[my_hash(key)][i];

        // [valid][value][key]
        ap_uint<KEY_LEN> stored_key = lookup & ((1<<KEY_LEN) - 1);       // stored key is 20 bits
        ap_uint<CODE_LEN> value = (lookup >> KEY_LEN) & ((1<<CODE_LEN) - 1);      // value is 12 bits
        ap_uint<1> valid = (lookup >> (KEY_LEN + CODE_LEN)) & 0x1; // valid is 1 bit

        if(valid && (key == stored_key))
        {
            *hit = 1;
            *result = value;
            return;
            //std::cout << "\thit the hash" << std::endl;
            //std::cout << "\t(k,v,h) = " << key << " " << value << " " << my_hash(key) << std::endl;
        }
    }

    //the hash table does not have the key
    *hit = 0;
    *result = 0;
    //std::cout << "\tmissed the hash" << std::endl;
    
}

void hash_insert(ap_uint<BUCKET_LEN> hash_table[CAPACITY][BUCKETS_NUM], ap_uint<KEY_LEN> key, 
                ap_uint<CODE_LEN> value, bool* collision)
{
    //std::cout << "hash_insert():" << std::endl;
    key &= (1<<KEY_LEN) - 1;   // make sure key is only 20 bits
    value &= (1<<CODE_LEN) - 1;   // value is only 13 bits

    for (int i = 0; i < BUCKETS_NUM; i++){
        ap_uint<BUCKET_LEN> lookup = hash_table[my_hash(key)][i];
        ap_uint<1> valid = (lookup >> (KEY_LEN + CODE_LEN)) & 0x1;

        if(!valid)
        {
            hash_table[my_hash(key)][i] = (1UL << (KEY_LEN + CODE_LEN)) | (value << KEY_LEN) | key;
            *collision = 0;
            //std::cout << "\tinserted into the hash table\tBucket: " << i << std::endl;
            //std::cout << "\t(k,v,h) = " << key << " " << value << " " << my_hash(key) << std::endl;
            return;
        }
    }

    *collision = 1;
    //std::cout << "\tcollision in the hash" << std::endl;
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

// cast to struct and use ap types to pull out various fields.

void assoc_insert(assoc_mem* mem, ap_uint<KEY_LEN> key, ap_uint<CODE_LEN> value, bool* collision)
{
    //std::cout << "assoc_insert():" << std::endl;
    key &= (1<<KEY_LEN) - 1; // make sure key is only 20 bits
    value &= (1<<CODE_LEN) - 1;   // value is only 12 bits

    if(mem->fill < ASSOC_MEM_SIZE)
    {
        mem->upper_key_mem[(key >> 18)%512] |= (1 << mem->fill);  // set the fill'th bit to 1, while preserving everything else
        mem->middle_key_mem[(key >> 9)%512] |= (1 << mem->fill);  // set the fill'th bit to 1, while preserving everything else
        mem->lower_key_mem[(key >> 0)%512] |= (1 << mem->fill);   // set the fill'th bit to 1, while preserving everything else
        mem->value[mem->fill] = value;
        mem->fill++;
        *collision = 0;
        //std::cout << "\tinserted into the assoc mem" << std::endl;
        //std::cout << "\t(k,v) = " << key << " " << value << std::endl;
    }
    else
    {
        *collision = 1;
        //std::cout << "\tcollision in the assoc mem" << std::endl;
    }
}

void assoc_lookup(assoc_mem* mem, ap_uint<KEY_LEN> key, bool* hit, ap_uint<CODE_LEN>* result)
{
    //std::cout << "assoc_lookup():" << std::endl;
    key &= (1<<KEY_LEN) - 1; // make sure key is only 20 bits

    ap_int<ASSOC_MEM_SIZE> match_high = mem->upper_key_mem[(key >> 18)%512];
    ap_int<ASSOC_MEM_SIZE> match_middle = mem->middle_key_mem[(key >> 9)%512];
    ap_int<ASSOC_MEM_SIZE> match_low  = mem->lower_key_mem[(key >> 0)%512];

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
        *result = mem->value[address];
        *hit = 1;
        //std::cout << "\thit the assoc" << std::endl;
        //std::cout << "\t(k,v) = " << key << " " << *result << std::endl;
    }
    else
    {
        *hit = 0;
        //std::cout << "\tmissed the assoc" << std::endl;
    }
}
//****************************************************************************************************************
void insert(ap_uint<BUCKET_LEN> hash_table[CAPACITY][BUCKETS_NUM], assoc_mem* mem, ap_uint<KEY_LEN> key, 
            ap_uint<CODE_LEN> value, bool* collision)
{
    hash_insert(hash_table, key, value, collision);
    if(*collision)
    {
        assoc_insert(mem, key, value, collision);
    }
}

void lookup(ap_uint<BUCKET_LEN> hash_table[CAPACITY][BUCKETS_NUM], assoc_mem* mem, 
            ap_uint<KEY_LEN> key, bool* hit, ap_uint<CODE_LEN>* result)
{
    hash_lookup(hash_table, key, hit, result);
    if(!*hit)
    {
        assoc_lookup(mem, key, hit, result);
    }
}
//****************************************************************************************************************
void hardware_encoding(std::string s1)
{
    FILE *file_hw = fopen("./compressed_data.bin", "wb");
    if (file_hw == NULL){
        printf("cannot open file_hw\n");
    }

    // create hash table and assoc mem
    // unsigned long hash_table[CAPACITY];
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
    for(unsigned long i = 0; i < 256; i++)
    {
        bool collision = 0;
        ap_uint<KEY_LEN> key = (i << 8) + 0UL; // lower 8 bits are the next char, the upper bits are the prefix code
        insert(hash_table, &my_assoc_mem, key, i, &collision);
    }
    ap_uint<CODE_LEN> next_code = 256;


    ap_uint<CODE_LEN> prefix_code = s1[0];
    ap_uint<CODE_LEN> code = 0;
    unsigned char next_char = 0;

    ap_uint<CODE_LEN> i = 0;
    while(i < s1.length())
    {
        if(i + 1 == s1.length())
        {
            uint32_t written_code = prefix_code.to_uint();
            std::cout << written_code;
            std::cout << "\n";
            if (fwrite(&written_code, 1, 4, file_hw) != 4)
                Exit_with_error("fwrite LZW output to compressed_data.bin failed");
            break;
        }
        next_char = s1[i + 1];

        bool hit = 0;
        //std::cout << "prefix_code " << prefix_code << " next_char " << next_char << std::endl;
        lookup(hash_table, &my_assoc_mem, (prefix_code << 8) + next_char, &hit, &code);
        if(!hit)
        {
            uint32_t written_code = prefix_code.to_uint();
            std::cout << written_code;
            std::cout << "\n";
            if (fwrite(&written_code, 1, 4, file_hw) != 4)
                Exit_with_error("fwrite LZW output to compressed_data.bin failed");

            bool collision = 0;
            insert(hash_table, &my_assoc_mem, (prefix_code << 8) + next_char, next_code, &collision);
            if(collision)
            {
                std::cout << "ERROR: FAILED TO INSERT! NO MORE ROOM IN ASSOC MEM!" << std::endl;
                return;
            }
            next_code += 1;

            prefix_code = next_char;
        }
        else
        {
            prefix_code = code;
        }
        i += 1;
    }
    std::cout << std::endl << "assoc mem entry count: " << my_assoc_mem.fill << std::endl;
}
//****************************************************************************************************************
// "Golden" functions to check correctness
std::vector<int> encoding(std::string s1)
{
    FILE *file_golden = fopen("./compressed_data_golden.bin", "wb");
    if (file_golden == NULL){
        printf("cannot open file_golden\n");
    }

    std::cout << "Encoding\n";
    std::unordered_map<std::string, int> table;
    for (int i = 0; i <= 255; i++) {
        std::string ch = "";
        ch += char(i);
        table[ch] = i;
    }
 
    std::string p = "", c = "";
    p += s1[0];
    int code = 256;
    std::vector<int> output_code;
    std::cout << "String\tOutput_Code\tAddition\n";
    for (int i = 0; i < s1.length(); i++) {
        if (i != s1.length() - 1)
            c += s1[i + 1];
        if (table.find(p + c) != table.end()) {
            p = p + c;
        }
        else {
            std::cout << p << "\t" << table[p] << "\t\t"
                 << p + c << "\t" << code << std::endl;
            output_code.push_back(table[p]);
            table[p + c] = code;
            code++;
            p = c;
        }
        c = "";
    }
    std::cout << p << "\t" << table[p] << std::endl;
    output_code.push_back(table[p]);

    for (int i = 0; i < output_code.size(); i++) {
        if (fwrite(&output_code[i], 1, 4, file_golden) != 4)
            Exit_with_error("fwrite LZW output to compressed_data_golden.bin failed");
    }

    return output_code;
}

void decoding(std::vector<int> op)
{
    std::cout << "\nDecoding\n";
    std::unordered_map<int, std::string> table;
    for (int i = 0; i <= 255; i++) {
        std::string ch = "";
        ch += char(i);
        table[i] = ch;
    }
    int old = op[0], n;
    std::string s = table[old];
    std::string c = "";
    c += s[0];
    std::cout << s;
    int count = 256;
    for (int i = 0; i < op.size() - 1; i++) {
        n = op[i + 1];
        if (table.find(n) == table.end()) {
            s = table[old];
            s = s + c;
        }
        else {
            s = table[n];
        }
        std::cout << s;
        c = "";
        c += s[0];
        table[count] = table[old] + c;
        count++;
        old = n;
    }
}
//****************************************************************************************************************
int main()
{

    std::string s = "WYS*WYGWYS*WYSWYSG";

/*     std::ifstream file("./LittlePrince.txt");
    std::stringstream buffer;
    buffer << file.rdbuf();
    std::string s = buffer.str();
    if (!file) {
        std::cerr << "cannot open file" << std::endl;
        return 1;
    } */

    std::cout << "Our message is: " << s << std::endl << std::endl;
    std::cout << "Running the software compression we get: " << std::endl;

    std::vector<int> output_code = encoding(s);
    std::cout << "The compressed output stream is: ";
    for (int i = 0; i < output_code.size(); i++) {
        std::cout << output_code[i] << " ";
    }
    std::cout << std::endl << std::endl;

    std::cout << "Running the hardware version we get " << std::endl;
    std::cout << "The compressed output stream is: " << std::endl;
    hardware_encoding(s);
    return 0;
}