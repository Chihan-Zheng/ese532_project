set moduleName dataflow_parent_loop_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {dataflow_parent_loop_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ num_chunks int 8 regular  }
	{ aximm0 int 64 regular {axi_master 2}  }
	{ input_r int 64 regular  }
	{ send_data int 64 regular  }
	{ output_length int 64 regular  }
	{ inStream_in_length int 16 regular {fifo 0 volatile } {global 0}  }
	{ input_offset_constprop int 32 regular {pointer 2} {global 2}  }
	{ output_offset_constprop int 32 regular {pointer 2} {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "num_chunks", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "aximm0", "interface" : "axi_master", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "input_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "send_data", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_length", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "inStream_in_length", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "input_offset_constprop", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "output_offset_constprop", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ num_chunks sc_in sc_lv 8 signal 0 } 
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
	{ m_axi_aximm0_WDATA sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm0_WSTRB sc_out sc_lv 8 signal 1 } 
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
	{ m_axi_aximm0_RDATA sc_in sc_lv 64 signal 1 } 
	{ m_axi_aximm0_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm0_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm0_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm0_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm0_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm0_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm0_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm0_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm0_BUSER sc_in sc_lv 1 signal 1 } 
	{ input_r sc_in sc_lv 64 signal 2 } 
	{ send_data sc_in sc_lv 64 signal 3 } 
	{ output_length sc_in sc_lv 64 signal 4 } 
	{ inStream_in_length_dout sc_in sc_lv 16 signal 5 } 
	{ inStream_in_length_empty_n sc_in sc_logic 1 signal 5 } 
	{ inStream_in_length_read sc_out sc_logic 1 signal 5 } 
	{ input_offset_constprop_i sc_in sc_lv 32 signal 6 } 
	{ input_offset_constprop_o sc_out sc_lv 32 signal 6 } 
	{ output_offset_constprop_i sc_in sc_lv 32 signal 7 } 
	{ output_offset_constprop_o sc_out sc_lv 32 signal 7 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ input_r_ap_vld sc_in sc_logic 1 invld 2 } 
	{ send_data_ap_vld sc_in sc_logic 1 invld 3 } 
	{ output_length_ap_vld sc_in sc_logic 1 invld 4 } 
	{ input_offset_constprop_i_ap_vld sc_in sc_logic 1 invld 6 } 
	{ input_offset_constprop_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ output_offset_constprop_i_ap_vld sc_in sc_logic 1 invld 7 } 
	{ output_offset_constprop_o_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "num_chunks", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "num_chunks", "role": "default" }} , 
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
 	{ "name": "input_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_r", "role": "default" }} , 
 	{ "name": "send_data", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data", "role": "default" }} , 
 	{ "name": "output_length", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length", "role": "default" }} , 
 	{ "name": "inStream_in_length_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "inStream_in_length", "role": "dout" }} , 
 	{ "name": "inStream_in_length_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in_length", "role": "empty_n" }} , 
 	{ "name": "inStream_in_length_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in_length", "role": "read" }} , 
 	{ "name": "input_offset_constprop_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_offset_constprop", "role": "i" }} , 
 	{ "name": "input_offset_constprop_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_offset_constprop", "role": "o" }} , 
 	{ "name": "output_offset_constprop_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_offset_constprop", "role": "i" }} , 
 	{ "name": "output_offset_constprop_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_offset_constprop", "role": "o" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "input_r_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_r", "role": "ap_vld" }} , 
 	{ "name": "send_data_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "send_data", "role": "ap_vld" }} , 
 	{ "name": "output_length_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "output_length", "role": "ap_vld" }} , 
 	{ "name": "input_offset_constprop_i_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_offset_constprop", "role": "i_ap_vld" }} , 
 	{ "name": "input_offset_constprop_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "input_offset_constprop", "role": "o_ap_vld" }} , 
 	{ "name": "output_offset_constprop_i_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "output_offset_constprop", "role": "i_ap_vld" }} , 
 	{ "name": "output_offset_constprop_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_offset_constprop", "role": "o_ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "dataflow_parent_loop_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "dataflow_in_loop_VITIS_LOOP_346_2_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "dataflow_in_loop_VITIS_LOOP_346_2_U0"}],
		"Port" : [
			{"Name" : "num_chunks", "Type" : "None", "Direction" : "I"},
			{"Name" : "aximm0", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_VITIS_LOOP_346_2_U0", "Port" : "aximm0"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "send_data", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "inStream_in_length", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_VITIS_LOOP_346_2_U0", "Port" : "inStream_in_length"}]},
			{"Name" : "input_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_VITIS_LOOP_346_2_U0", "Port" : "input_offset_constprop"}]},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_VITIS_LOOP_346_2_U0", "Port" : "inStream_in"}]},
			{"Name" : "outStream_code_flg", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_VITIS_LOOP_346_2_U0", "Port" : "outStream_code_flg"}]},
			{"Name" : "outStream_code", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_VITIS_LOOP_346_2_U0", "Port" : "outStream_code"}]},
			{"Name" : "output_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_VITIS_LOOP_346_2_U0", "Port" : "output_offset_constprop"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "12", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26"],
		"CDFG" : "dataflow_in_loop_VITIS_LOOP_346_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "2", "Name" : "dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0"},
			{"ID" : "4", "Name" : "Block_entry_proc_proc_U0"},
			{"ID" : "5", "Name" : "read_input_U0"},
			{"ID" : "12", "Name" : "write_result_U0"}],
		"OutputProcess" : [
			{"ID" : "5", "Name" : "read_input_U0"},
			{"ID" : "12", "Name" : "write_result_U0"}],
		"Port" : [
			{"Name" : "aximm0", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "write_result_U0", "Port" : "aximm0"},
					{"ID" : "5", "SubInstance" : "read_input_U0", "Port" : "aximm0"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "send_data", "Type" : "None", "Direction" : "I"},
			{"Name" : "i_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "inStream_in_length", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "Block_entry_proc_proc_U0", "Port" : "inStream_in_length"}]},
			{"Name" : "input_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "read_input_U0", "Port" : "input_offset_constprop"}]},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "compute_LZW_U0", "Port" : "inStream_in"},
					{"ID" : "5", "SubInstance" : "read_input_U0", "Port" : "inStream_in"}]},
			{"Name" : "outStream_code_flg", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "compute_LZW_U0", "Port" : "outStream_code_flg"},
					{"ID" : "12", "SubInstance" : "write_result_U0", "Port" : "outStream_code_flg"}]},
			{"Name" : "outStream_code", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "compute_LZW_U0", "Port" : "outStream_code"},
					{"ID" : "12", "SubInstance" : "write_result_U0", "Port" : "outStream_code"}]},
			{"Name" : "output_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "write_result_U0", "Port" : "output_offset_constprop"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry3_U0", "Parent" : "1",
		"CDFG" : "dataflow_in_loop_VITIS_LOOP_346_2_entry3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "send_data", "Type" : "None", "Direction" : "I"},
			{"Name" : "i_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "3", "DependentChan" : "14", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "3", "DependentChan" : "15", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "i_1_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "3", "DependentChan" : "16", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "i_1_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "3", "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0", "Parent" : "1",
		"CDFG" : "dataflow_in_loop_VITIS_LOOP_346_2_entry6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "2",
		"StartFifo" : "start_for_dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0_U",
		"Port" : [
			{"Name" : "input_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "14", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "15", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "i_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "16", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "i_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "18", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "12", "DependentChan" : "19", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "i_1_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "12", "DependentChan" : "20", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "i_1_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "12", "DependentChan" : "21", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.Block_entry_proc_proc_U0", "Parent" : "1",
		"CDFG" : "Block_entry_proc_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inStream_in_length", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "inStream_in_length_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.read_input_U0", "Parent" : "1",
		"CDFG" : "read_input",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "65608",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "aximm0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "aximm0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "18", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_offset_constprop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "6", "DependentChan" : "22", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_in_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0", "Parent" : "1", "Child" : ["7", "8", "9", "10", "11"],
		"CDFG" : "compute_LZW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "33026", "EstimateLatencyMax" : "9666524",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "5",
		"StartFifo" : "start_for_compute_LZW_U0_U",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "22", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code_flg", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "12", "DependentChan" : "23", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_flg_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "12", "DependentChan" : "24", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0.hash_table_V_0_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0.my_assoc_mem_upper_key_mem_V_U", "Parent" : "6"},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0.my_assoc_mem_middle_key_mem_V_U", "Parent" : "6"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0.my_assoc_mem_lower_key_mem_V_U", "Parent" : "6"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.compute_LZW_U0.my_assoc_mem_value_V_U", "Parent" : "6"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0", "Parent" : "1", "Child" : ["13"],
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
			{"Name" : "send_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "19", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "i_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "20", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "i_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "21", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code_flg", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "23", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_flg_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "24", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_offset_constprop", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.write_result_U0.store_array_i_i_i_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.input_c1_U", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.send_data_c2_U", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.i_1_c3_U", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.output_length_c4_U", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.input_c_U", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.send_data_c_U", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.i_1_c_U", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.output_length_c_U", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.inStream_in_U", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.outStream_code_flg_U", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.outStream_code_U", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_dataflow_in_loop_VITIS_LOOP_346_2_entry6_U0_U", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_346_2_U0.start_for_compute_LZW_U0_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	dataflow_parent_loop_proc {
		num_chunks {Type I LastRead 0 FirstWrite -1}
		aximm0 {Type IO LastRead 72 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		inStream_in_length {Type I LastRead 0 FirstWrite -1}
		input_offset_constprop {Type IO LastRead 0 FirstWrite 2}
		inStream_in {Type IO LastRead -1 FirstWrite -1}
		outStream_code_flg {Type IO LastRead -1 FirstWrite -1}
		outStream_code {Type IO LastRead -1 FirstWrite -1}
		output_offset_constprop {Type IO LastRead 3 FirstWrite 9}}
	dataflow_in_loop_VITIS_LOOP_346_2 {
		aximm0 {Type IO LastRead 72 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		i_1 {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		inStream_in_length {Type I LastRead 0 FirstWrite -1}
		input_offset_constprop {Type IO LastRead 0 FirstWrite 2}
		inStream_in {Type IO LastRead -1 FirstWrite -1}
		outStream_code_flg {Type IO LastRead -1 FirstWrite -1}
		outStream_code {Type IO LastRead -1 FirstWrite -1}
		output_offset_constprop {Type IO LastRead 3 FirstWrite 9}}
	dataflow_in_loop_VITIS_LOOP_346_2_entry3 {
		input_r {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		i_1 {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		input_out {Type O LastRead -1 FirstWrite 0}
		send_data_out {Type O LastRead -1 FirstWrite 0}
		i_1_out {Type O LastRead -1 FirstWrite 0}
		output_length_out {Type O LastRead -1 FirstWrite 0}}
	dataflow_in_loop_VITIS_LOOP_346_2_entry6 {
		input_r {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		i_1 {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		input_out {Type O LastRead -1 FirstWrite 0}
		send_data_out {Type O LastRead -1 FirstWrite 0}
		i_1_out {Type O LastRead -1 FirstWrite 0}
		output_length_out {Type O LastRead -1 FirstWrite 0}}
	Block_entry_proc_proc {
		empty {Type O LastRead -1 FirstWrite 0}
		inStream_in_length {Type I LastRead 0 FirstWrite -1}}
	read_input {
		aximm0 {Type I LastRead 72 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		input_offset_constprop {Type IO LastRead 0 FirstWrite 2}
		inStream_in {Type O LastRead -1 FirstWrite 73}}
	compute_LZW {
		empty {Type I LastRead 0 FirstWrite -1}
		inStream_in {Type I LastRead 258 FirstWrite -1}
		outStream_code_flg {Type O LastRead -1 FirstWrite 258}
		outStream_code {Type O LastRead -1 FirstWrite 258}}
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
]}

set Spec2ImplPortList { 
	num_chunks { ap_none {  { num_chunks in_data 0 8 } } }
	aximm0 { m_axi {  { m_axi_aximm0_AWVALID VALID 1 1 }  { m_axi_aximm0_AWREADY READY 0 1 }  { m_axi_aximm0_AWADDR ADDR 1 64 }  { m_axi_aximm0_AWID ID 1 1 }  { m_axi_aximm0_AWLEN LEN 1 32 }  { m_axi_aximm0_AWSIZE SIZE 1 3 }  { m_axi_aximm0_AWBURST BURST 1 2 }  { m_axi_aximm0_AWLOCK LOCK 1 2 }  { m_axi_aximm0_AWCACHE CACHE 1 4 }  { m_axi_aximm0_AWPROT PROT 1 3 }  { m_axi_aximm0_AWQOS QOS 1 4 }  { m_axi_aximm0_AWREGION REGION 1 4 }  { m_axi_aximm0_AWUSER USER 1 1 }  { m_axi_aximm0_WVALID VALID 1 1 }  { m_axi_aximm0_WREADY READY 0 1 }  { m_axi_aximm0_WDATA DATA 1 64 }  { m_axi_aximm0_WSTRB STRB 1 8 }  { m_axi_aximm0_WLAST LAST 1 1 }  { m_axi_aximm0_WID ID 1 1 }  { m_axi_aximm0_WUSER USER 1 1 }  { m_axi_aximm0_ARVALID VALID 1 1 }  { m_axi_aximm0_ARREADY READY 0 1 }  { m_axi_aximm0_ARADDR ADDR 1 64 }  { m_axi_aximm0_ARID ID 1 1 }  { m_axi_aximm0_ARLEN LEN 1 32 }  { m_axi_aximm0_ARSIZE SIZE 1 3 }  { m_axi_aximm0_ARBURST BURST 1 2 }  { m_axi_aximm0_ARLOCK LOCK 1 2 }  { m_axi_aximm0_ARCACHE CACHE 1 4 }  { m_axi_aximm0_ARPROT PROT 1 3 }  { m_axi_aximm0_ARQOS QOS 1 4 }  { m_axi_aximm0_ARREGION REGION 1 4 }  { m_axi_aximm0_ARUSER USER 1 1 }  { m_axi_aximm0_RVALID VALID 0 1 }  { m_axi_aximm0_RREADY READY 1 1 }  { m_axi_aximm0_RDATA DATA 0 64 }  { m_axi_aximm0_RLAST LAST 0 1 }  { m_axi_aximm0_RID ID 0 1 }  { m_axi_aximm0_RUSER USER 0 1 }  { m_axi_aximm0_RRESP RESP 0 2 }  { m_axi_aximm0_BVALID VALID 0 1 }  { m_axi_aximm0_BREADY READY 1 1 }  { m_axi_aximm0_BRESP RESP 0 2 }  { m_axi_aximm0_BID ID 0 1 }  { m_axi_aximm0_BUSER USER 0 1 } } }
	input_r { ap_none {  { input_r in_data 0 64 }  { input_r_ap_vld in_vld 0 1 } } }
	send_data { ap_none {  { send_data in_data 0 64 }  { send_data_ap_vld in_vld 0 1 } } }
	output_length { ap_none {  { output_length in_data 0 64 }  { output_length_ap_vld in_vld 0 1 } } }
	inStream_in_length { ap_fifo {  { inStream_in_length_dout fifo_data 0 16 }  { inStream_in_length_empty_n fifo_status 0 1 }  { inStream_in_length_read fifo_update 1 1 } } }
	input_offset_constprop { ap_ovld {  { input_offset_constprop_i in_data 0 32 }  { input_offset_constprop_o out_data 1 32 }  { input_offset_constprop_i_ap_vld in_vld 0 1 }  { input_offset_constprop_o_ap_vld out_vld 1 1 } } }
	output_offset_constprop { ap_ovld {  { output_offset_constprop_i in_data 0 32 }  { output_offset_constprop_o out_data 1 32 }  { output_offset_constprop_i_ap_vld in_vld 0 1 }  { output_offset_constprop_o_ap_vld out_vld 1 1 } } }
}
