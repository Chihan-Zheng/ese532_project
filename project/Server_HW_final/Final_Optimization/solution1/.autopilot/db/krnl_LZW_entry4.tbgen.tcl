set moduleName krnl_LZW_entry4
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
set C_modelName {krnl_LZW.entry4}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_r int 64 regular  }
	{ input_length int 64 regular  }
	{ send_data int 64 regular  }
	{ output_length int 64 regular  }
	{ in_out int 64 regular {fifo 1}  }
	{ input_length_out int 64 regular {fifo 1}  }
	{ send_data_out int 64 regular {fifo 1}  }
	{ send_data_out1 int 64 regular {fifo 1}  }
	{ output_length_out int 64 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "input_length", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "send_data", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_length", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "in_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "input_length_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "send_data_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "send_data_out1", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_length_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 29
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
	{ in_r sc_in sc_lv 64 signal 0 } 
	{ input_length sc_in sc_lv 64 signal 1 } 
	{ send_data sc_in sc_lv 64 signal 2 } 
	{ output_length sc_in sc_lv 64 signal 3 } 
	{ in_out_din sc_out sc_lv 64 signal 4 } 
	{ in_out_full_n sc_in sc_logic 1 signal 4 } 
	{ in_out_write sc_out sc_logic 1 signal 4 } 
	{ input_length_out_din sc_out sc_lv 64 signal 5 } 
	{ input_length_out_full_n sc_in sc_logic 1 signal 5 } 
	{ input_length_out_write sc_out sc_logic 1 signal 5 } 
	{ send_data_out_din sc_out sc_lv 64 signal 6 } 
	{ send_data_out_full_n sc_in sc_logic 1 signal 6 } 
	{ send_data_out_write sc_out sc_logic 1 signal 6 } 
	{ send_data_out1_din sc_out sc_lv 64 signal 7 } 
	{ send_data_out1_full_n sc_in sc_logic 1 signal 7 } 
	{ send_data_out1_write sc_out sc_logic 1 signal 7 } 
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
 	{ "name": "in_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_r", "role": "default" }} , 
 	{ "name": "input_length", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_length", "role": "default" }} , 
 	{ "name": "send_data", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data", "role": "default" }} , 
 	{ "name": "output_length", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length", "role": "default" }} , 
 	{ "name": "in_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_out", "role": "din" }} , 
 	{ "name": "in_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_out", "role": "full_n" }} , 
 	{ "name": "in_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_out", "role": "write" }} , 
 	{ "name": "input_length_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_length_out", "role": "din" }} , 
 	{ "name": "input_length_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_length_out", "role": "full_n" }} , 
 	{ "name": "input_length_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_length_out", "role": "write" }} , 
 	{ "name": "send_data_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data_out", "role": "din" }} , 
 	{ "name": "send_data_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data_out", "role": "full_n" }} , 
 	{ "name": "send_data_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data_out", "role": "write" }} , 
 	{ "name": "send_data_out1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "send_data_out1", "role": "din" }} , 
 	{ "name": "send_data_out1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data_out1", "role": "full_n" }} , 
 	{ "name": "send_data_out1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "send_data_out1", "role": "write" }} , 
 	{ "name": "output_length_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length_out", "role": "din" }} , 
 	{ "name": "output_length_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length_out", "role": "full_n" }} , 
 	{ "name": "output_length_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "krnl_LZW_entry4",
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
			{"Name" : "in_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "send_data", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_length_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data_out1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_out1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_out_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	krnl_LZW_entry4 {
		in_r {Type I LastRead 0 FirstWrite -1}
		input_length {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		in_out {Type O LastRead -1 FirstWrite 0}
		input_length_out {Type O LastRead -1 FirstWrite 0}
		send_data_out {Type O LastRead -1 FirstWrite 0}
		send_data_out1 {Type O LastRead -1 FirstWrite 0}
		output_length_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	in_r { ap_none {  { in_r in_data 0 64 } } }
	input_length { ap_none {  { input_length in_data 0 64 } } }
	send_data { ap_none {  { send_data in_data 0 64 } } }
	output_length { ap_none {  { output_length in_data 0 64 } } }
	in_out { ap_fifo {  { in_out_din fifo_data 1 64 }  { in_out_full_n fifo_status 0 1 }  { in_out_write fifo_update 1 1 } } }
	input_length_out { ap_fifo {  { input_length_out_din fifo_data 1 64 }  { input_length_out_full_n fifo_status 0 1 }  { input_length_out_write fifo_update 1 1 } } }
	send_data_out { ap_fifo {  { send_data_out_din fifo_data 1 64 }  { send_data_out_full_n fifo_status 0 1 }  { send_data_out_write fifo_update 1 1 } } }
	send_data_out1 { ap_fifo {  { send_data_out1_din fifo_data 1 64 }  { send_data_out1_full_n fifo_status 0 1 }  { send_data_out1_write fifo_update 1 1 } } }
	output_length_out { ap_fifo {  { output_length_out_din fifo_data 1 64 }  { output_length_out_full_n fifo_status 0 1 }  { output_length_out_write fifo_update 1 1 } } }
}
