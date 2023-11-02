#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "Constants.h"

int main()
{
    unsigned char *ArrayOfChunks[MAX_BOUNDARY];
	int boundary_num = cdc("LittlePrince.txt", ArrayOfChunks);
    std::unordered_map<uint64_t, uint32_t> chunkTable;
    uint32_t send_data;
    uint32_t *send_data_arr;
    uint32_t *LZW_output_arr;
    uint16_t LZW_output_length;
	for (int i = 0; i < boundary_num; i++){
        send_data = deDup(ArrayOfChunks[i], chunkTable);
        if (send_data & 1u){
            memcpy(send_data_arr, &send_data, sizeof(send_data));
            // send_data_arr[i] = send_data;
        }else{
            int in_length = sizeof(ArrayOfChunks[i]);
            LZW_output_length = LZW (ArrayOfChunks[i], in_length, LZW_output_arr);
            memcpy(send_data_arr, LZW_output_arr, LZW_output_length);
        }
    }






	return 0;
}