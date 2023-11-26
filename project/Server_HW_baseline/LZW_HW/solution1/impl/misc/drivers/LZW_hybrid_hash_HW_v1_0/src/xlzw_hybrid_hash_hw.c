// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xlzw_hybrid_hash_hw.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XLzw_hybrid_hash_hw_CfgInitialize(XLzw_hybrid_hash_hw *InstancePtr, XLzw_hybrid_hash_hw_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XLzw_hybrid_hash_hw_Start(XLzw_hybrid_hash_hw *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL) & 0x80;
    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XLzw_hybrid_hash_hw_IsDone(XLzw_hybrid_hash_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XLzw_hybrid_hash_hw_IsIdle(XLzw_hybrid_hash_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XLzw_hybrid_hash_hw_IsReady(XLzw_hybrid_hash_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XLzw_hybrid_hash_hw_Continue(XLzw_hybrid_hash_hw *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL) & 0x80;
    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XLzw_hybrid_hash_hw_EnableAutoRestart(XLzw_hybrid_hash_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XLzw_hybrid_hash_hw_DisableAutoRestart(XLzw_hybrid_hash_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XLzw_hybrid_hash_hw_Get_return(XLzw_hybrid_hash_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_AP_RETURN);
    return Data;
}
void XLzw_hybrid_hash_hw_Set_in_r(XLzw_hybrid_hash_hw *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IN_R_DATA, (u32)(Data));
    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IN_R_DATA + 4, (u32)(Data >> 32));
}

u64 XLzw_hybrid_hash_hw_Get_in_r(XLzw_hybrid_hash_hw *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IN_R_DATA);
    Data += (u64)XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IN_R_DATA + 4) << 32;
    return Data;
}

void XLzw_hybrid_hash_hw_Set_in_length(XLzw_hybrid_hash_hw *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IN_LENGTH_DATA, Data);
}

u32 XLzw_hybrid_hash_hw_Get_in_length(XLzw_hybrid_hash_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IN_LENGTH_DATA);
    return Data;
}

void XLzw_hybrid_hash_hw_Set_send_data(XLzw_hybrid_hash_hw *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_SEND_DATA_DATA, (u32)(Data));
    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_SEND_DATA_DATA + 4, (u32)(Data >> 32));
}

u64 XLzw_hybrid_hash_hw_Get_send_data(XLzw_hybrid_hash_hw *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_SEND_DATA_DATA);
    Data += (u64)XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_SEND_DATA_DATA + 4) << 32;
    return Data;
}

void XLzw_hybrid_hash_hw_InterruptGlobalEnable(XLzw_hybrid_hash_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_GIE, 1);
}

void XLzw_hybrid_hash_hw_InterruptGlobalDisable(XLzw_hybrid_hash_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_GIE, 0);
}

void XLzw_hybrid_hash_hw_InterruptEnable(XLzw_hybrid_hash_hw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IER);
    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IER, Register | Mask);
}

void XLzw_hybrid_hash_hw_InterruptDisable(XLzw_hybrid_hash_hw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IER);
    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IER, Register & (~Mask));
}

void XLzw_hybrid_hash_hw_InterruptClear(XLzw_hybrid_hash_hw *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLzw_hybrid_hash_hw_WriteReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_ISR, Mask);
}

u32 XLzw_hybrid_hash_hw_InterruptGetEnabled(XLzw_hybrid_hash_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_IER);
}

u32 XLzw_hybrid_hash_hw_InterruptGetStatus(XLzw_hybrid_hash_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLzw_hybrid_hash_hw_ReadReg(InstancePtr->Control_BaseAddress, XLZW_HYBRID_HASH_HW_CONTROL_ADDR_ISR);
}

