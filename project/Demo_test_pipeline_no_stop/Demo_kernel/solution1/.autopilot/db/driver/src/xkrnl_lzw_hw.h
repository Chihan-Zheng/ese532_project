// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 4  - ap_continue (Read/Write/SC)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of input_r
//        bit 31~0 - input_r[31:0] (Read/Write)
// 0x14 : Data signal of input_r
//        bit 31~0 - input_r[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of input_length
//        bit 31~0 - input_length[31:0] (Read/Write)
// 0x20 : Data signal of input_length
//        bit 31~0 - input_length[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of send_data
//        bit 31~0 - send_data[31:0] (Read/Write)
// 0x2c : Data signal of send_data
//        bit 31~0 - send_data[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of output_length
//        bit 31~0 - output_length[31:0] (Read/Write)
// 0x38 : Data signal of output_length
//        bit 31~0 - output_length[63:32] (Read/Write)
// 0x3c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XKRNL_LZW_CONTROL_ADDR_AP_CTRL            0x00
#define XKRNL_LZW_CONTROL_ADDR_GIE                0x04
#define XKRNL_LZW_CONTROL_ADDR_IER                0x08
#define XKRNL_LZW_CONTROL_ADDR_ISR                0x0c
#define XKRNL_LZW_CONTROL_ADDR_INPUT_R_DATA       0x10
#define XKRNL_LZW_CONTROL_BITS_INPUT_R_DATA       64
#define XKRNL_LZW_CONTROL_ADDR_INPUT_LENGTH_DATA  0x1c
#define XKRNL_LZW_CONTROL_BITS_INPUT_LENGTH_DATA  64
#define XKRNL_LZW_CONTROL_ADDR_SEND_DATA_DATA     0x28
#define XKRNL_LZW_CONTROL_BITS_SEND_DATA_DATA     64
#define XKRNL_LZW_CONTROL_ADDR_OUTPUT_LENGTH_DATA 0x34
#define XKRNL_LZW_CONTROL_BITS_OUTPUT_LENGTH_DATA 64

