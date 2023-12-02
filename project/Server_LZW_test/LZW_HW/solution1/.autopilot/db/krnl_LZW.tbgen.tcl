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
	{ aximm1 int 8 regular {axi_master 0}  }
	{ aximm2 int 16 regular {axi_master 0}  }
	{ aximm3 int 32 regular {axi_master 1}  }
	{ aximm4 int 16 regular {axi_master 1}  }
	{ in_r int 64 regular {axi_slave 0}  }
	{ input_length int 64 regular {axi_slave 0}  }
	{ send_data int 64 regular {axi_slave 0}  }
	{ output_length int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "aximm1", "interface" : "axi_master", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in","cData": "char","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "in_r","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "aximm2", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "input_length","cData": "short","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "input_length","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "aximm3", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "send_data","cData": "int","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "send_data","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "aximm4", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "output_length","cData": "short","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "output_length","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "input_length", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "send_data", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "output_length", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} ]}
# RTL Port declarations: 
set portNum 200
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
	{ m_axi_aximm1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_aximm1_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_aximm1_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm1_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_aximm1_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_aximm1_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm1_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm1_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm2_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm2_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_AWLEN sc_out sc_lv 8 signal 1 } 
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
	{ m_axi_aximm2_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_aximm2_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_aximm2_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_aximm2_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_aximm2_ARLEN sc_out sc_lv 8 signal 1 } 
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
	{ m_axi_aximm2_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_aximm2_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm2_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm2_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm2_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_aximm2_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_aximm2_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_aximm2_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm2_BUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_aximm3_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_aximm3_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_aximm3_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_aximm3_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_aximm3_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_aximm3_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_aximm3_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_aximm3_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_aximm3_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_aximm3_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_aximm3_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_aximm3_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_aximm3_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_aximm3_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_aximm3_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_aximm3_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_aximm3_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_aximm3_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_aximm3_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_aximm3_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_aximm3_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_aximm3_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_aximm3_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_aximm3_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_aximm3_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_aximm3_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_aximm3_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_aximm3_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_aximm3_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_aximm3_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_aximm3_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_aximm3_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_aximm3_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_aximm3_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_aximm3_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_aximm3_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_aximm3_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_aximm3_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_aximm3_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_aximm3_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_aximm3_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_aximm3_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_aximm3_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_aximm3_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_aximm3_BUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_aximm4_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_aximm4_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_aximm4_AWADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_aximm4_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_aximm4_AWLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_aximm4_AWSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_aximm4_AWBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_aximm4_AWLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_aximm4_AWCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_aximm4_AWPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_aximm4_AWQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_aximm4_AWREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_aximm4_AWUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_aximm4_WVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_aximm4_WREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_aximm4_WDATA sc_out sc_lv 32 signal 3 } 
	{ m_axi_aximm4_WSTRB sc_out sc_lv 4 signal 3 } 
	{ m_axi_aximm4_WLAST sc_out sc_logic 1 signal 3 } 
	{ m_axi_aximm4_WID sc_out sc_lv 1 signal 3 } 
	{ m_axi_aximm4_WUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_aximm4_ARVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_aximm4_ARREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_aximm4_ARADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_aximm4_ARID sc_out sc_lv 1 signal 3 } 
	{ m_axi_aximm4_ARLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_aximm4_ARSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_aximm4_ARBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_aximm4_ARLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_aximm4_ARCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_aximm4_ARPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_aximm4_ARQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_aximm4_ARREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_aximm4_ARUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_aximm4_RVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_aximm4_RREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_aximm4_RDATA sc_in sc_lv 32 signal 3 } 
	{ m_axi_aximm4_RLAST sc_in sc_logic 1 signal 3 } 
	{ m_axi_aximm4_RID sc_in sc_lv 1 signal 3 } 
	{ m_axi_aximm4_RUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_aximm4_RRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_aximm4_BVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_aximm4_BREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_aximm4_BRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_aximm4_BID sc_in sc_lv 1 signal 3 } 
	{ m_axi_aximm4_BUSER sc_in sc_lv 1 signal 3 } 
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
 	{ "name": "m_axi_aximm1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BUSER" }} , 
 	{ "name": "m_axi_aximm2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm2", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_aximm2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm2", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WID" }} , 
 	{ "name": "m_axi_aximm2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm2", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_aximm2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm2", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RID" }} , 
 	{ "name": "m_axi_aximm2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm2", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BID" }} , 
 	{ "name": "m_axi_aximm2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm2", "role": "BUSER" }} , 
 	{ "name": "m_axi_aximm3_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm3_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm3_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm3", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm3_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm3", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm3_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm3", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_aximm3_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm3", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_aximm4_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm4", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_aximm4_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm4", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm4_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm4", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm4_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm4_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "WID" }} , 
 	{ "name": "m_axi_aximm4_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm4_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm4_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm4_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm4", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm4_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm4_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm4", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_aximm4_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm4", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm4_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm4_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "RID" }} , 
 	{ "name": "m_axi_aximm4_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm4_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm4", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm4_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm4_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm4_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm4", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm4_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "BID" }} , 
 	{ "name": "m_axi_aximm4_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm4", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "14", "15", "16", "17", "18", "19", "20"],
		"CDFG" : "krnl_LZW",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "33058", "EstimateLatencyMax" : "1269894",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "6", "Name" : "Block_split1_proc5_U0"},
			{"ID" : "7", "Name" : "read_input_U0"}],
		"OutputProcess" : [
			{"ID" : "8", "Name" : "compute_LZW_U0"}],
		"Port" : [
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "read_input_U0", "Port" : "aximm1"}]},
			{"Name" : "aximm2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "Block_split1_proc5_U0", "Port" : "aximm2"}]},
			{"Name" : "aximm3", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "compute_LZW_U0", "Port" : "aximm3"}]},
			{"Name" : "aximm4", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "compute_LZW_U0", "Port" : "aximm4"}]},
			{"Name" : "in_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "send_data", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "compute_LZW_U0", "Port" : "inStream_in"},
					{"ID" : "7", "SubInstance" : "read_input_U0", "Port" : "inStream_in"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.aximm1_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.aximm2_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.aximm3_m_axi_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.aximm4_m_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_split1_proc5_U0", "Parent" : "0",
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
			{"Name" : "in_len_V_out_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "14", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_len_V_out_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "15", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "16", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "17", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.read_input_U0", "Parent" : "0",
		"CDFG" : "read_input",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "65608",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "aximm1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "in_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "15", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_len_V_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "14", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_len_V_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_len_V_loc_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "18", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_len_V_loc_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "8", "DependentChan" : "19", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_in_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.compute_LZW_U0", "Parent" : "0", "Child" : ["9", "10", "11", "12", "13"],
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
		"StartSource" : "6",
		"StartFifo" : "start_for_compute_LZW_U0_U",
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
			{"Name" : "in_len_V_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "18", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_len_V_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "send_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "16", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "send_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "17", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inStream_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "19", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_in_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.compute_LZW_U0.store_array_i_i_i_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.compute_LZW_U0.hash_table_V_0_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.compute_LZW_U0.my_assoc_mem_value_V_U", "Parent" : "8"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.compute_LZW_U0.mux_5129_72_1_1_U15", "Parent" : "8"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.compute_LZW_U0.mux_5129_72_1_1_U16", "Parent" : "8"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_len_V_loc_c_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_c_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.send_data_c_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_length_c_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_len_V_loc_c7_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.inStream_in_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_compute_LZW_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	krnl_LZW {
		aximm1 {Type I LastRead 72 FirstWrite -1}
		aximm2 {Type I LastRead 70 FirstWrite -1}
		aximm3 {Type O LastRead 79 FirstWrite 5}
		aximm4 {Type O LastRead 79 FirstWrite 78}
		in_r {Type I LastRead 0 FirstWrite -1}
		input_length {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		inStream_in {Type IO LastRead -1 FirstWrite -1}}
	Block_split1_proc5 {
		input_length {Type I LastRead 0 FirstWrite -1}
		aximm2 {Type I LastRead 70 FirstWrite -1}
		in_r {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		in_len_V_out_out {Type O LastRead -1 FirstWrite 71}
		in_out {Type O LastRead -1 FirstWrite 71}
		send_data_out {Type O LastRead -1 FirstWrite 71}
		output_length_out {Type O LastRead -1 FirstWrite 71}}
	read_input {
		aximm1 {Type I LastRead 72 FirstWrite -1}
		in_r {Type I LastRead 0 FirstWrite -1}
		in_len_V_loc {Type I LastRead 0 FirstWrite -1}
		in_len_V_loc_out {Type O LastRead -1 FirstWrite 0}
		inStream_in {Type O LastRead -1 FirstWrite 73}}
	compute_LZW {
		aximm3 {Type O LastRead 79 FirstWrite 5}
		aximm4 {Type O LastRead 79 FirstWrite 78}
		in_len_V_loc {Type I LastRead 0 FirstWrite -1}
		send_data {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		inStream_in {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "33058", "Max" : "1269894"}
	, {"Name" : "Interval", "Min" : "32915", "Max" : "1269751"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	aximm1 { m_axi {  { m_axi_aximm1_AWVALID VALID 1 1 }  { m_axi_aximm1_AWREADY READY 0 1 }  { m_axi_aximm1_AWADDR ADDR 1 64 }  { m_axi_aximm1_AWID ID 1 1 }  { m_axi_aximm1_AWLEN LEN 1 8 }  { m_axi_aximm1_AWSIZE SIZE 1 3 }  { m_axi_aximm1_AWBURST BURST 1 2 }  { m_axi_aximm1_AWLOCK LOCK 1 2 }  { m_axi_aximm1_AWCACHE CACHE 1 4 }  { m_axi_aximm1_AWPROT PROT 1 3 }  { m_axi_aximm1_AWQOS QOS 1 4 }  { m_axi_aximm1_AWREGION REGION 1 4 }  { m_axi_aximm1_AWUSER USER 1 1 }  { m_axi_aximm1_WVALID VALID 1 1 }  { m_axi_aximm1_WREADY READY 0 1 }  { m_axi_aximm1_WDATA DATA 1 32 }  { m_axi_aximm1_WSTRB STRB 1 4 }  { m_axi_aximm1_WLAST LAST 1 1 }  { m_axi_aximm1_WID ID 1 1 }  { m_axi_aximm1_WUSER USER 1 1 }  { m_axi_aximm1_ARVALID VALID 1 1 }  { m_axi_aximm1_ARREADY READY 0 1 }  { m_axi_aximm1_ARADDR ADDR 1 64 }  { m_axi_aximm1_ARID ID 1 1 }  { m_axi_aximm1_ARLEN LEN 1 8 }  { m_axi_aximm1_ARSIZE SIZE 1 3 }  { m_axi_aximm1_ARBURST BURST 1 2 }  { m_axi_aximm1_ARLOCK LOCK 1 2 }  { m_axi_aximm1_ARCACHE CACHE 1 4 }  { m_axi_aximm1_ARPROT PROT 1 3 }  { m_axi_aximm1_ARQOS QOS 1 4 }  { m_axi_aximm1_ARREGION REGION 1 4 }  { m_axi_aximm1_ARUSER USER 1 1 }  { m_axi_aximm1_RVALID VALID 0 1 }  { m_axi_aximm1_RREADY READY 1 1 }  { m_axi_aximm1_RDATA DATA 0 32 }  { m_axi_aximm1_RLAST LAST 0 1 }  { m_axi_aximm1_RID ID 0 1 }  { m_axi_aximm1_RUSER USER 0 1 }  { m_axi_aximm1_RRESP RESP 0 2 }  { m_axi_aximm1_BVALID VALID 0 1 }  { m_axi_aximm1_BREADY READY 1 1 }  { m_axi_aximm1_BRESP RESP 0 2 }  { m_axi_aximm1_BID ID 0 1 }  { m_axi_aximm1_BUSER USER 0 1 } } }
	aximm2 { m_axi {  { m_axi_aximm2_AWVALID VALID 1 1 }  { m_axi_aximm2_AWREADY READY 0 1 }  { m_axi_aximm2_AWADDR ADDR 1 64 }  { m_axi_aximm2_AWID ID 1 1 }  { m_axi_aximm2_AWLEN LEN 1 8 }  { m_axi_aximm2_AWSIZE SIZE 1 3 }  { m_axi_aximm2_AWBURST BURST 1 2 }  { m_axi_aximm2_AWLOCK LOCK 1 2 }  { m_axi_aximm2_AWCACHE CACHE 1 4 }  { m_axi_aximm2_AWPROT PROT 1 3 }  { m_axi_aximm2_AWQOS QOS 1 4 }  { m_axi_aximm2_AWREGION REGION 1 4 }  { m_axi_aximm2_AWUSER USER 1 1 }  { m_axi_aximm2_WVALID VALID 1 1 }  { m_axi_aximm2_WREADY READY 0 1 }  { m_axi_aximm2_WDATA DATA 1 32 }  { m_axi_aximm2_WSTRB STRB 1 4 }  { m_axi_aximm2_WLAST LAST 1 1 }  { m_axi_aximm2_WID ID 1 1 }  { m_axi_aximm2_WUSER USER 1 1 }  { m_axi_aximm2_ARVALID VALID 1 1 }  { m_axi_aximm2_ARREADY READY 0 1 }  { m_axi_aximm2_ARADDR ADDR 1 64 }  { m_axi_aximm2_ARID ID 1 1 }  { m_axi_aximm2_ARLEN LEN 1 8 }  { m_axi_aximm2_ARSIZE SIZE 1 3 }  { m_axi_aximm2_ARBURST BURST 1 2 }  { m_axi_aximm2_ARLOCK LOCK 1 2 }  { m_axi_aximm2_ARCACHE CACHE 1 4 }  { m_axi_aximm2_ARPROT PROT 1 3 }  { m_axi_aximm2_ARQOS QOS 1 4 }  { m_axi_aximm2_ARREGION REGION 1 4 }  { m_axi_aximm2_ARUSER USER 1 1 }  { m_axi_aximm2_RVALID VALID 0 1 }  { m_axi_aximm2_RREADY READY 1 1 }  { m_axi_aximm2_RDATA DATA 0 32 }  { m_axi_aximm2_RLAST LAST 0 1 }  { m_axi_aximm2_RID ID 0 1 }  { m_axi_aximm2_RUSER USER 0 1 }  { m_axi_aximm2_RRESP RESP 0 2 }  { m_axi_aximm2_BVALID VALID 0 1 }  { m_axi_aximm2_BREADY READY 1 1 }  { m_axi_aximm2_BRESP RESP 0 2 }  { m_axi_aximm2_BID ID 0 1 }  { m_axi_aximm2_BUSER USER 0 1 } } }
	aximm3 { m_axi {  { m_axi_aximm3_AWVALID VALID 1 1 }  { m_axi_aximm3_AWREADY READY 0 1 }  { m_axi_aximm3_AWADDR ADDR 1 64 }  { m_axi_aximm3_AWID ID 1 1 }  { m_axi_aximm3_AWLEN LEN 1 8 }  { m_axi_aximm3_AWSIZE SIZE 1 3 }  { m_axi_aximm3_AWBURST BURST 1 2 }  { m_axi_aximm3_AWLOCK LOCK 1 2 }  { m_axi_aximm3_AWCACHE CACHE 1 4 }  { m_axi_aximm3_AWPROT PROT 1 3 }  { m_axi_aximm3_AWQOS QOS 1 4 }  { m_axi_aximm3_AWREGION REGION 1 4 }  { m_axi_aximm3_AWUSER USER 1 1 }  { m_axi_aximm3_WVALID VALID 1 1 }  { m_axi_aximm3_WREADY READY 0 1 }  { m_axi_aximm3_WDATA DATA 1 32 }  { m_axi_aximm3_WSTRB STRB 1 4 }  { m_axi_aximm3_WLAST LAST 1 1 }  { m_axi_aximm3_WID ID 1 1 }  { m_axi_aximm3_WUSER USER 1 1 }  { m_axi_aximm3_ARVALID VALID 1 1 }  { m_axi_aximm3_ARREADY READY 0 1 }  { m_axi_aximm3_ARADDR ADDR 1 64 }  { m_axi_aximm3_ARID ID 1 1 }  { m_axi_aximm3_ARLEN LEN 1 8 }  { m_axi_aximm3_ARSIZE SIZE 1 3 }  { m_axi_aximm3_ARBURST BURST 1 2 }  { m_axi_aximm3_ARLOCK LOCK 1 2 }  { m_axi_aximm3_ARCACHE CACHE 1 4 }  { m_axi_aximm3_ARPROT PROT 1 3 }  { m_axi_aximm3_ARQOS QOS 1 4 }  { m_axi_aximm3_ARREGION REGION 1 4 }  { m_axi_aximm3_ARUSER USER 1 1 }  { m_axi_aximm3_RVALID VALID 0 1 }  { m_axi_aximm3_RREADY READY 1 1 }  { m_axi_aximm3_RDATA DATA 0 32 }  { m_axi_aximm3_RLAST LAST 0 1 }  { m_axi_aximm3_RID ID 0 1 }  { m_axi_aximm3_RUSER USER 0 1 }  { m_axi_aximm3_RRESP RESP 0 2 }  { m_axi_aximm3_BVALID VALID 0 1 }  { m_axi_aximm3_BREADY READY 1 1 }  { m_axi_aximm3_BRESP RESP 0 2 }  { m_axi_aximm3_BID ID 0 1 }  { m_axi_aximm3_BUSER USER 0 1 } } }
	aximm4 { m_axi {  { m_axi_aximm4_AWVALID VALID 1 1 }  { m_axi_aximm4_AWREADY READY 0 1 }  { m_axi_aximm4_AWADDR ADDR 1 64 }  { m_axi_aximm4_AWID ID 1 1 }  { m_axi_aximm4_AWLEN LEN 1 8 }  { m_axi_aximm4_AWSIZE SIZE 1 3 }  { m_axi_aximm4_AWBURST BURST 1 2 }  { m_axi_aximm4_AWLOCK LOCK 1 2 }  { m_axi_aximm4_AWCACHE CACHE 1 4 }  { m_axi_aximm4_AWPROT PROT 1 3 }  { m_axi_aximm4_AWQOS QOS 1 4 }  { m_axi_aximm4_AWREGION REGION 1 4 }  { m_axi_aximm4_AWUSER USER 1 1 }  { m_axi_aximm4_WVALID VALID 1 1 }  { m_axi_aximm4_WREADY READY 0 1 }  { m_axi_aximm4_WDATA DATA 1 32 }  { m_axi_aximm4_WSTRB STRB 1 4 }  { m_axi_aximm4_WLAST LAST 1 1 }  { m_axi_aximm4_WID ID 1 1 }  { m_axi_aximm4_WUSER USER 1 1 }  { m_axi_aximm4_ARVALID VALID 1 1 }  { m_axi_aximm4_ARREADY READY 0 1 }  { m_axi_aximm4_ARADDR ADDR 1 64 }  { m_axi_aximm4_ARID ID 1 1 }  { m_axi_aximm4_ARLEN LEN 1 8 }  { m_axi_aximm4_ARSIZE SIZE 1 3 }  { m_axi_aximm4_ARBURST BURST 1 2 }  { m_axi_aximm4_ARLOCK LOCK 1 2 }  { m_axi_aximm4_ARCACHE CACHE 1 4 }  { m_axi_aximm4_ARPROT PROT 1 3 }  { m_axi_aximm4_ARQOS QOS 1 4 }  { m_axi_aximm4_ARREGION REGION 1 4 }  { m_axi_aximm4_ARUSER USER 1 1 }  { m_axi_aximm4_RVALID VALID 0 1 }  { m_axi_aximm4_RREADY READY 1 1 }  { m_axi_aximm4_RDATA DATA 0 32 }  { m_axi_aximm4_RLAST LAST 0 1 }  { m_axi_aximm4_RID ID 0 1 }  { m_axi_aximm4_RUSER USER 0 1 }  { m_axi_aximm4_RRESP RESP 0 2 }  { m_axi_aximm4_BVALID VALID 0 1 }  { m_axi_aximm4_BREADY READY 1 1 }  { m_axi_aximm4_BRESP RESP 0 2 }  { m_axi_aximm4_BID ID 0 1 }  { m_axi_aximm4_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ aximm1 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ aximm2 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ aximm3 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ aximm4 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ aximm1 64 }
	{ aximm2 64 }
	{ aximm3 64 }
	{ aximm4 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ aximm1 64 }
	{ aximm2 64 }
	{ aximm3 64 }
	{ aximm4 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
