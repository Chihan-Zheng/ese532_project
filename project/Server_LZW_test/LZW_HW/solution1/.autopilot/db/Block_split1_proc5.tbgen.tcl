set moduleName Block_split1_proc5
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
set C_modelName {Block_.split1_proc5}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_length int 64 regular  }
	{ aximm2 int 16 regular {axi_master 0}  }
	{ in_r int 64 regular  }
	{ send_data int 64 regular  }
	{ output_length int 64 regular  }
	{ in_len_V_out_out int 13 regular {fifo 1}  }
	{ in_out int 64 regular {fifo 1}  }
	{ send_data_out int 64 regular {fifo 1}  }
	{ output_length_out int 64 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_length", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "aximm2", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "in_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "send_data", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_length", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "in_len_V_out_out", "interface" : "fifo", "bitwidth" : 13, "direction" : "WRITEONLY"} , 
 	{ "Name" : "in_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "send_data_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_length_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 71
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ input_length sc_in sc_lv 64 signal 0 } 
	{ m_axi_aximm2_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm2_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_aximm2_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm2_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm2_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm2_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm2_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_WDATA sc_out sc_lv 16 signal 1 } 
	{ m_axi_aximm2_WSTRB sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm2_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm2_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_aximm2_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm2_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm2_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm2_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm2_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_RDATA sc_in sc_lv 16 signal 1 } 
	{ m_axi_aximm2_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm2_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm2_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm2_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm2_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm2_BUSER sc_in sc_lv 1 signal 1 } 
	{ in_r sc_in sc_lv 64 signal 2 } 
	{ send_data sc_in sc_lv 64 signal 3 } 
	{ output_length sc_in sc_lv 64 signal 4 } 
	{ in_len_V_out_out_din sc_out sc_lv 13 signal 5 } 
	{ in_len_V_out_out_full_n sc_in sc_logic 1 signal 5 } 
	{ in_len_V_out_out_write sc_out sc_logic 1 signal 5 } 
	{ in_out_din sc_out sc_lv 64 signal 6 } 
	{ in_out_full_n sc_in sc_logic 1 signal 6 } 
	{ in_out_write sc_out sc_logic 1 signal 6 } 
	{ send_data_out_din sc_out sc_lv 64 signal 7 } 
	{ send_data_out_full_n sc_in sc_logic 1 signal 7 } 
	{ send_data_out_write sc_out sc_logic 1 signal 7 } 
	{ output_length_out_din sc_out sc_lv 64 signal 8 } 
	{ output_length_out_full_n sc_in sc_logic 1 signal 8 } 
	{ output_length_out_write sc_out sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "input_length", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_length", "role": "default" }} , 
 	{ "name": "m_axi_aximm2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm2", "role": "AWLEN" }} , 
 	{ "name": "m_axi_aximm2_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm2", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_aximm2_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "AWBURST" }} , 
 	{ "name": "m_axi_aximm2_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_aximm2_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_aximm2_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm2", "role": "AWPROT" }} , 
 	{ "name": "m_axi_aximm2_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "AWQOS" }} , 
 	{ "name": "m_axi_aximm2_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "AWREGION" }} , 
 	{ "name": "m_axi_aximm2_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWUSER" }} , 
 	{ "name": "m_axi_aximm2_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WVALID" }} , 
 	{ "name": "m_axi_aximm2_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WREADY" }} , 
 	{ "name": "m_axi_aximm2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "aximm2", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WID" }} , 
 	{ "name": "m_axi_aximm2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm2", "role": "ARLEN" }} , 
 	{ "name": "m_axi_aximm2_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm2", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_aximm2_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "ARBURST" }} , 
 	{ "name": "m_axi_aximm2_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_aximm2_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_aximm2_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm2", "role": "ARPROT" }} , 
 	{ "name": "m_axi_aximm2_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "ARQOS" }} , 
 	{ "name": "m_axi_aximm2_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "ARREGION" }} , 
 	{ "name": "m_axi_aximm2_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARUSER" }} , 
 	{ "name": "m_axi_aximm2_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RVALID" }} , 
 	{ "name": "m_axi_aximm2_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RREADY" }} , 
 	{ "name": "m_axi_aximm2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "aximm2", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RID" }} , 
 	{ "name": "m_axi_aximm2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BID" }} , 
 	{ "name": "m_axi_aximm2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BUSER" }} , 
 	{ "name": "in_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_r", "role": "default" }} , 
 	{ "name": "send_data", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data", "role": "default" }} , 
 	{ "name": "output_length", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length", "role": "default" }} , 
 	{ "name": "in_len_V_out_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "in_len_V_out_out", "role": "din" }} , 
 	{ "name": "in_len_V_out_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_len_V_out_out", "role": "full_n" }} , 
 	{ "name": "in_len_V_out_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_len_V_out_out", "role": "write" }} , 
 	{ "name": "in_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_out", "role": "din" }} , 
 	{ "name": "in_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_out", "role": "full_n" }} , 
 	{ "name": "in_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_out", "role": "write" }} , 
 	{ "name": "send_data_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data_out", "role": "din" }} , 
 	{ "name": "send_data_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data_out", "role": "full_n" }} , 
 	{ "name": "send_data_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data_out", "role": "write" }} , 
 	{ "name": "output_length_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length_out", "role": "din" }} , 
 	{ "name": "output_length_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length_out", "role": "full_n" }} , 
 	{ "name": "output_length_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "Block_split1_proc5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "71", "EstimateLatencyMax" : "71",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "input_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "aximm2", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "aximm2_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "aximm2_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "in_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "send_data", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_len_V_out_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_len_V_out_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_out_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	Block_split1_proc5 {
		input_length {Type I LastRead 0 FirstWrite -1}
		aximm2 {Type I LastRead 70 FirstWrite -1}
		in_r {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		in_len_V_out_out {Type O LastRead -1 FirstWrite 71}
		in_out {Type O LastRead -1 FirstWrite 71}
		send_data_out {Type O LastRead -1 FirstWrite 71}
		output_length_out {Type O LastRead -1 FirstWrite 71}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "71", "Max" : "71"}
	, {"Name" : "Interval", "Min" : "71", "Max" : "71"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_length { ap_none {  { input_length in_data 0 64 } } }
	aximm2 { m_axi {  { m_axi_aximm2_AWVALID VALID 1 1 }  { m_axi_aximm2_AWREADY READY 0 1 }  { m_axi_aximm2_AWADDR ADDR 1 64 }  { m_axi_aximm2_AWID ID 1 1 }  { m_axi_aximm2_AWLEN LEN 1 32 }  { m_axi_aximm2_AWSIZE SIZE 1 3 }  { m_axi_aximm2_AWBURST BURST 1 2 }  { m_axi_aximm2_AWLOCK LOCK 1 2 }  { m_axi_aximm2_AWCACHE CACHE 1 4 }  { m_axi_aximm2_AWPROT PROT 1 3 }  { m_axi_aximm2_AWQOS QOS 1 4 }  { m_axi_aximm2_AWREGION REGION 1 4 }  { m_axi_aximm2_AWUSER USER 1 1 }  { m_axi_aximm2_WVALID VALID 1 1 }  { m_axi_aximm2_WREADY READY 0 1 }  { m_axi_aximm2_WDATA DATA 1 16 }  { m_axi_aximm2_WSTRB STRB 1 2 }  { m_axi_aximm2_WLAST LAST 1 1 }  { m_axi_aximm2_WID ID 1 1 }  { m_axi_aximm2_WUSER USER 1 1 }  { m_axi_aximm2_ARVALID VALID 1 1 }  { m_axi_aximm2_ARREADY READY 0 1 }  { m_axi_aximm2_ARADDR ADDR 1 64 }  { m_axi_aximm2_ARID ID 1 1 }  { m_axi_aximm2_ARLEN LEN 1 32 }  { m_axi_aximm2_ARSIZE SIZE 1 3 }  { m_axi_aximm2_ARBURST BURST 1 2 }  { m_axi_aximm2_ARLOCK LOCK 1 2 }  { m_axi_aximm2_ARCACHE CACHE 1 4 }  { m_axi_aximm2_ARPROT PROT 1 3 }  { m_axi_aximm2_ARQOS QOS 1 4 }  { m_axi_aximm2_ARREGION REGION 1 4 }  { m_axi_aximm2_ARUSER USER 1 1 }  { m_axi_aximm2_RVALID VALID 0 1 }  { m_axi_aximm2_RREADY READY 1 1 }  { m_axi_aximm2_RDATA DATA 0 16 }  { m_axi_aximm2_RLAST LAST 0 1 }  { m_axi_aximm2_RID ID 0 1 }  { m_axi_aximm2_RUSER USER 0 1 }  { m_axi_aximm2_RRESP RESP 0 2 }  { m_axi_aximm2_BVALID VALID 0 1 }  { m_axi_aximm2_BREADY READY 1 1 }  { m_axi_aximm2_BRESP RESP 0 2 }  { m_axi_aximm2_BID ID 0 1 }  { m_axi_aximm2_BUSER USER 0 1 } } }
	in_r { ap_none {  { in_r in_data 0 64 } } }
	send_data { ap_none {  { send_data in_data 0 64 } } }
	output_length { ap_none {  { output_length in_data 0 64 } } }
	in_len_V_out_out { ap_fifo {  { in_len_V_out_out_din fifo_data 1 13 }  { in_len_V_out_out_full_n fifo_status 0 1 }  { in_len_V_out_out_write fifo_update 1 1 } } }
	in_out { ap_fifo {  { in_out_din fifo_data 1 64 }  { in_out_full_n fifo_status 0 1 }  { in_out_write fifo_update 1 1 } } }
	send_data_out { ap_fifo {  { send_data_out_din fifo_data 1 64 }  { send_data_out_full_n fifo_status 0 1 }  { send_data_out_write fifo_update 1 1 } } }
	output_length_out { ap_fifo {  { output_length_out_din fifo_data 1 64 }  { output_length_out_full_n fifo_status 0 1 }  { output_length_out_write fifo_update 1 1 } } }
}
