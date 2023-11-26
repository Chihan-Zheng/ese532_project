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
// 0x10 : Data signal of ap_return
//        bit 15~0 - ap_return[15:0] (Read)
//        others   - reserved
// 0x18 : Data signal of in_r
//        bit 31~0 - in_r[31:0] (Read/Write)
// 0x1c : Data signal of in_r
//        bit 31~0 - in_r[63:32] (Read/Write)
// 0x20 : reserved
// 0x24 : Data signal of in_length
//        bit 15~0 - in_length[15:0] (Read/Write)
//        others   - reserved
// 0x28 : reserved
// 0x2c : Data signal of send_data
//        bit 31~0 - send_data[31:0] (Read/Write)
// 0x30 : Data signal of send_data
//        bit 31~0 - send_data[63:32] (Read/Write)
// 0x34 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL        0x00
#define XLZW_HYBRID_HASH_HW_CONTROL_ADDR_GIE            0x04
#define XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IER            0x08
#define XLZW_HYBRID_HASH_HW_CONTROL_ADDR_ISR            0x0c
#define XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_RETURN      0x10
#define XLZW_HYBRID_HASH_HW_CONTROL_BITS_AP_RETURN      16
#define XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IN_R_DATA      0x18
#define XLZW_HYBRID_HASH_HW_CONTROL_BITS_IN_R_DATA      64
#define XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IN_LENGTH_DATA 0x24
#define XLZW_HYBRID_HASH_HW_CONTROL_BITS_IN_LENGTH_DATA 16
#define XLZW_HYBRID_HASH_HW_CONTROL_ADDR_SEND_DATA_DATA 0x2c
#define XLZW_HYBRID_HASH_HW_CONTROL_BITS_SEND_DATA_DATA 64

