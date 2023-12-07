// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xkrnl_lzw.h"

extern XKrnl_lzw_Config XKrnl_lzw_ConfigTable[];

XKrnl_lzw_Config *XKrnl_lzw_LookupConfig(u16 DeviceId) {
	XKrnl_lzw_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XKRNL_LZW_NUM_INSTANCES; Index++) {
		if (XKrnl_lzw_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XKrnl_lzw_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XKrnl_lzw_Initialize(XKrnl_lzw *InstancePtr, u16 DeviceId) {
	XKrnl_lzw_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XKrnl_lzw_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XKrnl_lzw_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

