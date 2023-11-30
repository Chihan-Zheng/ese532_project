// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XLZW_HYBRID_HASH_HW_H
#define XLZW_HYBRID_HASH_HW_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xlzw_hybrid_hash_hw_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XLzw_hybrid_hash_hw_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XLzw_hybrid_hash_hw;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XLzw_hybrid_hash_hw_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XLzw_hybrid_hash_hw_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XLzw_hybrid_hash_hw_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XLzw_hybrid_hash_hw_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XLzw_hybrid_hash_hw_Initialize(XLzw_hybrid_hash_hw *InstancePtr, u16 DeviceId);
XLzw_hybrid_hash_hw_Config* XLzw_hybrid_hash_hw_LookupConfig(u16 DeviceId);
int XLzw_hybrid_hash_hw_CfgInitialize(XLzw_hybrid_hash_hw *InstancePtr, XLzw_hybrid_hash_hw_Config *ConfigPtr);
#else
int XLzw_hybrid_hash_hw_Initialize(XLzw_hybrid_hash_hw *InstancePtr, const char* InstanceName);
int XLzw_hybrid_hash_hw_Release(XLzw_hybrid_hash_hw *InstancePtr);
#endif

void XLzw_hybrid_hash_hw_Start(XLzw_hybrid_hash_hw *InstancePtr);
u32 XLzw_hybrid_hash_hw_IsDone(XLzw_hybrid_hash_hw *InstancePtr);
u32 XLzw_hybrid_hash_hw_IsIdle(XLzw_hybrid_hash_hw *InstancePtr);
u32 XLzw_hybrid_hash_hw_IsReady(XLzw_hybrid_hash_hw *InstancePtr);
void XLzw_hybrid_hash_hw_Continue(XLzw_hybrid_hash_hw *InstancePtr);
void XLzw_hybrid_hash_hw_EnableAutoRestart(XLzw_hybrid_hash_hw *InstancePtr);
void XLzw_hybrid_hash_hw_DisableAutoRestart(XLzw_hybrid_hash_hw *InstancePtr);

void XLzw_hybrid_hash_hw_Set_in_r(XLzw_hybrid_hash_hw *InstancePtr, u64 Data);
u64 XLzw_hybrid_hash_hw_Get_in_r(XLzw_hybrid_hash_hw *InstancePtr);
void XLzw_hybrid_hash_hw_Set_input_length(XLzw_hybrid_hash_hw *InstancePtr, u64 Data);
u64 XLzw_hybrid_hash_hw_Get_input_length(XLzw_hybrid_hash_hw *InstancePtr);
void XLzw_hybrid_hash_hw_Set_send_data(XLzw_hybrid_hash_hw *InstancePtr, u64 Data);
u64 XLzw_hybrid_hash_hw_Get_send_data(XLzw_hybrid_hash_hw *InstancePtr);
void XLzw_hybrid_hash_hw_Set_output_length(XLzw_hybrid_hash_hw *InstancePtr, u64 Data);
u64 XLzw_hybrid_hash_hw_Get_output_length(XLzw_hybrid_hash_hw *InstancePtr);

void XLzw_hybrid_hash_hw_InterruptGlobalEnable(XLzw_hybrid_hash_hw *InstancePtr);
void XLzw_hybrid_hash_hw_InterruptGlobalDisable(XLzw_hybrid_hash_hw *InstancePtr);
void XLzw_hybrid_hash_hw_InterruptEnable(XLzw_hybrid_hash_hw *InstancePtr, u32 Mask);
void XLzw_hybrid_hash_hw_InterruptDisable(XLzw_hybrid_hash_hw *InstancePtr, u32 Mask);
void XLzw_hybrid_hash_hw_InterruptClear(XLzw_hybrid_hash_hw *InstancePtr, u32 Mask);
u32 XLzw_hybrid_hash_hw_InterruptGetEnabled(XLzw_hybrid_hash_hw *InstancePtr);
u32 XLzw_hybrid_hash_hw_InterruptGetStatus(XLzw_hybrid_hash_hw *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif