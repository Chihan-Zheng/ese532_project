#ifndef F2995ADE_7DAE_4116_9B07_0B4B963D88DA
#define F2995ADE_7DAE_4116_9B07_0B4B963D88DA
#ifndef SRC_UTILITIES_
#define SRC_UTILITIES_

#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

// OCL_CHECK doesn't work if call has templatized function call
#define OCL_CHECK(error, call)                                                 \
  call;                                                                        \
  if (error != CL_SUCCESS) {                                                   \
    printf("%s:%d Error calling " #call ", error code is: %d\n", __FILE__,     \
           __LINE__, error);                                                   \
    exit(EXIT_FAILURE);                                                        \
  }


// #include <math.h>
#include <unordered_map>
#include <iostream>
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
using namespace std;
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "../stopwatch.h"
#include <functional>
#include <fstream>
#include <sstream>
// #include <ap_int.h>
#include <CL/cl2.hpp>
#include "EventTimer.h"
#include "../server.h"
#include <pthread.h>
#include <errno.h>
#include <sys/mman.h>
#include "../encoder.h"
#include <thread>




void Exit_with_error(const char *s);
void send_data(unsigned char *Data, uint16_t Data_size);
uint16_t swap_endian_16(uint16_t value);
uint32_t swap_endian_32(uint32_t value);
std::vector<cl::Device> get_xilinx_devices();
char* read_binary_file(const std::string &xclbin_file_name, unsigned &nb);
void pin_thread_to_cpu(std::thread &t, int cpu_num);
void pin_main_thread_to_cpu0();

#endif


#endif /* F2995ADE_7DAE_4116_9B07_0B4B963D88DA */
