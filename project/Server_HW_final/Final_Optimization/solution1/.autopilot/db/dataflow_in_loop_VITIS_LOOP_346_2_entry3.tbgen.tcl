set moduleName dataflow_in_loop_VITIS_LOOP_346_2_entry3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {dataflow_in_loop_VITIS_LOOP_346_2.entry3}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_r int 64 regular  }
	{ send_data int 64 regular  }
	{ i_1 int 7 regular  }
	{ output_length int 64 regular  }
	{ input_out int 64 regular {fifo 1}  }
	{ send_data_out int 64 regular {fifo 1}  }
	{ i_1_out int 7 regular {fifo 1}  }
	{ output_length_out int 64 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "send_data", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "i_1", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "output_length", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "input_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "send_data_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "i_1_out", "interface" : "fifo", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_length_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 26
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
	{ input_r sc_in sc_lv 64 signal 0 } 
	{ send_data sc_in sc_lv 64 signal 1 } 
	{ i_1 sc_in sc_lv 7 signal 2 } 
	{ output_length sc_in sc_lv 64 signal 3 } 
	{ input_out_din sc_out sc_lv 64 signal 4 } 
	{ input_out_full_n sc_in sc_logic 1 signal 4 } 
	{ input_out_write sc_out sc_logic 1 signal 4 } 
	{ send_data_out_din sc_out sc_lv 64 signal 5 } 
	{ send_data_out_full_n sc_in sc_logic 1 signal 5 } 
	{ send_data_out_write sc_out sc_logic 1 signal 5 } 
	{ i_1_out_din sc_out sc_lv 7 signal 6 } 
	{ i_1_out_full_n sc_in sc_logic 1 signal 6 } 
	{ i_1_out_write sc_out sc_logic 1 signal 6 } 
	{ output_length_out_din sc_out sc_lv 64 signal 7 } 
	{ output_length_out_full_n sc_in sc_logic 1 signal 7 } 
	{ output_length_out_write sc_out sc_logic 1 signal 7 } 
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
 	{ "name": "input_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_r", "role": "default" }} , 
 	{ "name": "send_data", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data", "role": "default" }} , 
 	{ "name": "i_1", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "i_1", "role": "default" }} , 
 	{ "name": "output_length", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length", "role": "default" }} , 
 	{ "name": "input_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_out", "role": "din" }} , 
 	{ "name": "input_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_out", "role": "full_n" }} , 
 	{ "name": "input_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_out", "role": "write" }} , 
 	{ "name": "send_data_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data_out", "role": "din" }} , 
 	{ "name": "send_data_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data_out", "role": "full_n" }} , 
 	{ "name": "send_data_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data_out", "role": "write" }} , 
 	{ "name": "i_1_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "i_1_out", "role": "din" }} , 
 	{ "name": "i_1_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i_1_out", "role": "full_n" }} , 
 	{ "name": "i_1_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i_1_out", "role": "write" }} , 
 	{ "name": "output_length_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length_out", "role": "din" }} , 
 	{ "name": "output_length_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length_out", "role": "full_n" }} , 
 	{ "name": "output_length_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "input_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "i_1_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "i_1_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_out_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	dataflow_in_loop_VITIS_LOOP_346_2_entry3 {
		input_r {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		i_1 {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		input_out {Type O LastRead -1 FirstWrite 0}
		send_data_out {Type O LastRead -1 FirstWrite 0}
		i_1_out {Type O LastRead -1 FirstWrite 0}
		output_length_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r { ap_none {  { input_r in_data 0 64 } } }
	send_data { ap_none {  { send_data in_data 0 64 } } }
	i_1 { ap_none {  { i_1 in_data 0 7 } } }
	output_length { ap_none {  { output_length in_data 0 64 } } }
	input_out { ap_fifo {  { input_out_din fifo_data 1 64 }  { input_out_full_n fifo_status 0 1 }  { input_out_write fifo_update 1 1 } } }
	send_data_out { ap_fifo {  { send_data_out_din fifo_data 1 64 }  { send_data_out_full_n fifo_status 0 1 }  { send_data_out_write fifo_update 1 1 } } }
	i_1_out { ap_fifo {  { i_1_out_din fifo_data 1 7 }  { i_1_out_full_n fifo_status 0 1 }  { i_1_out_write fifo_update 1 1 } } }
	output_length_out { ap_fifo {  { output_length_out_din fifo_data 1 64 }  { output_length_out_full_n fifo_status 0 1 }  { output_length_out_write fifo_update 1 1 } } }
}
