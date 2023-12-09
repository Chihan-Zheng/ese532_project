############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Final_Optimization
set_top krnl_LZW
add_files Constants.h
add_files common/EventTimer.cpp
add_files common/EventTimer.h
add_files LZW_hybrid_hash_HW.cpp
add_files common/Utilities.cpp
add_files common/Utilities.h
add_files common/check_endian.cpp
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 150MHz -name default
config_export -format xo -output /mnt/castor/seas_home/c/chihan/chihan/ese532_project/project/Server_HW_final/krnl_LZW.xo -rtl verilog
source "./Final_Optimization/solution1/directives.tcl"
export_design -rtl verilog -format xo -output /mnt/castor/seas_home/c/chihan/chihan/ese532_project/project/Server_HW_final/krnl_LZW.xo
