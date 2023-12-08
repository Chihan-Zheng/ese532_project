# This script segment is generated automatically by AutoPilot

# Memory (RAM/ROM)  definition:
set ID 31
set hasByteEnable 0
set MemName krnl_LZW_write_result_store_array_i_i_i
set CoreName ap_simcore_mem
set PortList { 2 2 }
set DataWd 16
set AddrRange 4096
set AddrWd 12
set impl_style auto
set TrueReset 0
set HasInitializer 0
set IsROM 0
set ROMData {}
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.352
set ClkPeriod 6.667
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name aximm0 \
    type other \
    dir O \
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
    id 33 \
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
    id 34 \
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
    id 35 \
    name i_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_i_1 \
    op interface \
    ports { i_1_dout { I 7 vector } i_1_empty_n { I 1 bit } i_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
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
    id 37 \
    name outStream_code_flg \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_outStream_code_flg \
    op interface \
    ports { outStream_code_flg_dout { I 8 vector } outStream_code_flg_empty_n { I 1 bit } outStream_code_flg_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name outStream_code \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_outStream_code \
    op interface \
    ports { outStream_code_dout { I 13 vector } outStream_code_empty_n { I 1 bit } outStream_code_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name output_offset_constprop \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_output_offset_constprop \
    op interface \
    ports { output_offset_constprop_i { I 32 vector } output_offset_constprop_o { O 32 vector } output_offset_constprop_o_ap_vld { O 1 bit } } \
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


