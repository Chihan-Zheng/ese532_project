# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 23 \
    name store_array_i \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename store_array_i \
    op interface \
    ports { store_array_i_address0 { O 12 vector } store_array_i_ce0 { O 1 bit } store_array_i_we0 { O 1 bit } store_array_i_d0 { O 16 vector } store_array_i_q0 { I 16 vector } store_array_i_address1 { O 12 vector } store_array_i_ce1 { O 1 bit } store_array_i_we1 { O 1 bit } store_array_i_d1 { O 16 vector } store_array_i_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'store_array_i'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 28 \
    name input_length_temp \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename input_length_temp \
    op interface \
    ports { input_length_temp_address0 { O 2 vector } input_length_temp_ce0 { O 1 bit } input_length_temp_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'input_length_temp'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name p_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read \
    op interface \
    ports { p_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name aximm0 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_aximm0 \
    op interface \
    ports { m_axi_aximm0_AWVALID { O 1 bit } m_axi_aximm0_AWREADY { I 1 bit } m_axi_aximm0_AWADDR { O 64 vector } m_axi_aximm0_AWID { O 1 vector } m_axi_aximm0_AWLEN { O 32 vector } m_axi_aximm0_AWSIZE { O 3 vector } m_axi_aximm0_AWBURST { O 2 vector } m_axi_aximm0_AWLOCK { O 2 vector } m_axi_aximm0_AWCACHE { O 4 vector } m_axi_aximm0_AWPROT { O 3 vector } m_axi_aximm0_AWQOS { O 4 vector } m_axi_aximm0_AWREGION { O 4 vector } m_axi_aximm0_AWUSER { O 1 vector } m_axi_aximm0_WVALID { O 1 bit } m_axi_aximm0_WREADY { I 1 bit } m_axi_aximm0_WDATA { O 16 vector } m_axi_aximm0_WSTRB { O 2 vector } m_axi_aximm0_WLAST { O 1 bit } m_axi_aximm0_WID { O 1 vector } m_axi_aximm0_WUSER { O 1 vector } m_axi_aximm0_ARVALID { O 1 bit } m_axi_aximm0_ARREADY { I 1 bit } m_axi_aximm0_ARADDR { O 64 vector } m_axi_aximm0_ARID { O 1 vector } m_axi_aximm0_ARLEN { O 32 vector } m_axi_aximm0_ARSIZE { O 3 vector } m_axi_aximm0_ARBURST { O 2 vector } m_axi_aximm0_ARLOCK { O 2 vector } m_axi_aximm0_ARCACHE { O 4 vector } m_axi_aximm0_ARPROT { O 3 vector } m_axi_aximm0_ARQOS { O 4 vector } m_axi_aximm0_ARREGION { O 4 vector } m_axi_aximm0_ARUSER { O 1 vector } m_axi_aximm0_RVALID { I 1 bit } m_axi_aximm0_RREADY { O 1 bit } m_axi_aximm0_RDATA { I 16 vector } m_axi_aximm0_RLAST { I 1 bit } m_axi_aximm0_RID { I 1 vector } m_axi_aximm0_RUSER { I 1 vector } m_axi_aximm0_RRESP { I 2 vector } m_axi_aximm0_BVALID { I 1 bit } m_axi_aximm0_BREADY { O 1 bit } m_axi_aximm0_BRESP { I 2 vector } m_axi_aximm0_BID { I 1 vector } m_axi_aximm0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name p_read1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read1 \
    op interface \
    ports { p_read1 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name p_read2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read2 \
    op interface \
    ports { p_read2 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name aximm1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_aximm1 \
    op interface \
    ports { m_axi_aximm1_AWVALID { O 1 bit } m_axi_aximm1_AWREADY { I 1 bit } m_axi_aximm1_AWADDR { O 64 vector } m_axi_aximm1_AWID { O 1 vector } m_axi_aximm1_AWLEN { O 32 vector } m_axi_aximm1_AWSIZE { O 3 vector } m_axi_aximm1_AWBURST { O 2 vector } m_axi_aximm1_AWLOCK { O 2 vector } m_axi_aximm1_AWCACHE { O 4 vector } m_axi_aximm1_AWPROT { O 3 vector } m_axi_aximm1_AWQOS { O 4 vector } m_axi_aximm1_AWREGION { O 4 vector } m_axi_aximm1_AWUSER { O 1 vector } m_axi_aximm1_WVALID { O 1 bit } m_axi_aximm1_WREADY { I 1 bit } m_axi_aximm1_WDATA { O 16 vector } m_axi_aximm1_WSTRB { O 2 vector } m_axi_aximm1_WLAST { O 1 bit } m_axi_aximm1_WID { O 1 vector } m_axi_aximm1_WUSER { O 1 vector } m_axi_aximm1_ARVALID { O 1 bit } m_axi_aximm1_ARREADY { I 1 bit } m_axi_aximm1_ARADDR { O 64 vector } m_axi_aximm1_ARID { O 1 vector } m_axi_aximm1_ARLEN { O 32 vector } m_axi_aximm1_ARSIZE { O 3 vector } m_axi_aximm1_ARBURST { O 2 vector } m_axi_aximm1_ARLOCK { O 2 vector } m_axi_aximm1_ARCACHE { O 4 vector } m_axi_aximm1_ARPROT { O 3 vector } m_axi_aximm1_ARQOS { O 4 vector } m_axi_aximm1_ARREGION { O 4 vector } m_axi_aximm1_ARUSER { O 1 vector } m_axi_aximm1_RVALID { I 1 bit } m_axi_aximm1_RREADY { O 1 bit } m_axi_aximm1_RDATA { I 16 vector } m_axi_aximm1_RLAST { I 1 bit } m_axi_aximm1_RID { I 1 vector } m_axi_aximm1_RUSER { I 1 vector } m_axi_aximm1_RRESP { I 2 vector } m_axi_aximm1_BVALID { I 1 bit } m_axi_aximm1_BREADY { O 1 bit } m_axi_aximm1_BRESP { I 2 vector } m_axi_aximm1_BID { I 1 vector } m_axi_aximm1_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name output_length \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_length \
    op interface \
    ports { output_length_dout { I 64 vector } output_length_empty_n { I 1 bit } output_length_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name input_r \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_r \
    op interface \
    ports { input_r_dout { I 64 vector } input_r_empty_n { I 1 bit } input_r_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name send_data \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_send_data \
    op interface \
    ports { send_data_dout { I 64 vector } send_data_empty_n { I 1 bit } send_data_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name outStream_code_flg \
    type fifo \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_outStream_code_flg \
    op interface \
    ports { outStream_code_flg_dout { I 8 vector } outStream_code_flg_empty_n { I 1 bit } outStream_code_flg_read { O 1 bit } outStream_code_flg_din { O 8 vector } outStream_code_flg_full_n { I 1 bit } outStream_code_flg_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name outStream_code \
    type fifo \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_outStream_code \
    op interface \
    ports { outStream_code_dout { I 13 vector } outStream_code_empty_n { I 1 bit } outStream_code_read { O 1 bit } outStream_code_din { O 13 vector } outStream_code_full_n { I 1 bit } outStream_code_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name inStream_in \
    type fifo \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_inStream_in \
    op interface \
    ports { inStream_in_dout { I 8 vector } inStream_in_empty_n { I 1 bit } inStream_in_read { O 1 bit } inStream_in_din { O 8 vector } inStream_in_full_n { I 1 bit } inStream_in_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


