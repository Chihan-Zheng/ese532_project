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
	{ input_length uint 16 regular  }
	{ inStream_in int 8 regular {fifo 0 volatile } {global 0}  }
	{ outStream_code int 13 regular {fifo 1 volatile } {global 1}  }
	{ outStream_code_flg int 8 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_length", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "inStream_in", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "outStream_code", "interface" : "fifo", "bitwidth" : 13, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "outStream_code_flg", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_length sc_in sc_lv 16 signal 0 } 
	{ inStream_in_dout sc_in sc_lv 8 signal 1 } 
	{ inStream_in_empty_n sc_in sc_logic 1 signal 1 } 
	{ inStream_in_read sc_out sc_logic 1 signal 1 } 
	{ outStream_code_din sc_out sc_lv 13 signal 2 } 
	{ outStream_code_full_n sc_in sc_logic 1 signal 2 } 
	{ outStream_code_write sc_out sc_logic 1 signal 2 } 
	{ outStream_code_flg_din sc_out sc_lv 8 signal 3 } 
	{ outStream_code_flg_full_n sc_in sc_logic 1 signal 3 } 
	{ outStream_code_flg_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_length", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_length", "role": "default" }} , 
 	{ "name": "inStream_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inStream_in", "role": "dout" }} , 
 	{ "name": "inStream_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in", "role": "empty_n" }} , 
 	{ "name": "inStream_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream_in", "role": "read" }} , 
 	{ "name": "outStream_code_din", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "outStream_code", "role": "din" }} , 
 	{ "name": "outStream_code_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code", "role": "full_n" }} , 
 	{ "name": "outStream_code_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code", "role": "write" }} , 
 	{ "name": "outStream_code_flg_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "din" }} , 
 	{ "name": "outStream_code_flg_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "full_n" }} , 
 	{ "name": "outStream_code_flg_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outStream_code_flg", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hash_table_V_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.my_assoc_mem_upper_key_mem_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.my_assoc_mem_middle_key_mem_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.my_assoc_mem_lower_key_mem_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.my_assoc_mem_value_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	compute_LZW {
		input_length {Type I LastRead 0 FirstWrite -1}
		inStream_in {Type I LastRead 258 FirstWrite -1}
		outStream_code {Type O LastRead -1 FirstWrite 258}
		outStream_code_flg {Type O LastRead -1 FirstWrite 258}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "33026", "Max" : "9666524"}
	, {"Name" : "Interval", "Min" : "33026", "Max" : "9666524"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_length { ap_none {  { input_length in_data 0 16 } } }
	inStream_in { ap_fifo {  { inStream_in_dout fifo_data 0 8 }  { inStream_in_empty_n fifo_status 0 1 }  { inStream_in_read fifo_update 1 1 } } }
	outStream_code { ap_fifo {  { outStream_code_din fifo_data 1 13 }  { outStream_code_full_n fifo_status 0 1 }  { outStream_code_write fifo_update 1 1 } } }
	outStream_code_flg { ap_fifo {  { outStream_code_flg_din fifo_data 1 8 }  { outStream_code_flg_full_n fifo_status 0 1 }  { outStream_code_flg_write fifo_update 1 1 } } }
}
