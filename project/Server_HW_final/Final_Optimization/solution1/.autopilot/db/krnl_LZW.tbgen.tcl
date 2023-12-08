set moduleName krnl_LZW
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {krnl_LZW}
set C_modelType { void 0 }
set C_modelArgList {
	{ aximm0 int 16 regular {axi_master 2}  }
	{ aximm1 int 16 regular {axi_master 2}  }
	{ in_r int 64 regular {axi_slave 0}  }
	{ input_length int 64 regular {axi_slave 0}  }
	{ send_data int 64 regular {axi_slave 0}  }
	{ output_length int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "aximm0", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in","cData": "short","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "in_r","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]},{"cName": "output_length","cData": "short","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "output_length","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "aximm1", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "input_length","cData": "short","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "input_length","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]},{"cName": "send_data","cData": "short","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "send_data","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "input_length", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "send_data", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "output_length", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ m_axi_aximm0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_aximm0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_aximm0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm0_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_aximm0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_aximm0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_aximm1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_aximm1_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_aximm1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_aximm1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_aximm1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_aximm1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm1_BUSER sc_in sc_lv 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"krnl_LZW","role":"start","value":"0","valid_bit":"0"},{"name":"krnl_LZW","role":"continue","value":"0","valid_bit":"4"},{"name":"krnl_LZW","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_r","role":"data","value":"16"},{"name":"input_length","role":"data","value":"28"},{"name":"send_data","role":"data","value":"40"},{"name":"output_length","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"krnl_LZW","role":"start","value":"0","valid_bit":"0"},{"name":"krnl_LZW","role":"done","value":"0","valid_bit":"1"},{"name":"krnl_LZW","role":"idle","value":"0","valid_bit":"2"},{"name":"krnl_LZW","role":"ready","value":"0","valid_bit":"3"},{"name":"krnl_LZW","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_aximm0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm0", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_aximm0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm0", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "WID" }} , 
 	{ "name": "m_axi_aximm0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm0", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_aximm0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm0", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RID" }} , 
 	{ "name": "m_axi_aximm0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm0", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BID" }} , 
 	{ "name": "m_axi_aximm0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm0", "role": "BUSER" }} , 
 	{ "name": "m_axi_aximm1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm1", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_aximm1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm1", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WID" }} , 
 	{ "name": "m_axi_aximm1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm1", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_aximm1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm1", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RID" }} , 
 	{ "name": "m_axi_aximm1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BID" }} , 
 	{ "name": "m_axi_aximm1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "krnl_LZW",
		"Protocol" : "ap_ctrl_chain",
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
			{"ID" : "6", "Name" : "krnl_LZW_entry4_U0"},
			{"ID" : "7", "Name" : "Loop_VITIS_LOOP_318_1_proc_U0"},
			{"ID" : "9", "Name" : "Loop_VITIS_LOOP_325_2_proc_U0"}],
		"OutputProcess" : [
			{"ID" : "9", "Name" : "Loop_VITIS_LOOP_325_2_proc_U0"}],
		"Port" : [
			{"Name" : "aximm0", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "Loop_VITIS_LOOP_325_2_proc_U0", "Port" : "aximm0"}]},
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "Loop_VITIS_LOOP_318_1_proc_U0", "Port" : "aximm1"},
					{"ID" : "9", "SubInstance" : "Loop_VITIS_LOOP_325_2_proc_U0", "Port" : "aximm1"}]},
			{"Name" : "in_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "send_data", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "outStream_code_flg", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "Loop_VITIS_LOOP_325_2_proc_U0", "Port" : "outStream_code_flg"}]},
			{"Name" : "outStream_code", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "Loop_VITIS_LOOP_325_2_proc_U0", "Port" : "outStream_code"}]},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "Loop_VITIS_LOOP_325_2_proc_U0", "Port" : "inStream_in"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.aximm0_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.aximm1_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.store_array_i_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_length_temp_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.krnl_LZW_entry4_U0", "Parent" : "0",
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
			{"Name" : "in_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "9", "DependentChan" : "16", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_length_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "18", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data_out1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "9", "DependentChan" : "19", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_out1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "9", "DependentChan" : "20", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_318_1_proc_U0", "Parent" : "0",
		"CDFG" : "Loop_VITIS_LOOP_318_1_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "77", "EstimateLatencyMax" : "77",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "input_length_temp", "Type" : "Memory", "Direction" : "O", "DependentProc" : "9", "DependentChan" : "5"},
			{"Name" : "input_length", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_length_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "aximm1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_R", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_krnl_LZW_exit1_proc_U0", "Parent" : "0",
		"CDFG" : "Block_krnl_LZW_exit1_proc",
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
		"StartSource" : "6",
		"StartFifo" : "start_for_Block_krnl_LZW_exit1_proc_U0_U",
		"Port" : [
			{"Name" : "send_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "18", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_325_2_proc_U0", "Parent" : "0", "Child" : ["10"],
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "21", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "aximm0", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "aximm0_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_B", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "aximm0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "store_array_i", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "23", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "22", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "aximm1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "output_length", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "20", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_length_temp", "Type" : "Memory", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "5"},
			{"Name" : "in_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "16", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "19", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream_code_flg", "Type" : "Fifo", "Direction" : "IO", "DependentProc" : "9", "DependentChan" : "24", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_flg_i_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_compute_LZW_fu_612", "Port" : "outStream_code_flg"}]},
			{"Name" : "outStream_code", "Type" : "Fifo", "Direction" : "IO", "DependentProc" : "9", "DependentChan" : "25", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_code_i_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_compute_LZW_fu_612", "Port" : "outStream_code"}]},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "IO", "DependentProc" : "9", "DependentChan" : "26", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_in_o_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_compute_LZW_fu_612", "Port" : "inStream_in"}]}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_325_2_proc_U0.grp_compute_LZW_fu_612", "Parent" : "9", "Child" : ["11", "12", "13", "14", "15"],
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
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_325_2_proc_U0.grp_compute_LZW_fu_612.hash_table_V_0_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_325_2_proc_U0.grp_compute_LZW_fu_612.my_assoc_mem_upper_key_mem_V_U", "Parent" : "10"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_325_2_proc_U0.grp_compute_LZW_fu_612.my_assoc_mem_middle_key_mem_V_U", "Parent" : "10"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_325_2_proc_U0.grp_compute_LZW_fu_612.my_assoc_mem_lower_key_mem_V_U", "Parent" : "10"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Loop_VITIS_LOOP_325_2_proc_U0.grp_compute_LZW_fu_612.my_assoc_mem_value_V_U", "Parent" : "10"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_c_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_length_c_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.send_data_c_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.send_data_c115_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_length_c_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.num_chunks_loc_channel_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.send_data_cast_loc_channel_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_loc_channel_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.outStream_code_flg_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.outStream_code_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.inStream_in_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Block_krnl_LZW_exit1_proc_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	krnl_LZW {
		aximm0 {Type IO LastRead 152 FirstWrite 151}
		aximm1 {Type IO LastRead 152 FirstWrite -1}
		in_r {Type I LastRead 0 FirstWrite -1}
		input_length {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		outStream_code_flg {Type IO LastRead -1 FirstWrite -1}
		outStream_code {Type IO LastRead -1 FirstWrite -1}
		inStream_in {Type IO LastRead -1 FirstWrite -1}}
	krnl_LZW_entry4 {
		in_r {Type I LastRead 0 FirstWrite -1}
		input_length {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		in_out {Type O LastRead -1 FirstWrite 0}
		input_length_out {Type O LastRead -1 FirstWrite 0}
		send_data_out {Type O LastRead -1 FirstWrite 0}
		send_data_out1 {Type O LastRead -1 FirstWrite 0}
		output_length_out {Type O LastRead -1 FirstWrite 0}}
	Loop_VITIS_LOOP_318_1_proc {
		input_length_temp {Type O LastRead -1 FirstWrite 73}
		input_length {Type I LastRead 0 FirstWrite -1}
		aximm1 {Type I LastRead 72 FirstWrite -1}}
	Block_krnl_LZW_exit1_proc {
		send_data {Type I LastRead 0 FirstWrite -1}}
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
]}

set Spec2ImplPortList { 
	aximm0 { m_axi {  { m_axi_aximm0_AWVALID VALID 1 1 }  { m_axi_aximm0_AWREADY READY 0 1 }  { m_axi_aximm0_AWADDR ADDR 1 64 }  { m_axi_aximm0_AWID ID 1 1 }  { m_axi_aximm0_AWLEN LEN 1 8 }  { m_axi_aximm0_AWSIZE SIZE 1 3 }  { m_axi_aximm0_AWBURST BURST 1 2 }  { m_axi_aximm0_AWLOCK LOCK 1 2 }  { m_axi_aximm0_AWCACHE CACHE 1 4 }  { m_axi_aximm0_AWPROT PROT 1 3 }  { m_axi_aximm0_AWQOS QOS 1 4 }  { m_axi_aximm0_AWREGION REGION 1 4 }  { m_axi_aximm0_AWUSER USER 1 1 }  { m_axi_aximm0_WVALID VALID 1 1 }  { m_axi_aximm0_WREADY READY 0 1 }  { m_axi_aximm0_WDATA DATA 1 32 }  { m_axi_aximm0_WSTRB STRB 1 4 }  { m_axi_aximm0_WLAST LAST 1 1 }  { m_axi_aximm0_WID ID 1 1 }  { m_axi_aximm0_WUSER USER 1 1 }  { m_axi_aximm0_ARVALID VALID 1 1 }  { m_axi_aximm0_ARREADY READY 0 1 }  { m_axi_aximm0_ARADDR ADDR 1 64 }  { m_axi_aximm0_ARID ID 1 1 }  { m_axi_aximm0_ARLEN LEN 1 8 }  { m_axi_aximm0_ARSIZE SIZE 1 3 }  { m_axi_aximm0_ARBURST BURST 1 2 }  { m_axi_aximm0_ARLOCK LOCK 1 2 }  { m_axi_aximm0_ARCACHE CACHE 1 4 }  { m_axi_aximm0_ARPROT PROT 1 3 }  { m_axi_aximm0_ARQOS QOS 1 4 }  { m_axi_aximm0_ARREGION REGION 1 4 }  { m_axi_aximm0_ARUSER USER 1 1 }  { m_axi_aximm0_RVALID VALID 0 1 }  { m_axi_aximm0_RREADY READY 1 1 }  { m_axi_aximm0_RDATA DATA 0 32 }  { m_axi_aximm0_RLAST LAST 0 1 }  { m_axi_aximm0_RID ID 0 1 }  { m_axi_aximm0_RUSER USER 0 1 }  { m_axi_aximm0_RRESP RESP 0 2 }  { m_axi_aximm0_BVALID VALID 0 1 }  { m_axi_aximm0_BREADY READY 1 1 }  { m_axi_aximm0_BRESP RESP 0 2 }  { m_axi_aximm0_BID ID 0 1 }  { m_axi_aximm0_BUSER USER 0 1 } } }
	aximm1 { m_axi {  { m_axi_aximm1_AWVALID VALID 1 1 }  { m_axi_aximm1_AWREADY READY 0 1 }  { m_axi_aximm1_AWADDR ADDR 1 64 }  { m_axi_aximm1_AWID ID 1 1 }  { m_axi_aximm1_AWLEN LEN 1 8 }  { m_axi_aximm1_AWSIZE SIZE 1 3 }  { m_axi_aximm1_AWBURST BURST 1 2 }  { m_axi_aximm1_AWLOCK LOCK 1 2 }  { m_axi_aximm1_AWCACHE CACHE 1 4 }  { m_axi_aximm1_AWPROT PROT 1 3 }  { m_axi_aximm1_AWQOS QOS 1 4 }  { m_axi_aximm1_AWREGION REGION 1 4 }  { m_axi_aximm1_AWUSER USER 1 1 }  { m_axi_aximm1_WVALID VALID 1 1 }  { m_axi_aximm1_WREADY READY 0 1 }  { m_axi_aximm1_WDATA DATA 1 32 }  { m_axi_aximm1_WSTRB STRB 1 4 }  { m_axi_aximm1_WLAST LAST 1 1 }  { m_axi_aximm1_WID ID 1 1 }  { m_axi_aximm1_WUSER USER 1 1 }  { m_axi_aximm1_ARVALID VALID 1 1 }  { m_axi_aximm1_ARREADY READY 0 1 }  { m_axi_aximm1_ARADDR ADDR 1 64 }  { m_axi_aximm1_ARID ID 1 1 }  { m_axi_aximm1_ARLEN LEN 1 8 }  { m_axi_aximm1_ARSIZE SIZE 1 3 }  { m_axi_aximm1_ARBURST BURST 1 2 }  { m_axi_aximm1_ARLOCK LOCK 1 2 }  { m_axi_aximm1_ARCACHE CACHE 1 4 }  { m_axi_aximm1_ARPROT PROT 1 3 }  { m_axi_aximm1_ARQOS QOS 1 4 }  { m_axi_aximm1_ARREGION REGION 1 4 }  { m_axi_aximm1_ARUSER USER 1 1 }  { m_axi_aximm1_RVALID VALID 0 1 }  { m_axi_aximm1_RREADY READY 1 1 }  { m_axi_aximm1_RDATA DATA 0 32 }  { m_axi_aximm1_RLAST LAST 0 1 }  { m_axi_aximm1_RID ID 0 1 }  { m_axi_aximm1_RUSER USER 0 1 }  { m_axi_aximm1_RRESP RESP 0 2 }  { m_axi_aximm1_BVALID VALID 0 1 }  { m_axi_aximm1_BREADY READY 1 1 }  { m_axi_aximm1_BRESP RESP 0 2 }  { m_axi_aximm1_BID ID 0 1 }  { m_axi_aximm1_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ aximm0 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ aximm1 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ aximm0 64 }
	{ aximm1 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ aximm0 64 }
	{ aximm1 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
