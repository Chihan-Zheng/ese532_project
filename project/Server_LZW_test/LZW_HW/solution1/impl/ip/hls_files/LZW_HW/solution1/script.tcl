############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LZW_HW
set_top krnl_LZW
add_files test_copy.txt
add_files test.txt
add_files stopwatch.h
add_files common/Utilities.h
add_files common/Utilities.cpp
add_files LittlePrince.txt
add_files LZW_hybrid_hash_HW.cpp
add_files Dedup.cpp
add_files Constants.h
add_files Chunk.cpp
add_files -tb baseline.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 150MHz -name default
config_interface -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512 -m_axi_offset slave
config_rtl -register_reset_num 3
config_export -format xo -output /mnt/castor/seas_home/c/chihan/chihan/ese532_project/project/Server_LZW_test/LZW_hybrid_hash_HW.xo -rtl verilog
source "./LZW_HW/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format xo -output /home1/c/chihan/chihan/ese532_project/project/Server_LZW_test/krnl_LZW.xo
