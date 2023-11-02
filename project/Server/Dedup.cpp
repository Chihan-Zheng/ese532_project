uint64_t basicHash(const char* input, size_t length) {
    uint64_t hash = 0;

    for (size_t i = 0; i < length; i++) {
        hash += static_cast <uint64_t>(input[i]);
    }
    return hash;
}

uint32_t deDup(const char* inputChunk, 
    std::unordered_map<uint64_t, uint32_t>& chunkTable) {
        size_t length = sizeof(inputChunk)/sizeof(char);
        uint64_t hash = basicHash(inputChunk, length);
        auto it = chunkTable.find(hash);

        if (it == chunkTable.end()) {
            uint32_t newIndex = static_cast<uint32_t>(chunkTable.size());
            chunkTable[hash] = newIndex;
            return (newIndex << 1);
        } else {
            return (it->second << 1) | 1u;
        }

}