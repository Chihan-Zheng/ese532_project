#include "Utilities.h"

void Exit_with_error(const char *s)
{
    printf("%s\n", s);
    exit(EXIT_FAILURE);
}

void send_data(unsigned char *Data, uint16_t Data_size)
{

    FILE *File = fopen("./compressed_data.bin", "wb");
    if (File == NULL)
        Exit_with_error("fopen for send_data failed");

    if (fwrite(Data, 1, Data_size, File) != Data_size)
        Exit_with_error("fwrite for send_data failed");

    // if (fclose(File) != 0)
    //     Exit_with_error("fclose for send_data failed");
}