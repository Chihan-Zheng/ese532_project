set moduleName compute_LZW
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
set C_modelName {compute_LZW}
set C_modelType { void 0 }
set C_modelArgList {
	{ aximm3 int 32 regular {axi_master 1}  }
	{ aximm4 int 16 regular {axi_master 1}  }
	{ in_len_V_loc int 13 regular {fifo 0}  }
	{ send_data int 64 regular {fifo 0}  }
	{ output_length int 64 regular {fifo 0}  }
	{ inStream_in int 8 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "aximm3", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "aximm4", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "in_len_V_loc", "interface" : "fifo", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "send_data", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_length", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "inStream_in", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 109
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_aximm3_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm3_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm3_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm3_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm3_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_aximm3_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm3_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm3_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm3_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm3_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm3_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm3_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm3_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm3_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm3_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm3_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_aximm3_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm3_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm3_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm3_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm3_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm3_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm3_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm3_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm3_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_aximm3_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm3_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm3_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm3_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm3_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm3_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm3_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm3_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm3_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm3_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm3_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_aximm3_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm3_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm3_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm3_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm3_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm3_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm3_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm3_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm3_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm4_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm4_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm4_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm4_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm4_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_aximm4_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm4_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm4_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm4_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm4_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm4_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm4_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm4_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm4_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm4_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm4_WDATA sc_out sc_lv 16 signal 1 } 
	{ m_axi_aximm4_WSTRB sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm4_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm4_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm4_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm4_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm4_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm4_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm4_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm4_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_aximm4_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm4_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm4_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm4_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm4_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm4_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm4_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm4_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm4_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm4_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm4_RDATA sc_in sc_lv 16 signal 1 } 
	{ m_axi_aximm4_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm4_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm4_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm4_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm4_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm4_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm4_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm4_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm4_BUSER sc_in sc_lv 1 signal 1 } 
	{ in_len_V_loc_dout sc_in sc_lv 13 signal 2 } 
	{ in_len_V_loc_empty_n sc_in sc_logic 1 signal 2 } 
	{ in_len_V_loc_read sc_out sc_logic 1 signal 2 } 
	{ send_data_dout sc_in sc_lv 64 signal 3 } 
	{ send_data_empty_n sc_in sc_logic 1 signal 3 } 
	{ send_data_read sc_out sc_logic 1 signal 3 } 
	{ output_length_dout sc_in sc_lv 64 signal 4 } 
	{ output_length_empty_n sc_in sc_logic 1 signal 4 } 
	{ output_length_read sc_out sc_logic 1 signal 4 } 
	{ inStream_in_dout sc_in sc_lv 8 signal 5 } 
	{ inStream_in_empty_n sc_in sc_logic 1 signal 5 } 
	{ inStream_in_read sc_out sc_logic 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_aximm3_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm3_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm3_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm3", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm3_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm3_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm3", "role": "AWLEN" }} , 
 	{ "name": "m_axi_aximm3_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm3", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_aximm3_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm3", "role": "AWBURST" }} , 
 	{ "name": "m_axi_aximm3_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm3", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_aximm3_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm3", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_aximm3_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm3", "role": "AWPROT" }} , 
 	{ "name": "m_axi_aximm3_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm3", "role": "AWQOS" }} , 
 	{ "name": "m_axi_aximm3_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm3", "role": "AWREGION" }} , 
 	{ "name": "m_axi_aximm3_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "AWUSER" }} , 
 	{ "name": "m_axi_aximm3_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "WVALID" }} , 
 	{ "name": "m_axi_aximm3_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "WREADY" }} , 
 	{ "name": "m_axi_aximm3_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm3", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm3_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm3", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm3_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm3_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "WID" }} , 
 	{ "name": "m_axi_aximm3_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm3_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm3_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm3_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm3", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm3_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm3_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm3", "role": "ARLEN" }} , 
 	{ "name": "m_axi_aximm3_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm3", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_aximm3_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm3", "role": "ARBURST" }} , 
 	{ "name": "m_axi_aximm3_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm3", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_aximm3_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm3", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_aximm3_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm3", "role": "ARPROT" }} , 
 	{ "name": "m_axi_aximm3_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm3", "role": "ARQOS" }} , 
 	{ "name": "m_axi_aximm3_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm3", "role": "ARREGION" }} , 
 	{ "name": "m_axi_aximm3_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "ARUSER" }} , 
 	{ "name": "m_axi_aximm3_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "RVALID" }} , 
 	{ "name": "m_axi_aximm3_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "RREADY" }} , 
 	{ "name": "m_axi_aximm3_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm3", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm3_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm3_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "RID" }} , 
 	{ "name": "m_axi_aximm3_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm3_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm3", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm3_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm3_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm3_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm3", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm3_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "BID" }} , 
 	{ "name": "m_axi_aximm3_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "BUSER" }} , 
 	{ "name": "m_axi_aximm4_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm4_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm4_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm4", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm4_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm4_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm4", "role": "AWLEN" }} , 
 	{ "name": "m_axi_aximm4_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm4", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_aximm4_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm4", "role": "AWBURST" }} , 
 	{ "name": "m_axi_aximm4_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm4", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_aximm4_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm4", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_aximm4_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm4", "role": "AWPROT" }} , 
 	{ "name": "m_axi_aximm4_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm4", "role": "AWQOS" }} , 
 	{ "name": "m_axi_aximm4_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm4", "role": "AWREGION" }} , 
 	{ "name": "m_axi_aximm4_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "AWUSER" }} , 
 	{ "name": "m_axi_aximm4_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "WVALID" }} , 
 	{ "name": "m_axi_aximm4_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "WREADY" }} , 
 	{ "name": "m_axi_aximm4_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "aximm4", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm4_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm4", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm4_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm4_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "WID" }} , 
 	{ "name": "m_axi_aximm4_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm4_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm4_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm4_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm4", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm4_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm4_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm4", "role": "ARLEN" }} , 
 	{ "name": "m_axi_aximm4_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm4", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_aximm4_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm4", "role": "ARBURST" }} , 
 	{ "name": "m_axi_aximm4_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm4", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_aximm4_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm4", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_aximm4_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm4", "role": "ARPROT" }} , 
 	{ "name": "m_axi_aximm4_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm4", "role": "ARQOS" }} , 
 	{ "name": "m_axi_aximm4_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm4", "role": "ARREGION" }} , 
 	{ "name": "m_axi_aximm4_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "ARUSER" }} , 
 	{ "name": "m_axi_aximm4_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "RVALID" }} , 
 	{ "name": "m_axi_aximm4_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "RREADY" }} , 
 	{ "name": "m_axi_aximm4_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "aximm4", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm4_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm4_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "RID" }} , 
 	{ "name": "m_axi_aximm4_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm4_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm4", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm4_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm4_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm4_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm4", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm4_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "BID" }} , 
 	{ "name": "m_axi_aximm4_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "BUSER" }} , 
 	{ "name": "in_len_V_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "in_len_V_loc", "role": "dout" }} , 
 	{ "name": "in_len_V_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_len_V_loc", "role": "empty_n" }} , 
 	{ "name": "in_len_V_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_len_V_loc", "role": "read" }} , 
 	{ "name": "send_data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data", "role": "dout" }} , 
 	{ "name": "send_data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data", "role": "empty_n" }} , 
 	{ "name": "send_data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data", "role": "read" }} , 
 	{ "name": "output_length_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length", "role": "dout" }} , 
 	{ "name": "output_length_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length", "role": "empty_n" }} , 
 	{ "name": "output_length_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length", "role": "read" }} , 
 	{ "name": "inStream_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inStream_in", "role": "dout" }} , 
 	{ "name": "inStream_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in", "role": "empty_n" }} , 
 	{ "name": "inStream_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "compute_LZW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32914", "EstimateLatencyMax" : "1269750",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "aximm3", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "aximm3_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "aximm3_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "aximm3_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "aximm4", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "aximm4_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "aximm4_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "aximm4_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "in_len_V_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_len_V_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_in_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.store_array_i_i_i_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hash_table_V_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.my_assoc_mem_value_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_5129_72_1_1_U15", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_5129_72_1_1_U16", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	compute_LZW {
		aximm3 {Type O LastRead 79 FirstWrite 5}
		aximm4 {Type O LastRead 79 FirstWrite 78}
		in_len_V_loc {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		inStream_in {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32914", "Max" : "1269750"}
	, {"Name" : "Interval", "Min" : "32914", "Max" : "1269750"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "5", "EnableSignal" : "ap_enable_pp5"}
	{"Pipeline" : "6", "EnableSignal" : "ap_enable_pp6"}
]}

set Spec2ImplPortList { 
	aximm3 { m_axi {  { m_axi_aximm3_AWVALID VALID 1 1 }  { m_axi_aximm3_AWREADY READY 0 1 }  { m_axi_aximm3_AWADDR ADDR 1 64 }  { m_axi_aximm3_AWID ID 1 1 }  { m_axi_aximm3_AWLEN LEN 1 32 }  { m_axi_aximm3_AWSIZE SIZE 1 3 }  { m_axi_aximm3_AWBURST BURST 1 2 }  { m_axi_aximm3_AWLOCK LOCK 1 2 }  { m_axi_aximm3_AWCACHE CACHE 1 4 }  { m_axi_aximm3_AWPROT PROT 1 3 }  { m_axi_aximm3_AWQOS QOS 1 4 }  { m_axi_aximm3_AWREGION REGION 1 4 }  { m_axi_aximm3_AWUSER USER 1 1 }  { m_axi_aximm3_WVALID VALID 1 1 }  { m_axi_aximm3_WREADY READY 0 1 }  { m_axi_aximm3_WDATA DATA 1 32 }  { m_axi_aximm3_WSTRB STRB 1 4 }  { m_axi_aximm3_WLAST LAST 1 1 }  { m_axi_aximm3_WID ID 1 1 }  { m_axi_aximm3_WUSER USER 1 1 }  { m_axi_aximm3_ARVALID VALID 1 1 }  { m_axi_aximm3_ARREADY READY 0 1 }  { m_axi_aximm3_ARADDR ADDR 1 64 }  { m_axi_aximm3_ARID ID 1 1 }  { m_axi_aximm3_ARLEN LEN 1 32 }  { m_axi_aximm3_ARSIZE SIZE 1 3 }  { m_axi_aximm3_ARBURST BURST 1 2 }  { m_axi_aximm3_ARLOCK LOCK 1 2 }  { m_axi_aximm3_ARCACHE CACHE 1 4 }  { m_axi_aximm3_ARPROT PROT 1 3 }  { m_axi_aximm3_ARQOS QOS 1 4 }  { m_axi_aximm3_ARREGION REGION 1 4 }  { m_axi_aximm3_ARUSER USER 1 1 }  { m_axi_aximm3_RVALID VALID 0 1 }  { m_axi_aximm3_RREADY READY 1 1 }  { m_axi_aximm3_RDATA DATA 0 32 }  { m_axi_aximm3_RLAST LAST 0 1 }  { m_axi_aximm3_RID ID 0 1 }  { m_axi_aximm3_RUSER USER 0 1 }  { m_axi_aximm3_RRESP RESP 0 2 }  { m_axi_aximm3_BVALID VALID 0 1 }  { m_axi_aximm3_BREADY READY 1 1 }  { m_axi_aximm3_BRESP RESP 0 2 }  { m_axi_aximm3_BID ID 0 1 }  { m_axi_aximm3_BUSER USER 0 1 } } }
	aximm4 { m_axi {  { m_axi_aximm4_AWVALID VALID 1 1 }  { m_axi_aximm4_AWREADY READY 0 1 }  { m_axi_aximm4_AWADDR ADDR 1 64 }  { m_axi_aximm4_AWID ID 1 1 }  { m_axi_aximm4_AWLEN LEN 1 32 }  { m_axi_aximm4_AWSIZE SIZE 1 3 }  { m_axi_aximm4_AWBURST BURST 1 2 }  { m_axi_aximm4_AWLOCK LOCK 1 2 }  { m_axi_aximm4_AWCACHE CACHE 1 4 }  { m_axi_aximm4_AWPROT PROT 1 3 }  { m_axi_aximm4_AWQOS QOS 1 4 }  { m_axi_aximm4_AWREGION REGION 1 4 }  { m_axi_aximm4_AWUSER USER 1 1 }  { m_axi_aximm4_WVALID VALID 1 1 }  { m_axi_aximm4_WREADY READY 0 1 }  { m_axi_aximm4_WDATA DATA 1 16 }  { m_axi_aximm4_WSTRB STRB 1 2 }  { m_axi_aximm4_WLAST LAST 1 1 }  { m_axi_aximm4_WID ID 1 1 }  { m_axi_aximm4_WUSER USER 1 1 }  { m_axi_aximm4_ARVALID VALID 1 1 }  { m_axi_aximm4_ARREADY READY 0 1 }  { m_axi_aximm4_ARADDR ADDR 1 64 }  { m_axi_aximm4_ARID ID 1 1 }  { m_axi_aximm4_ARLEN LEN 1 32 }  { m_axi_aximm4_ARSIZE SIZE 1 3 }  { m_axi_aximm4_ARBURST BURST 1 2 }  { m_axi_aximm4_ARLOCK LOCK 1 2 }  { m_axi_aximm4_ARCACHE CACHE 1 4 }  { m_axi_aximm4_ARPROT PROT 1 3 }  { m_axi_aximm4_ARQOS QOS 1 4 }  { m_axi_aximm4_ARREGION REGION 1 4 }  { m_axi_aximm4_ARUSER USER 1 1 }  { m_axi_aximm4_RVALID VALID 0 1 }  { m_axi_aximm4_RREADY READY 1 1 }  { m_axi_aximm4_RDATA DATA 0 16 }  { m_axi_aximm4_RLAST LAST 0 1 }  { m_axi_aximm4_RID ID 0 1 }  { m_axi_aximm4_RUSER USER 0 1 }  { m_axi_aximm4_RRESP RESP 0 2 }  { m_axi_aximm4_BVALID VALID 0 1 }  { m_axi_aximm4_BREADY READY 1 1 }  { m_axi_aximm4_BRESP RESP 0 2 }  { m_axi_aximm4_BID ID 0 1 }  { m_axi_aximm4_BUSER USER 0 1 } } }
	in_len_V_loc { ap_fifo {  { in_len_V_loc_dout fifo_data 0 13 }  { in_len_V_loc_empty_n fifo_status 0 1 }  { in_len_V_loc_read fifo_update 1 1 } } }
	send_data { ap_fifo {  { send_data_dout fifo_data 0 64 }  { send_data_empty_n fifo_status 0 1 }  { send_data_read fifo_update 1 1 } } }
	output_length { ap_fifo {  { output_length_dout fifo_data 0 64 }  { output_length_empty_n fifo_status 0 1 }  { output_length_read fifo_update 1 1 } } }
	inStream_in { ap_fifo {  { inStream_in_dout fifo_data 0 8 }  { inStream_in_empty_n fifo_status 0 1 }  { inStream_in_read fifo_update 1 1 } } }
}
