// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xkrnl_lzw.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XKrnl_lzw_CfgInitialize(XKrnl_lzw *InstancePtr, XKrnl_lzw_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XKrnl_lzw_Start(XKrnl_lzw *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XKrnl_lzw_IsDone(XKrnl_lzw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XKrnl_lzw_IsIdle(XKrnl_lzw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XKrnl_lzw_IsReady(XKrnl_lzw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XKrnl_lzw_Continue(XKrnl_lzw *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XKrnl_lzw_EnableAutoRestart(XKrnl_lzw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XKrnl_lzw_DisableAutoRestart(XKrnl_lzw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_AP_CTRL, 0);
}

void XKrnl_lzw_Set_input_r(XKrnl_lzw *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_INPUT_R_DATA, (u32)(Data));
    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_INPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_lzw_Get_input_r(XKrnl_lzw *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_INPUT_R_DATA);
    Data += (u64)XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_INPUT_R_DATA + 4) << 32;
    return Data;
}

void XKrnl_lzw_Set_input_length(XKrnl_lzw *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_INPUT_LENGTH_DATA, (u32)(Data));
    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_INPUT_LENGTH_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_lzw_Get_input_length(XKrnl_lzw *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_INPUT_LENGTH_DATA);
    Data += (u64)XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_INPUT_LENGTH_DATA + 4) << 32;
    return Data;
}

void XKrnl_lzw_Set_send_data(XKrnl_lzw *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_SEND_DATA_DATA, (u32)(Data));
    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_SEND_DATA_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_lzw_Get_send_data(XKrnl_lzw *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_SEND_DATA_DATA);
    Data += (u64)XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_SEND_DATA_DATA + 4) << 32;
    return Data;
}

void XKrnl_lzw_Set_output_length(XKrnl_lzw *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_OUTPUT_LENGTH_DATA, (u32)(Data));
    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_OUTPUT_LENGTH_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_lzw_Get_output_length(XKrnl_lzw *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_OUTPUT_LENGTH_DATA);
    Data += (u64)XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_OUTPUT_LENGTH_DATA + 4) << 32;
    return Data;
}

void XKrnl_lzw_InterruptGlobalEnable(XKrnl_lzw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_GIE, 1);
}

void XKrnl_lzw_InterruptGlobalDisable(XKrnl_lzw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_GIE, 0);
}

void XKrnl_lzw_InterruptEnable(XKrnl_lzw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_IER);
    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_IER, Register | Mask);
}

void XKrnl_lzw_InterruptDisable(XKrnl_lzw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_IER);
    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_IER, Register & (~Mask));
}

void XKrnl_lzw_InterruptClear(XKrnl_lzw *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_lzw_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_ISR, Mask);
}

u32 XKrnl_lzw_InterruptGetEnabled(XKrnl_lzw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_IER);
}

u32 XKrnl_lzw_InterruptGetStatus(XKrnl_lzw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_lzw_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_LZW_CONTROL_ADDR_ISR);
}

