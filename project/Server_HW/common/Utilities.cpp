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

uint16_t swap_endian_16(uint16_t value) {
    return (value >> 8) | (value << 8);
}

uint32_t swap_endian_32(uint32_t value) {
    return ((value & 0x000000FF) << 24) |
           ((value & 0x0000FF00) << 8) |
           ((value & 0x00FF0000) >> 8) |
           ((value & 0xFF000000) >> 24);
}

<<<<<<< HEAD
// std::vector<cl::Device> get_xilinx_devices() 
// {
//     size_t i;
//     cl_int err;
//     std::vector<cl::Platform> platforms;
//     err = cl::Platform::get(&platforms);
//     cl::Platform platform;
//     for (i  = 0 ; i < platforms.size(); i++){
//         platform = platforms[i];
//         std::string platformName = platform.getInfo<CL_PLATFORM_NAME>(&err);
//         if (platformName == "Xilinx"){
//             std::cout << "INFO: Found Xilinx Platform" << std::endl;
//             break;
//         }
//     }
//     if (i == platforms.size()) {
//         std::cout << "ERROR: Failed to find Xilinx platform" << std::endl;
//         exit(EXIT_FAILURE);
//     }
   
//     //Getting ACCELERATOR Devices and selecting 1st such device 
//     std::vector<cl::Device> devices;
//     err = platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &devices);
//     return devices;
// }
   
// char* read_binary_file(const std::string &xclbin_file_name, unsigned &nb) 
// {
//     if(access(xclbin_file_name.c_str(), R_OK) != 0) {
//         printf("ERROR: %s xclbin not available please build\n", xclbin_file_name.c_str());
//         exit(EXIT_FAILURE);
//     }
//     //Loading XCL Bin into char buffer 
//     std::cout << "INFO: Loading '" << xclbin_file_name << "'\n";
//     std::ifstream bin_file(xclbin_file_name.c_str(), std::ifstream::binary);
//     bin_file.seekg (0, bin_file.end);
//     nb = bin_file.tellg();
//     bin_file.seekg (0, bin_file.beg);
//     char *buf = new char [nb];
//     bin_file.read(buf, nb);
//     return buf;
// }
=======
std::vector<cl::Device> get_xilinx_devices() 
{
    size_t i;
    cl_int err;
    std::vector<cl::Platform> platforms;
    err = cl::Platform::get(&platforms);
    cl::Platform platform;
    for (i  = 0 ; i < platforms.size(); i++){
        platform = platforms[i];
        std::string platformName = platform.getInfo<CL_PLATFORM_NAME>(&err);
        if (platformName == "Xilinx"){
            std::cout << "INFO: Found Xilinx Platform" << std::endl;
            break;
        }
    }
    if (i == platforms.size()) {
        std::cout << "ERROR: Failed to find Xilinx platform" << std::endl;
        exit(EXIT_FAILURE);
    }
   
    //Getting ACCELERATOR Devices and selecting 1st such device 
    std::vector<cl::Device> devices;
    err = platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &devices);
    return devices;
}
   
char* read_binary_file(const std::string &xclbin_file_name, unsigned &nb) 
{
    if(access(xclbin_file_name.c_str(), R_OK) != 0) {
        printf("ERROR: %s xclbin not available please build\n", xclbin_file_name.c_str());
        exit(EXIT_FAILURE);
    }
    //Loading XCL Bin into char buffer 
    std::cout << "INFO: Loading '" << xclbin_file_name << "'\n";
    std::ifstream bin_file(xclbin_file_name.c_str(), std::ifstream::binary);
    bin_file.seekg (0, bin_file.end);
    nb = bin_file.tellg();
    bin_file.seekg (0, bin_file.beg);
    char *buf = new char [nb];
    bin_file.read(buf, nb);
    return buf;
}
>>>>>>> 314965f16d086b39c2e58cfebd64e021f58dfd5d
