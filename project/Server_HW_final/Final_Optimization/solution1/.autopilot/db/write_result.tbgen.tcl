set moduleName write_result
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
set C_modelName {write_result}
set C_modelType { void 0 }
set C_modelArgList {
	{ aximm0 int 64 regular {axi_master 1}  }
	{ empty int 16 regular {pointer 0}  }
	{ send_data int 64 regular {fifo 0}  }
	{ i_1 int 7 regular {fifo 0}  }
	{ output_length int 64 regular {fifo 0}  }
	{ outStream_code_flg int 8 regular {fifo 0 volatile } {global 0}  }
	{ outStream_code int 13 regular {fifo 0 volatile } {global 0}  }
	{ output_offset_constprop int 32 regular {pointer 2} {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "aximm0", "interface" : "axi_master", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "send_data", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "i_1", "interface" : "fifo", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "output_length", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "outStream_code_flg", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "outStream_code", "interface" : "fifo", "bitwidth" : 13, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "output_offset_constprop", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 71
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_aximm0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_aximm0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_WDATA sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm0_WSTRB sc_out sc_lv 8 signal 0 } 
	{ m_axi_aximm0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_aximm0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_RDATA sc_in sc_lv 64 signal 0 } 
	{ m_axi_aximm0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm0_BUSER sc_in sc_lv 1 signal 0 } 
	{ empty sc_in sc_lv 16 signal 1 } 
	{ send_data_dout sc_in sc_lv 64 signal 2 } 
	{ send_data_empty_n sc_in sc_logic 1 signal 2 } 
	{ send_data_read sc_out sc_logic 1 signal 2 } 
	{ i_1_dout sc_in sc_lv 7 signal 3 } 
	{ i_1_empty_n sc_in sc_logic 1 signal 3 } 
	{ i_1_read sc_out sc_logic 1 signal 3 } 
	{ output_length_dout sc_in sc_lv 64 signal 4 } 
	{ output_length_empty_n sc_in sc_logic 1 signal 4 } 
	{ output_length_read sc_out sc_logic 1 signal 4 } 
	{ outStream_code_flg_dout sc_in sc_lv 8 signal 5 } 
	{ outStream_code_flg_empty_n sc_in sc_logic 1 signal 5 } 
	{ outStream_code_flg_read sc_out sc_logic 1 signal 5 } 
	{ outStream_code_dout sc_in sc_lv 13 signal 6 } 
	{ outStream_code_empty_n sc_in sc_logic 1 signal 6 } 
	{ outStream_code_read sc_out sc_logic 1 signal 6 } 
	{ output_offset_constprop_i sc_in sc_lv 32 signal 7 } 
	{ output_offset_constprop_o sc_out sc_lv 32 signal 7 } 
	{ output_offset_constprop_o_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
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
 	{ "name": "m_axi_aximm0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm0", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm0", "role": "WSTRB" }} , 
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
 	{ "name": "m_axi_aximm0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm0", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RID" }} , 
 	{ "name": "m_axi_aximm0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BID" }} , 
 	{ "name": "m_axi_aximm0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BUSER" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "send_data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data", "role": "dout" }} , 
 	{ "name": "send_data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data", "role": "empty_n" }} , 
 	{ "name": "send_data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data", "role": "read" }} , 
 	{ "name": "i_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "i_1", "role": "dout" }} , 
 	{ "name": "i_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i_1", "role": "empty_n" }} , 
 	{ "name": "i_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i_1", "role": "read" }} , 
 	{ "name": "output_length_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length", "role": "dout" }} , 
 	{ "name": "output_length_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length", "role": "empty_n" }} , 
 	{ "name": "output_length_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length", "role": "read" }} , 
 	{ "name": "outStream_code_flg_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "dout" }} , 
 	{ "name": "outStream_code_flg_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "empty_n" }} , 
 	{ "name": "outStream_code_flg_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "read" }} , 
 	{ "name": "outStream_code_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "outStream_code", "role": "dout" }} , 
 	{ "name": "outStream_code_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code", "role": "empty_n" }} , 
 	{ "name": "outStream_code_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code", "role": "read" }} , 
 	{ "name": "output_offset_constprop_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_offset_constprop", "role": "i" }} , 
 	{ "name": "output_offset_constprop_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_offset_constprop", "role": "o" }} , 
 	{ "name": "output_offset_constprop_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_offset_constprop", "role": "o_ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "write_result",
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
			{"Name" : "aximm0", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "aximm0_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "send_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "i_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "i_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code_flg", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_flg_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_offset_constprop", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.store_array_i_i_i_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	write_result {
		aximm0 {Type O LastRead 12 FirstWrite 6}
		empty {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		i_1 {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		outStream_code_flg {Type I LastRead 2 FirstWrite -1}
		outStream_code {Type I LastRead 1 FirstWrite -1}
		output_offset_constprop {Type IO LastRead 3 FirstWrite 9}}}

set hasDtUnsupportedChannel 1

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
	{"Pipeline" : "3", "EnableSignal" : "ap_enable_pp3"}
]}

set Spec2ImplPortList { 
	aximm0 { m_axi {  { m_axi_aximm0_AWVALID VALID 1 1 }  { m_axi_aximm0_AWREADY READY 0 1 }  { m_axi_aximm0_AWADDR ADDR 1 64 }  { m_axi_aximm0_AWID ID 1 1 }  { m_axi_aximm0_AWLEN LEN 1 32 }  { m_axi_aximm0_AWSIZE SIZE 1 3 }  { m_axi_aximm0_AWBURST BURST 1 2 }  { m_axi_aximm0_AWLOCK LOCK 1 2 }  { m_axi_aximm0_AWCACHE CACHE 1 4 }  { m_axi_aximm0_AWPROT PROT 1 3 }  { m_axi_aximm0_AWQOS QOS 1 4 }  { m_axi_aximm0_AWREGION REGION 1 4 }  { m_axi_aximm0_AWUSER USER 1 1 }  { m_axi_aximm0_WVALID VALID 1 1 }  { m_axi_aximm0_WREADY READY 0 1 }  { m_axi_aximm0_WDATA DATA 1 64 }  { m_axi_aximm0_WSTRB STRB 1 8 }  { m_axi_aximm0_WLAST LAST 1 1 }  { m_axi_aximm0_WID ID 1 1 }  { m_axi_aximm0_WUSER USER 1 1 }  { m_axi_aximm0_ARVALID VALID 1 1 }  { m_axi_aximm0_ARREADY READY 0 1 }  { m_axi_aximm0_ARADDR ADDR 1 64 }  { m_axi_aximm0_ARID ID 1 1 }  { m_axi_aximm0_ARLEN LEN 1 32 }  { m_axi_aximm0_ARSIZE SIZE 1 3 }  { m_axi_aximm0_ARBURST BURST 1 2 }  { m_axi_aximm0_ARLOCK LOCK 1 2 }  { m_axi_aximm0_ARCACHE CACHE 1 4 }  { m_axi_aximm0_ARPROT PROT 1 3 }  { m_axi_aximm0_ARQOS QOS 1 4 }  { m_axi_aximm0_ARREGION REGION 1 4 }  { m_axi_aximm0_ARUSER USER 1 1 }  { m_axi_aximm0_RVALID VALID 0 1 }  { m_axi_aximm0_RREADY READY 1 1 }  { m_axi_aximm0_RDATA DATA 0 64 }  { m_axi_aximm0_RLAST LAST 0 1 }  { m_axi_aximm0_RID ID 0 1 }  { m_axi_aximm0_RUSER USER 0 1 }  { m_axi_aximm0_RRESP RESP 0 2 }  { m_axi_aximm0_BVALID VALID 0 1 }  { m_axi_aximm0_BREADY READY 1 1 }  { m_axi_aximm0_BRESP RESP 0 2 }  { m_axi_aximm0_BID ID 0 1 }  { m_axi_aximm0_BUSER USER 0 1 } } }
	empty { ap_none {  { empty in_data 0 16 } } }
	send_data { ap_fifo {  { send_data_dout fifo_data 0 64 }  { send_data_empty_n fifo_status 0 1 }  { send_data_read fifo_update 1 1 } } }
	i_1 { ap_fifo {  { i_1_dout fifo_data 0 7 }  { i_1_empty_n fifo_status 0 1 }  { i_1_read fifo_update 1 1 } } }
	output_length { ap_fifo {  { output_length_dout fifo_data 0 64 }  { output_length_empty_n fifo_status 0 1 }  { output_length_read fifo_update 1 1 } } }
	outStream_code_flg { ap_fifo {  { outStream_code_flg_dout fifo_data 0 8 }  { outStream_code_flg_empty_n fifo_status 0 1 }  { outStream_code_flg_read fifo_update 1 1 } } }
	outStream_code { ap_fifo {  { outStream_code_dout fifo_data 0 13 }  { outStream_code_empty_n fifo_status 0 1 }  { outStream_code_read fifo_update 1 1 } } }
	output_offset_constprop { ap_ovld {  { output_offset_constprop_i in_data 0 32 }  { output_offset_constprop_o out_data 1 32 }  { output_offset_constprop_o_ap_vld out_vld 1 1 } } }
}
