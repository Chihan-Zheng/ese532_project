############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Demo_kernel
set_top krnl_LZW
add_files common/check_endian.cpp
add_files common/Utilities.h
add_files common/Utilities.cpp
add_files LZW_hybrid_hash_HW.cpp
add_files common/EventTimer.h
add_files common/EventTimer.cpp
add_files Constants.h
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 150MHz -name default
config_rtl -register_reset_num 3
config_interface -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512 -m_axi_offset slave
config_export -format xo -output /mnt/castor/seas_home/c/chihan/chihan/ese532_project/project/Demo/krnl_LZW.xo -rtl verilog
source "./Demo_kernel/solution1/directives.tcl"
export_design -rtl verilog -format xo -output /mnt/castor/seas_home/c/chihan/chihan/ese532_project/project/Demo/krnl_LZW.xo
