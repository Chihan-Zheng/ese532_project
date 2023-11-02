#include "Constants.h"


int main()
{
    char *ArrayOfChunks[MAX_BOUNDARY];
    std::unordered_map<uint64_t, uint32_t> chunkTable;
    uint32_t deDup_header;     //output of deDup function
    // uint16_t *send_data_arr_total = (unsigned char *)malloc((sizeof(unsigned char) * file_size));  ///
    uint16_t LZW_output_length;        
    uint16_t *LZW_send_data = (uint16_t *)calloc(Max_Chunk_Size + 2, sizeof(uint16_t));     //Max_Chunk_Size + 32bits header -> unit is 16bits

    // if (send_data_arr_total == NULL){
    //     std::cerr << "Could not malloc send_data_arr_total." << std::endl;
    //     exit (EXIT_FAILURE);
    // }



    if (LZW_send_data == NULL){
        std::cerr << "Could not calloc LZW_send_data." << std::endl;
        exit (EXIT_FAILURE);
    }

    FILE *File = fopen("./compressed_data.bin", "wb");
    if (File == NULL)
        Exit_with_error("fopen for send_data failed");

    uint16_t *chunk_size = (uint16_t *)malloc(sizeof(uint16_t) * MAX_CHUNK);
    if (chunk_size == NULL){
        std::cerr << "Could not calloc chunk_size." << std::endl;
        exit (EXIT_FAILURE);
    }

    int boundary_num = cdc("LittlePrince.txt", ArrayOfChunks, chunk_size);   //boundary_num should use char?
    // int arr_offset = 0;
    std::cout << "chunk number: " << boundary_num << std::endl;
	for (int i = 0; i < boundary_num; i++){
        deDup_header = deDup(ArrayOfChunks[i], chunk_size[i], chunkTable);
        if (deDup_header & 1u){
            std::cout << "deDup_header - boundary: " << i << std::endl;
            if (fwrite(&deDup_header, 1, sizeof(deDup_header), File) != sizeof(deDup_header))
                Exit_with_error("fwrite dedup header to compressed_data.bin failed");
            // memcpy(send_data_arr_total + arr_offset, &deDup_header, sizeof(deDup_header));
            // arr_offset += sizeof(deDup_header) / 2;
        }else{
            std::cout << "LZW_header - boundary: " << i << std::endl;
            int in_length = chunk_size[i];
            LZW_output_length = LZW(ArrayOfChunks[i], in_length, LZW_send_data);
            if (fwrite(LZW_send_data, 1, LZW_output_length, File) != LZW_output_length)
                Exit_with_error("fwrite LZW output to compressed_data.bin failed");
            // memcpy(send_data_arr_total + arr_offset, LZW_send_data, LZW_output_length);
            // arr_offset += LZW_output_length / 2;
        }
    }

    if (fclose(File) != 0)
    Exit_with_error("fclose for send_data failed");



	return 0;
}