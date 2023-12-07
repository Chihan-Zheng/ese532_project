############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Optimized_Project
set_top LZW_hybrid_hash_HW
add_files Chunk.cpp
add_files Constants.h
add_files Dedup.cpp
add_files common/EventTimer.cpp
add_files common/EventTimer.h
add_files LZW_hybrid_hash_HW.cpp
add_files LittlePrince.txt
add_files common/Utilities.cpp
add_files common/Utilities.h
add_files common/check_endian.cpp
add_files server.h
add_files sha256.h
add_files stopwatch.h
add_files test.txt
add_files -tb baseline.cpp
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 150MHz -name default
#source "./Optimized_Project/solution1/directives.tcl"
export_design -rtl verilog -format xo -output /mnt/castor/seas_home/c/chihan/chihan/ese532_project/project/Server_HW_optimized/LZW_hybrid_hash_HW.xo
