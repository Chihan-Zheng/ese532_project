# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name aximm0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_aximm0 \
    op interface \
    ports { m_axi_aximm0_AWVALID { O 1 bit } m_axi_aximm0_AWREADY { I 1 bit } m_axi_aximm0_AWADDR { O 64 vector } m_axi_aximm0_AWID { O 1 vector } m_axi_aximm0_AWLEN { O 32 vector } m_axi_aximm0_AWSIZE { O 3 vector } m_axi_aximm0_AWBURST { O 2 vector } m_axi_aximm0_AWLOCK { O 2 vector } m_axi_aximm0_AWCACHE { O 4 vector } m_axi_aximm0_AWPROT { O 3 vector } m_axi_aximm0_AWQOS { O 4 vector } m_axi_aximm0_AWREGION { O 4 vector } m_axi_aximm0_AWUSER { O 1 vector } m_axi_aximm0_WVALID { O 1 bit } m_axi_aximm0_WREADY { I 1 bit } m_axi_aximm0_WDATA { O 64 vector } m_axi_aximm0_WSTRB { O 8 vector } m_axi_aximm0_WLAST { O 1 bit } m_axi_aximm0_WID { O 1 vector } m_axi_aximm0_WUSER { O 1 vector } m_axi_aximm0_ARVALID { O 1 bit } m_axi_aximm0_ARREADY { I 1 bit } m_axi_aximm0_ARADDR { O 64 vector } m_axi_aximm0_ARID { O 1 vector } m_axi_aximm0_ARLEN { O 32 vector } m_axi_aximm0_ARSIZE { O 3 vector } m_axi_aximm0_ARBURST { O 2 vector } m_axi_aximm0_ARLOCK { O 2 vector } m_axi_aximm0_ARCACHE { O 4 vector } m_axi_aximm0_ARPROT { O 3 vector } m_axi_aximm0_ARQOS { O 4 vector } m_axi_aximm0_ARREGION { O 4 vector } m_axi_aximm0_ARUSER { O 1 vector } m_axi_aximm0_RVALID { I 1 bit } m_axi_aximm0_RREADY { O 1 bit } m_axi_aximm0_RDATA { I 64 vector } m_axi_aximm0_RLAST { I 1 bit } m_axi_aximm0_RID { I 1 vector } m_axi_aximm0_RUSER { I 1 vector } m_axi_aximm0_RRESP { I 2 vector } m_axi_aximm0_BVALID { I 1 bit } m_axi_aximm0_BREADY { O 1 bit } m_axi_aximm0_BRESP { I 2 vector } m_axi_aximm0_BID { I 1 vector } m_axi_aximm0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
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
    id 21 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name input_offset_constprop \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_input_offset_constprop \
    op interface \
    ports { input_offset_constprop_i { I 32 vector } input_offset_constprop_o { O 32 vector } input_offset_constprop_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name inStream_in \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_inStream_in \
    op interface \
    ports { inStream_in_din { O 8 vector } inStream_in_full_n { I 1 bit } inStream_in_write { O 1 bit } } \
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
    ports { ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
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


