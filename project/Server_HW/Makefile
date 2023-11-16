HOST_CXX ?= aarch64-linux-gnu-g++
# HOST_CXX ?= g++
VPP ?= ${XILINX_VITIS}/bin/v++
RM = rm -f
RMDIR = rm -rf

VITIS_PLATFORM = u96v2_sbc_base
VITIS_PLATFORM_DIR = ${PLATFORM_REPO_PATHS}
VITIS_PLATFORM_PATH = $(VITIS_PLATFORM_DIR)/u96v2_sbc_base.xpfm

# host compiler global settings
CXXFLAGS += -O2 -march=armv8-a+simd -mtune=cortex-a53 -std=c++11 -DVITIS_PLATFORM=$(VITIS_PLATFORM) -D__USE_XOPEN2K8 -I$(XILINX_VIVADO)/include/ -I$(VITIS_PLATFORM_DIR)/sw/$(VITIS_PLATFORM)/PetaLinux/sysroot/aarch64-xilinx-linux/usr/include/xrt/ -O2 -g -Wall -c -fmessage-length=0 --sysroot=$(VITIS_PLATFORM_DIR)/sw/$(VITIS_PLATFORM)/PetaLinux/sysroot/aarch64-xilinx-linux
LDFLAGS += -lxilinxopencl -lpthread -lrt -ldl -lcrypt -lstdc++ -L$(VITIS_PLATFORM_DIR)/sw/$(VITIS_PLATFORM)/PetaLinux/sysroot/aarch64-xilinx-linux/usr/lib/ --sysroot=$(VITIS_PLATFORM_DIR)/sw/$(VITIS_PLATFORM)/PetaLinux/sysroot/aarch64-xilinx-linux

# hardware compiler shared settings
VPP_OPTS = --target hw

#
# OpenCL kernel files
#
XO := LZW_hybrid_hash_HW.xo
XCLBIN := LZW_hybrid_hash_HW.xclbin

#
# host files
#
ENCODER_SOURCES = encoder.cpp server.cpp Chunk.cpp Dedup.cpp LZW_hybrid_hash_HW.cpp ./common/Utilities.cpp ./common/EventTimer.cpp
ENCODER_OBJECTS =$(ENCODER_SOURCES:.cpp=.o)
ENCODER_EXE = encoder

BASELINE_SOURCES = baseline.cpp Chunk.cpp Dedup.cpp LZW.cpp ./common/Utilities.cpp
BASELINE_OBJECTS =$(BASELINE_SOURCES:.cpp=.o)
BASELINE_EXE = baseline

CLIENT_SOURCES = ../Client/client.cpp
CLIENT_OBJECTS =$(CLIENT_SOURCES:.cpp=.o)
CLIENT_EXE = client

DECODER_SOURCES = ../Decoder/Decoder.cpp
DECODER_OBJECTS =$(DECODER_SOURCES:.cpp=.o)
DECODER_EXE = decoder

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

all: package/sd_card.img

.cpp.o:
	$(HOST_CXX) $(CXXFLAGS) -I./ -I./common/ -c -o "$@" "$<"

	
# $(XO): ./hls/MatrixMultiplication.cpp
# 	$(VPP) $(VPP_OPTS) -k mmult --compile -I"$(<D)" --config --config ./u96_v2.cfg -o"$@" "$<"

$(XCLBIN): $(XO)
	$(VPP) $(VPP_OPTS) --link --config ./u96_v2.cfg -o"$@" $(+)

package/sd_card.img: $(ENCODER_EXE) $(XCLBIN) xrt.ini
	$(VPP) --package $(VPP_OPTS) --config ./u96_v2.cfg $(XCLBIN) \
	       --package.out_dir package \
	       --package.sd_file $(ENCODER_EXE)\
	       --package.kernel_image $(PLATFORM_REPO_PATHS)/sw/u96v2_sbc_base/PetaLinux/image/image.ub \
	       --package.rootfs ${PLATFORM_REPO_PATHS}/sw/u96v2_sbc_base/PetaLinux/rootfs/rootfs.ext4 \
	       --package.sd_file $(XCLBIN) \
	       --package.sd_file xrt.ini


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
	-$(RM) $(ENCODER_EXE) *.o *.xclbin *.xclbin.sh *.xclbin.info *.xclbin.link_summary* *.compile_summary *.str
	-$(RM) *json *csv *log *summary *.json *.jou
	-$(RMDIR) _x
	-$(RMDIR) .Xil
	-$(RMDIR) .ipcache
	-$(RMDIR) package
