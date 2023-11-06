# HOST_CXX ?= aarch64-linux-gnu-g++
HOST_CXX ?= g++
RM = rm -f

BASELINE_SOURCES = baseline.cpp Chunk.cpp Dedup.cpp LZW.cpp ./common/Utilities.cpp
BASELINE_OBJECTS =$(BASELINE_SOURCES:.cpp=.o)
BASELINE_EXE = baseline

DECODER_SOURCES = ../Decoder/Decoder.cpp
DECODER_OBJECTS =$(DECODER_SOURCES:.cpp=.o)
DECODER_EXE = decoder

ENDIAN_SOURCES = ./common/check_endian.cpp ./common/Utilities.cpp
ENDIAN_OBJECTS =$(ENDIAN_SOURCES:.cpp=.o)
ENDIAN_EXE = endian

$(BASELINE_EXE): $(BASELINE_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

$(DECODER_EXE): $(DECODER_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

$(ENDIAN_EXE): $(ENDIAN_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

.cpp.o:
	$(HOST_CXX) $(CXXFLAGS) -I./ -I./common/ -c -o "$@" "$<"

clean-baseline:
	-$(RM) $(BASELINE_EXE) $(BASELINE_OBJECTS) 

clean-decoder:
	-$(RM) $(DECODER_EXE) $(DECODER_OBJECTS) 

clean-endian:
	-$(RM) $(ENDIAN_EXE) $(ENDIAN_OBJECTS) 

clean: clean-baseline clean-endian clean-decoder
	-$(RM) *.bin decompressed
