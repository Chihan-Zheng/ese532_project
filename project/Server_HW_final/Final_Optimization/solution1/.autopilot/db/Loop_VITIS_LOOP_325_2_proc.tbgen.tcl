set moduleName Loop_VITIS_LOOP_325_2_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Loop_VITIS_LOOP_325_2_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_read int 8 regular  }
	{ aximm0 int 16 regular {axi_master 2}  }
	{ store_array_i int 16 regular {array 4096 { 2 2 } 1 1 }  }
	{ p_read1 int 64 regular  }
	{ p_read2 int 1 regular  }
	{ aximm1 int 16 regular {axi_master 1}  }
	{ output_length int 64 regular {fifo 0}  }
	{ input_length_temp int 16 regular {array 4 { 1 3 } 1 1 }  }
	{ in_r int 64 regular {fifo 0}  }
	{ send_data int 64 regular {fifo 0}  }
	{ outStream_code_flg int 8 regular {fifo 2 volatile } {global 2}  }
	{ outStream_code int 13 regular {fifo 2 volatile } {global 2}  }
	{ inStream_in int 8 regular {fifo 2 volatile } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "aximm0", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "store_array_i", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "aximm1", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_length", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "input_length_temp", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "in_r", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "send_data", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "outStream_code_flg", "interface" : "fifo", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "outStream_code", "interface" : "fifo", "bitwidth" : 13, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "inStream_in", "interface" : "fifo", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 140
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_read sc_in sc_lv 8 signal 0 } 
	{ m_axi_aximm0_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm0_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm0_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm0_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm0_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_aximm0_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm0_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm0_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm0_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm0_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm0_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm0_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm0_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm0_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm0_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm0_WDATA sc_out sc_lv 16 signal 1 } 
	{ m_axi_aximm0_WSTRB sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm0_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm0_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm0_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm0_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm0_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm0_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm0_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm0_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_aximm0_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm0_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm0_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm0_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm0_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm0_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm0_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm0_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm0_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm0_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm0_RDATA sc_in sc_lv 16 signal 1 } 
	{ m_axi_aximm0_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm0_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm0_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm0_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm0_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm0_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm0_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm0_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm0_BUSER sc_in sc_lv 1 signal 1 } 
	{ store_array_i_address0 sc_out sc_lv 12 signal 2 } 
	{ store_array_i_ce0 sc_out sc_logic 1 signal 2 } 
	{ store_array_i_we0 sc_out sc_logic 1 signal 2 } 
	{ store_array_i_d0 sc_out sc_lv 16 signal 2 } 
	{ store_array_i_q0 sc_in sc_lv 16 signal 2 } 
	{ store_array_i_address1 sc_out sc_lv 12 signal 2 } 
	{ store_array_i_ce1 sc_out sc_logic 1 signal 2 } 
	{ store_array_i_we1 sc_out sc_logic 1 signal 2 } 
	{ store_array_i_d1 sc_out sc_lv 16 signal 2 } 
	{ store_array_i_q1 sc_in sc_lv 16 signal 2 } 
	{ p_read1 sc_in sc_lv 64 signal 3 } 
	{ p_read2 sc_in sc_lv 1 signal 4 } 
	{ m_axi_aximm1_AWVALID sc_out sc_logic 1 signal 5 } 
	{ m_axi_aximm1_AWREADY sc_in sc_logic 1 signal 5 } 
	{ m_axi_aximm1_AWADDR sc_out sc_lv 64 signal 5 } 
	{ m_axi_aximm1_AWID sc_out sc_lv 1 signal 5 } 
	{ m_axi_aximm1_AWLEN sc_out sc_lv 32 signal 5 } 
	{ m_axi_aximm1_AWSIZE sc_out sc_lv 3 signal 5 } 
	{ m_axi_aximm1_AWBURST sc_out sc_lv 2 signal 5 } 
	{ m_axi_aximm1_AWLOCK sc_out sc_lv 2 signal 5 } 
	{ m_axi_aximm1_AWCACHE sc_out sc_lv 4 signal 5 } 
	{ m_axi_aximm1_AWPROT sc_out sc_lv 3 signal 5 } 
	{ m_axi_aximm1_AWQOS sc_out sc_lv 4 signal 5 } 
	{ m_axi_aximm1_AWREGION sc_out sc_lv 4 signal 5 } 
	{ m_axi_aximm1_AWUSER sc_out sc_lv 1 signal 5 } 
	{ m_axi_aximm1_WVALID sc_out sc_logic 1 signal 5 } 
	{ m_axi_aximm1_WREADY sc_in sc_logic 1 signal 5 } 
	{ m_axi_aximm1_WDATA sc_out sc_lv 16 signal 5 } 
	{ m_axi_aximm1_WSTRB sc_out sc_lv 2 signal 5 } 
	{ m_axi_aximm1_WLAST sc_out sc_logic 1 signal 5 } 
	{ m_axi_aximm1_WID sc_out sc_lv 1 signal 5 } 
	{ m_axi_aximm1_WUSER sc_out sc_lv 1 signal 5 } 
	{ m_axi_aximm1_ARVALID sc_out sc_logic 1 signal 5 } 
	{ m_axi_aximm1_ARREADY sc_in sc_logic 1 signal 5 } 
	{ m_axi_aximm1_ARADDR sc_out sc_lv 64 signal 5 } 
	{ m_axi_aximm1_ARID sc_out sc_lv 1 signal 5 } 
	{ m_axi_aximm1_ARLEN sc_out sc_lv 32 signal 5 } 
	{ m_axi_aximm1_ARSIZE sc_out sc_lv 3 signal 5 } 
	{ m_axi_aximm1_ARBURST sc_out sc_lv 2 signal 5 } 
	{ m_axi_aximm1_ARLOCK sc_out sc_lv 2 signal 5 } 
	{ m_axi_aximm1_ARCACHE sc_out sc_lv 4 signal 5 } 
	{ m_axi_aximm1_ARPROT sc_out sc_lv 3 signal 5 } 
	{ m_axi_aximm1_ARQOS sc_out sc_lv 4 signal 5 } 
	{ m_axi_aximm1_ARREGION sc_out sc_lv 4 signal 5 } 
	{ m_axi_aximm1_ARUSER sc_out sc_lv 1 signal 5 } 
	{ m_axi_aximm1_RVALID sc_in sc_logic 1 signal 5 } 
	{ m_axi_aximm1_RREADY sc_out sc_logic 1 signal 5 } 
	{ m_axi_aximm1_RDATA sc_in sc_lv 16 signal 5 } 
	{ m_axi_aximm1_RLAST sc_in sc_logic 1 signal 5 } 
	{ m_axi_aximm1_RID sc_in sc_lv 1 signal 5 } 
	{ m_axi_aximm1_RUSER sc_in sc_lv 1 signal 5 } 
	{ m_axi_aximm1_RRESP sc_in sc_lv 2 signal 5 } 
	{ m_axi_aximm1_BVALID sc_in sc_logic 1 signal 5 } 
	{ m_axi_aximm1_BREADY sc_out sc_logic 1 signal 5 } 
	{ m_axi_aximm1_BRESP sc_in sc_lv 2 signal 5 } 
	{ m_axi_aximm1_BID sc_in sc_lv 1 signal 5 } 
	{ m_axi_aximm1_BUSER sc_in sc_lv 1 signal 5 } 
	{ output_length_dout sc_in sc_lv 64 signal 6 } 
	{ output_length_empty_n sc_in sc_logic 1 signal 6 } 
	{ output_length_read sc_out sc_logic 1 signal 6 } 
	{ input_length_temp_address0 sc_out sc_lv 2 signal 7 } 
	{ input_length_temp_ce0 sc_out sc_logic 1 signal 7 } 
	{ input_length_temp_q0 sc_in sc_lv 16 signal 7 } 
	{ in_r_dout sc_in sc_lv 64 signal 8 } 
	{ in_r_empty_n sc_in sc_logic 1 signal 8 } 
	{ in_r_read sc_out sc_logic 1 signal 8 } 
	{ send_data_dout sc_in sc_lv 64 signal 9 } 
	{ send_data_empty_n sc_in sc_logic 1 signal 9 } 
	{ send_data_read sc_out sc_logic 1 signal 9 } 
	{ outStream_code_flg_dout sc_in sc_lv 8 signal 10 } 
	{ outStream_code_flg_empty_n sc_in sc_logic 1 signal 10 } 
	{ outStream_code_flg_read sc_out sc_logic 1 signal 10 } 
	{ outStream_code_flg_din sc_out sc_lv 8 signal 10 } 
	{ outStream_code_flg_full_n sc_in sc_logic 1 signal 10 } 
	{ outStream_code_flg_write sc_out sc_logic 1 signal 10 } 
	{ outStream_code_dout sc_in sc_lv 13 signal 11 } 
	{ outStream_code_empty_n sc_in sc_logic 1 signal 11 } 
	{ outStream_code_read sc_out sc_logic 1 signal 11 } 
	{ outStream_code_din sc_out sc_lv 13 signal 11 } 
	{ outStream_code_full_n sc_in sc_logic 1 signal 11 } 
	{ outStream_code_write sc_out sc_logic 1 signal 11 } 
	{ inStream_in_dout sc_in sc_lv 8 signal 12 } 
	{ inStream_in_empty_n sc_in sc_logic 1 signal 12 } 
	{ inStream_in_read sc_out sc_logic 1 signal 12 } 
	{ inStream_in_din sc_out sc_lv 8 signal 12 } 
	{ inStream_in_full_n sc_in sc_logic 1 signal 12 } 
	{ inStream_in_write sc_out sc_logic 1 signal 12 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "m_axi_aximm0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_aximm0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_aximm0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_aximm0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_aximm0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_aximm0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_aximm0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_aximm0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_aximm0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_aximm0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "WVALID" }} , 
 	{ "name": "m_axi_aximm0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "WREADY" }} , 
 	{ "name": "m_axi_aximm0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "aximm0", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "WID" }} , 
 	{ "name": "m_axi_aximm0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_aximm0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_aximm0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_aximm0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_aximm0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_aximm0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_aximm0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_aximm0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_aximm0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_aximm0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RVALID" }} , 
 	{ "name": "m_axi_aximm0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RREADY" }} , 
 	{ "name": "m_axi_aximm0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "aximm0", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RID" }} , 
 	{ "name": "m_axi_aximm0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BID" }} , 
 	{ "name": "m_axi_aximm0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BUSER" }} , 
 	{ "name": "store_array_i_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "store_array_i", "role": "address0" }} , 
 	{ "name": "store_array_i_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "store_array_i", "role": "ce0" }} , 
 	{ "name": "store_array_i_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "store_array_i", "role": "we0" }} , 
 	{ "name": "store_array_i_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "store_array_i", "role": "d0" }} , 
 	{ "name": "store_array_i_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "store_array_i", "role": "q0" }} , 
 	{ "name": "store_array_i_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "store_array_i", "role": "address1" }} , 
 	{ "name": "store_array_i_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "store_array_i", "role": "ce1" }} , 
 	{ "name": "store_array_i_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "store_array_i", "role": "we1" }} , 
 	{ "name": "store_array_i_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "store_array_i", "role": "d1" }} , 
 	{ "name": "store_array_i_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "store_array_i", "role": "q1" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "m_axi_aximm1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_aximm1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_aximm1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_aximm1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_aximm1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_aximm1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_aximm1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_aximm1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_aximm1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_aximm1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WVALID" }} , 
 	{ "name": "m_axi_aximm1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WREADY" }} , 
 	{ "name": "m_axi_aximm1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "aximm1", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WID" }} , 
 	{ "name": "m_axi_aximm1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_aximm1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_aximm1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_aximm1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_aximm1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_aximm1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_aximm1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_aximm1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_aximm1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_aximm1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RVALID" }} , 
 	{ "name": "m_axi_aximm1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RREADY" }} , 
 	{ "name": "m_axi_aximm1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "aximm1", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RID" }} , 
 	{ "name": "m_axi_aximm1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BID" }} , 
 	{ "name": "m_axi_aximm1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BUSER" }} , 
 	{ "name": "output_length_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length", "role": "dout" }} , 
 	{ "name": "output_length_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length", "role": "empty_n" }} , 
 	{ "name": "output_length_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length", "role": "read" }} , 
 	{ "name": "input_length_temp_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "input_length_temp", "role": "address0" }} , 
 	{ "name": "input_length_temp_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_length_temp", "role": "ce0" }} , 
 	{ "name": "input_length_temp_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_length_temp", "role": "q0" }} , 
 	{ "name": "in_r_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_r", "role": "dout" }} , 
 	{ "name": "in_r_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "empty_n" }} , 
 	{ "name": "in_r_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "read" }} , 
 	{ "name": "send_data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data", "role": "dout" }} , 
 	{ "name": "send_data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data", "role": "empty_n" }} , 
 	{ "name": "send_data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data", "role": "read" }} , 
 	{ "name": "outStream_code_flg_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "dout" }} , 
 	{ "name": "outStream_code_flg_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "empty_n" }} , 
 	{ "name": "outStream_code_flg_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "read" }} , 
 	{ "name": "outStream_code_flg_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "din" }} , 
 	{ "name": "outStream_code_flg_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "full_n" }} , 
 	{ "name": "outStream_code_flg_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "write" }} , 
 	{ "name": "outStream_code_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "outStream_code", "role": "dout" }} , 
 	{ "name": "outStream_code_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code", "role": "empty_n" }} , 
 	{ "name": "outStream_code_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code", "role": "read" }} , 
 	{ "name": "outStream_code_din", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "outStream_code", "role": "din" }} , 
 	{ "name": "outStream_code_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code", "role": "full_n" }} , 
 	{ "name": "outStream_code_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code", "role": "write" }} , 
 	{ "name": "inStream_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inStream_in", "role": "dout" }} , 
 	{ "name": "inStream_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in", "role": "empty_n" }} , 
 	{ "name": "inStream_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in", "role": "read" }} , 
 	{ "name": "inStream_in_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inStream_in", "role": "din" }} , 
 	{ "name": "inStream_in_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in", "role": "full_n" }} , 
 	{ "name": "inStream_in_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "Loop_VITIS_LOOP_325_2_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "aximm0", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "aximm0_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "store_array_i", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "aximm1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "output_length", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_length_temp", "Type" : "Memory", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "in_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code_flg", "Type" : "Fifo", "Direction" : "IO", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_flg_i_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_compute_LZW_fu_612", "Port" : "outStream_code_flg"}]},
			{"Name" : "outStream_code", "Type" : "Fifo", "Direction" : "IO", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_i_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_compute_LZW_fu_612", "Port" : "outStream_code"}]},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "IO", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_in_o_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_compute_LZW_fu_612", "Port" : "inStream_in"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_compute_LZW_fu_612", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6"],
		"CDFG" : "compute_LZW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "33026", "EstimateLatencyMax" : "9666524",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "input_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "inStream_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "outStream_code_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code_flg", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "outStream_code_flg_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_LZW_fu_612.hash_table_V_0_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_LZW_fu_612.my_assoc_mem_upper_key_mem_V_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_LZW_fu_612.my_assoc_mem_middle_key_mem_V_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_LZW_fu_612.my_assoc_mem_lower_key_mem_V_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_compute_LZW_fu_612.my_assoc_mem_value_V_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VITIS_LOOP_325_2_proc {
		p_read {Type I LastRead 0 FirstWrite -1}
		aximm0 {Type IO LastRead 152 FirstWrite 151}
		store_array_i {Type IO LastRead 149 FirstWrite 6}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		aximm1 {Type O LastRead 152 FirstWrite 11}
		output_length {Type I LastRead 0 FirstWrite -1}
		input_length_temp {Type I LastRead 1 FirstWrite -1}
		in_r {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		outStream_code_flg {Type IO LastRead 6 FirstWrite 258}
		outStream_code {Type IO LastRead 6 FirstWrite 258}
		inStream_in {Type IO LastRead 258 FirstWrite -1}}
	compute_LZW {
		input_length {Type I LastRead 0 FirstWrite -1}
		inStream_in {Type I LastRead 258 FirstWrite -1}
		outStream_code {Type O LastRead -1 FirstWrite 258}
		outStream_code_flg {Type O LastRead -1 FirstWrite 258}}}

