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
    id 10 \
    name input_length_temp \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename input_length_temp \
    op interface \
    ports { input_length_temp_address0 { O 2 vector } input_length_temp_ce0 { O 1 bit } input_length_temp_we0 { O 1 bit } input_length_temp_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'input_length_temp'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name input_length \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_length \
    op interface \
    ports { input_length_dout { I 64 vector } input_length_empty_n { I 1 bit } input_length_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name aximm1 \
    type other \
    dir I \
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

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 8 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
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
    id -4 \
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


