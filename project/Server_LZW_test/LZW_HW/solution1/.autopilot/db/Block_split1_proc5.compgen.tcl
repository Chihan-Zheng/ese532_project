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
    id 1 \
    name input_length \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_length \
    op interface \
    ports { input_length { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name aximm2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_aximm2 \
    op interface \
    ports { m_axi_aximm2_AWVALID { O 1 bit } m_axi_aximm2_AWREADY { I 1 bit } m_axi_aximm2_AWADDR { O 64 vector } m_axi_aximm2_AWID { O 1 vector } m_axi_aximm2_AWLEN { O 32 vector } m_axi_aximm2_AWSIZE { O 3 vector } m_axi_aximm2_AWBURST { O 2 vector } m_axi_aximm2_AWLOCK { O 2 vector } m_axi_aximm2_AWCACHE { O 4 vector } m_axi_aximm2_AWPROT { O 3 vector } m_axi_aximm2_AWQOS { O 4 vector } m_axi_aximm2_AWREGION { O 4 vector } m_axi_aximm2_AWUSER { O 1 vector } m_axi_aximm2_WVALID { O 1 bit } m_axi_aximm2_WREADY { I 1 bit } m_axi_aximm2_WDATA { O 16 vector } m_axi_aximm2_WSTRB { O 2 vector } m_axi_aximm2_WLAST { O 1 bit } m_axi_aximm2_WID { O 1 vector } m_axi_aximm2_WUSER { O 1 vector } m_axi_aximm2_ARVALID { O 1 bit } m_axi_aximm2_ARREADY { I 1 bit } m_axi_aximm2_ARADDR { O 64 vector } m_axi_aximm2_ARID { O 1 vector } m_axi_aximm2_ARLEN { O 32 vector } m_axi_aximm2_ARSIZE { O 3 vector } m_axi_aximm2_ARBURST { O 2 vector } m_axi_aximm2_ARLOCK { O 2 vector } m_axi_aximm2_ARCACHE { O 4 vector } m_axi_aximm2_ARPROT { O 3 vector } m_axi_aximm2_ARQOS { O 4 vector } m_axi_aximm2_ARREGION { O 4 vector } m_axi_aximm2_ARUSER { O 1 vector } m_axi_aximm2_RVALID { I 1 bit } m_axi_aximm2_RREADY { O 1 bit } m_axi_aximm2_RDATA { I 16 vector } m_axi_aximm2_RLAST { I 1 bit } m_axi_aximm2_RID { I 1 vector } m_axi_aximm2_RUSER { I 1 vector } m_axi_aximm2_RRESP { I 2 vector } m_axi_aximm2_BVALID { I 1 bit } m_axi_aximm2_BREADY { O 1 bit } m_axi_aximm2_BRESP { I 2 vector } m_axi_aximm2_BID { I 1 vector } m_axi_aximm2_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name in_r \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_in_r \
    op interface \
    ports { in_r { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name send_data \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_send_data \
    op interface \
    ports { send_data { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name output_length \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_length \
    op interface \
    ports { output_length { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name in_len_V_out_out \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_in_len_V_out_out \
    op interface \
    ports { in_len_V_out_out_din { O 13 vector } in_len_V_out_out_full_n { I 1 bit } in_len_V_out_out_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name in_out \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_in_out \
    op interface \
    ports { in_out_din { O 64 vector } in_out_full_n { I 1 bit } in_out_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name send_data_out \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_send_data_out \
    op interface \
    ports { send_data_out_din { O 64 vector } send_data_out_full_n { I 1 bit } send_data_out_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name output_length_out \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_output_length_out \
    op interface \
    ports { output_length_out_din { O 64 vector } output_length_out_full_n { I 1 bit } output_length_out_write { O 1 bit } } \
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


