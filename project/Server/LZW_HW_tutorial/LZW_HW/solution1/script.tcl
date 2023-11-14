############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LZW_HW
set_top hardware_encoding
add_files LZW_hybrid_hash_AP_HW.cpp
add_files LittlePrince.txt
add_files -tb LZW_hybrid_hash_AP_HW.cpp
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 150MHz -name default
#source "./LZW_HW/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
