#include "../Constants.h"

int main() {
    union {
        uint32_t i;
        char c[4];
    } endian_test = {0x01020304};

    if (endian_test.c[0] == 1) {
        printf("The CPU runs at Big-Endian\n");
    } else if (endian_test.c[0] == 4) {
        printf("The CPU runs at Little-Endian\n");
    } else {
        printf("Unknown Endian mode\n");
    }

    return 0;
}