set hasDtUnsupportedChannel 1

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
	{"Pipeline" : "3", "EnableSignal" : "ap_enable_pp3"}
	{"Pipeline" : "4", "EnableSignal" : "ap_enable_pp4"}
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 8 } } }
	aximm0 { m_axi {  { m_axi_aximm0_AWVALID VALID 1 1 }  { m_axi_aximm0_AWREADY READY 0 1 }  { m_axi_aximm0_AWADDR ADDR 1 64 }  { m_axi_aximm0_AWID ID 1 1 }  { m_axi_aximm0_AWLEN LEN 1 32 }  { m_axi_aximm0_AWSIZE SIZE 1 3 }  { m_axi_aximm0_AWBURST BURST 1 2 }  { m_axi_aximm0_AWLOCK LOCK 1 2 }  { m_axi_aximm0_AWCACHE CACHE 1 4 }  { m_axi_aximm0_AWPROT PROT 1 3 }  { m_axi_aximm0_AWQOS QOS 1 4 }  { m_axi_aximm0_AWREGION REGION 1 4 }  { m_axi_aximm0_AWUSER USER 1 1 }  { m_axi_aximm0_WVALID VALID 1 1 }  { m_axi_aximm0_WREADY READY 0 1 }  { m_axi_aximm0_WDATA DATA 1 16 }  { m_axi_aximm0_WSTRB STRB 1 2 }  { m_axi_aximm0_WLAST LAST 1 1 }  { m_axi_aximm0_WID ID 1 1 }  { m_axi_aximm0_WUSER USER 1 1 }  { m_axi_aximm0_ARVALID VALID 1 1 }  { m_axi_aximm0_ARREADY READY 0 1 }  { m_axi_aximm0_ARADDR ADDR 1 64 }  { m_axi_aximm0_ARID ID 1 1 }  { m_axi_aximm0_ARLEN LEN 1 32 }  { m_axi_aximm0_ARSIZE SIZE 1 3 }  { m_axi_aximm0_ARBURST BURST 1 2 }  { m_axi_aximm0_ARLOCK LOCK 1 2 }  { m_axi_aximm0_ARCACHE CACHE 1 4 }  { m_axi_aximm0_ARPROT PROT 1 3 }  { m_axi_aximm0_ARQOS QOS 1 4 }  { m_axi_aximm0_ARREGION REGION 1 4 }  { m_axi_aximm0_ARUSER USER 1 1 }  { m_axi_aximm0_RVALID VALID 0 1 }  { m_axi_aximm0_RREADY READY 1 1 }  { m_axi_aximm0_RDATA DATA 0 16 }  { m_axi_aximm0_RLAST LAST 0 1 }  { m_axi_aximm0_RID ID 0 1 }  { m_axi_aximm0_RUSER USER 0 1 }  { m_axi_aximm0_RRESP RESP 0 2 }  { m_axi_aximm0_BVALID VALID 0 1 }  { m_axi_aximm0_BREADY READY 1 1 }  { m_axi_aximm0_BRESP RESP 0 2 }  { m_axi_aximm0_BID ID 0 1 }  { m_axi_aximm0_BUSER USER 0 1 } } }
	store_array_i { ap_memory {  { store_array_i_address0 mem_address 1 12 }  { store_array_i_ce0 mem_ce 1 1 }  { store_array_i_we0 mem_we 1 1 }  { store_array_i_d0 mem_din 1 16 }  { store_array_i_q0 mem_dout 0 16 }  { store_array_i_address1 MemPortADDR2 1 12 }  { store_array_i_ce1 MemPortCE2 1 1 }  { store_array_i_we1 MemPortWE2 1 1 }  { store_array_i_d1 MemPortDIN2 1 16 }  { store_array_i_q1 MemPortDOUT2 0 16 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 64 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 1 } } }
	aximm1 { m_axi {  { m_axi_aximm1_AWVALID VALID 1 1 }  { m_axi_aximm1_AWREADY READY 0 1 }  { m_axi_aximm1_AWADDR ADDR 1 64 }  { m_axi_aximm1_AWID ID 1 1 }  { m_axi_aximm1_AWLEN LEN 1 32 }  { m_axi_aximm1_AWSIZE SIZE 1 3 }  { m_axi_aximm1_AWBURST BURST 1 2 }  { m_axi_aximm1_AWLOCK LOCK 1 2 }  { m_axi_aximm1_AWCACHE CACHE 1 4 }  { m_axi_aximm1_AWPROT PROT 1 3 }  { m_axi_aximm1_AWQOS QOS 1 4 }  { m_axi_aximm1_AWREGION REGION 1 4 }  { m_axi_aximm1_AWUSER USER 1 1 }  { m_axi_aximm1_WVALID VALID 1 1 }  { m_axi_aximm1_WREADY READY 0 1 }  { m_axi_aximm1_WDATA DATA 1 16 }  { m_axi_aximm1_WSTRB STRB 1 2 }  { m_axi_aximm1_WLAST LAST 1 1 }  { m_axi_aximm1_WID ID 1 1 }  { m_axi_aximm1_WUSER USER 1 1 }  { m_axi_aximm1_ARVALID VALID 1 1 }  { m_axi_aximm1_ARREADY READY 0 1 }  { m_axi_aximm1_ARADDR ADDR 1 64 }  { m_axi_aximm1_ARID ID 1 1 }  { m_axi_aximm1_ARLEN LEN 1 32 }  { m_axi_aximm1_ARSIZE SIZE 1 3 }  { m_axi_aximm1_ARBURST BURST 1 2 }  { m_axi_aximm1_ARLOCK LOCK 1 2 }  { m_axi_aximm1_ARCACHE CACHE 1 4 }  { m_axi_aximm1_ARPROT PROT 1 3 }  { m_axi_aximm1_ARQOS QOS 1 4 }  { m_axi_aximm1_ARREGION REGION 1 4 }  { m_axi_aximm1_ARUSER USER 1 1 }  { m_axi_aximm1_RVALID VALID 0 1 }  { m_axi_aximm1_RREADY READY 1 1 }  { m_axi_aximm1_RDATA DATA 0 16 }  { m_axi_aximm1_RLAST LAST 0 1 }  { m_axi_aximm1_RID ID 0 1 }  { m_axi_aximm1_RUSER USER 0 1 }  { m_axi_aximm1_RRESP RESP 0 2 }  { m_axi_aximm1_BVALID VALID 0 1 }  { m_axi_aximm1_BREADY READY 1 1 }  { m_axi_aximm1_BRESP RESP 0 2 }  { m_axi_aximm1_BID ID 0 1 }  { m_axi_aximm1_BUSER USER 0 1 } } }
	output_length { ap_fifo {  { output_length_dout fifo_data 0 64 }  { output_length_empty_n fifo_status 0 1 }  { output_length_read fifo_update 1 1 } } }
	input_length_temp { ap_memory {  { input_length_temp_address0 mem_address 1 2 }  { input_length_temp_ce0 mem_ce 1 1 }  { input_length_temp_q0 mem_dout 0 16 } } }
	in_r { ap_fifo {  { in_r_dout fifo_data 0 64 }  { in_r_empty_n fifo_status 0 1 }  { in_r_read fifo_update 1 1 } } }
	send_data { ap_fifo {  { send_data_dout fifo_data 0 64 }  { send_data_empty_n fifo_status 0 1 }  { send_data_read fifo_update 1 1 } } }
	outStream_code_flg { ap_fifo {  { outStream_code_flg_dout fifo_data 0 8 }  { outStream_code_flg_empty_n fifo_status 0 1 }  { outStream_code_flg_read fifo_update 1 1 }  { outStream_code_flg_din fifo_data 1 8 }  { outStream_code_flg_full_n fifo_status 0 1 }  { outStream_code_flg_write fifo_update 1 1 } } }
	outStream_code { ap_fifo {  { outStream_code_dout fifo_data 0 13 }  { outStream_code_empty_n fifo_status 0 1 }  { outStream_code_read fifo_update 1 1 }  { outStream_code_din fifo_data 1 13 }  { outStream_code_full_n fifo_status 0 1 }  { outStream_code_write fifo_update 1 1 } } }
	inStream_in { ap_fifo {  { inStream_in_dout fifo_data 0 8 }  { inStream_in_empty_n fifo_status 0 1 }  { inStream_in_read fifo_update 1 1 }  { inStream_in_din fifo_data 1 8 }  { inStream_in_full_n fifo_status 0 1 }  { inStream_in_write fifo_update 1 1 } } }
}
