# HOST_CXX ?= aarch64-linux-gnu-g++
HOST_CXX ?= g++
RM = rm -f

LZW_SOURCES = LZW_hybrid_hash_AP.cpp
LZW_OBJECTS =$(LZW_SOURCES:.cpp=.o)
LZW_EXE = LZW


$(LZW_EXE): $(LZW_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)


.cpp.o:
	$(HOST_CXX) $(CXXFLAGS) -I./ -c -o "$@" "$<"

clean-LZW:
	-$(RM) $(LZW_EXE) $(LZW_OBJECTS) 


clean: clean-LZW
	-$(RM) *.bin
