#ifndef SRC_UTILITIES_
#define SRC_UTILITIES_

#include <math.h>
#include <unordered_map>
#include <iostream>
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

void Exit_with_error(const char *s);
void send_data(unsigned char *Data, uint16_t Data_size);

#endif


