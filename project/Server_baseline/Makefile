HOST_CXX ?= aarch64-linux-gnu-g++
# HOST_CXX ?= g++
RM = rm -f

BASELINE_SOURCES = baseline.cpp Chunk.cpp Dedup.cpp LZW.cpp ./common/Utilities.cpp
BASELINE_OBJECTS =$(BASELINE_SOURCES:.cpp=.o)
BASELINE_EXE = baseline

CLIENT_SOURCES = ../Client/client.cpp
CLIENT_OBJECTS =$(CLIENT_SOURCES:.cpp=.o)
CLIENT_EXE = client

DECODER_SOURCES = ../Decoder/Decoder.cpp
DECODER_OBJECTS =$(DECODER_SOURCES:.cpp=.o)
DECODER_EXE = decoder

ENCODER_SOURCES = encoder.cpp server.cpp Chunk.cpp Dedup.cpp LZW.cpp ./common/Utilities.cpp
ENCODER_OBJECTS =$(ENCODER_SOURCES:.cpp=.o)
ENCODER_EXE = encoder

ENDIAN_SOURCES = ./common/check_endian.cpp ./common/Utilities.cpp
ENDIAN_OBJECTS =$(ENDIAN_SOURCES:.cpp=.o)
ENDIAN_EXE = endian

$(BASELINE_EXE): $(BASELINE_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

$(CLIENT_EXE): $(CLIENT_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

$(DECODER_EXE): $(DECODER_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

$(ENCODER_EXE): $(ENCODER_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

$(ENDIAN_EXE): $(ENDIAN_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

.cpp.o:
	$(HOST_CXX) $(CXXFLAGS) -I./ -I./common/ -c -o "$@" "$<"

clean-baseline:
	-$(RM) $(BASELINE_EXE) $(BASELINE_OBJECTS) 

clean-client:
	-$(RM) $(CLIENT_EXE) $(CLIENT_OBJECTS) 

clean-decoder:
	-$(RM) $(DECODER_EXE) $(DECODER_OBJECTS) 

clean-encoder:
	-$(RM) $(ENCODER_EXE) $(ENCODER_OBJECTS) 

clean-endian:
	-$(RM) $(ENDIAN_EXE) $(ENDIAN_OBJECTS) 

clean: clean-baseline clean-endian clean-decoder clean-encoder 
	-$(RM) *.bin decompressed
