############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LZW_HW
set_top hardware_encoding
add_files LittlePrince.txt
add_files LZW_hybrid_hash_AP_HW.cpp
add_files -tb LZW_hybrid_hash_AP_HW.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 150MHz -name default
config_interface -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512 -m_axi_offset slave
config_rtl -register_reset_num 3
source "./LZW_HW/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
