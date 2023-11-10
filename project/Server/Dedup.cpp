#include "Constants.h"
#include "stopwatch.h"
#include <iomanip>
#include <sstream>
#include <vector>

using namespace std;

string hexconvert(unsigned char* bytes, int size) {
    stringstream ss;
    ss << hex << setfill('0');
    for (int i = 0; i < size; i++) {
        ss << setw(2) << static_cast<int>(bytes[i]);
    }
    return ss.str();
}

uint32_t deDup(char* inputChunk, uint16_t chunk_size,
    std::unordered_map<string, uint32_t>& chunkTable,
    stopwatch& stopwatch) {
    unsigned char uinputChunk[static_cast<int>(chunk_size)];
    for (size_t i = 0; i < chunk_size; i++) {
            uinputChunk[i] = static_cast<unsigned char>(inputChunk[i]);
        }
    
        //size_t length = sizeof(inputChunk)/sizeof(char);
        //size_t length = chunk_size;
    BYTE buf[SHA256_BLOCK_SIZE];
    SHA256_CTX ctx;
        stopwatch.start();
    sha256_hash(&ctx, uinputChunk, buf, 1);
    string hash = hexconvert(buf, SHA256_BLOCK_SIZE);
        stopwatch.stop();
        auto it = chunkTable.find(hash);

        if (it == chunkTable.end()) {
            uint32_t newIndex = static_cast<uint32_t>(chunkTable.size());
            chunkTable[hash] = newIndex;
            return (newIndex << 1);
        } else {
            return (it->second << 1) | 1u;
        }

}
