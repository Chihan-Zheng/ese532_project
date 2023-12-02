// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XKRNL_LZW_H
#define XKRNL_LZW_H

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
#include "xkrnl_lzw_hw.h"

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
} XKrnl_lzw_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XKrnl_lzw;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XKrnl_lzw_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XKrnl_lzw_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XKrnl_lzw_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XKrnl_lzw_ReadReg(BaseAddress, RegOffset) \
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
int XKrnl_lzw_Initialize(XKrnl_lzw *InstancePtr, u16 DeviceId);
XKrnl_lzw_Config* XKrnl_lzw_LookupConfig(u16 DeviceId);
int XKrnl_lzw_CfgInitialize(XKrnl_lzw *InstancePtr, XKrnl_lzw_Config *ConfigPtr);
#else
int XKrnl_lzw_Initialize(XKrnl_lzw *InstancePtr, const char* InstanceName);
int XKrnl_lzw_Release(XKrnl_lzw *InstancePtr);
#endif

void XKrnl_lzw_Start(XKrnl_lzw *InstancePtr);
u32 XKrnl_lzw_IsDone(XKrnl_lzw *InstancePtr);
u32 XKrnl_lzw_IsIdle(XKrnl_lzw *InstancePtr);
u32 XKrnl_lzw_IsReady(XKrnl_lzw *InstancePtr);
void XKrnl_lzw_Continue(XKrnl_lzw *InstancePtr);
void XKrnl_lzw_EnableAutoRestart(XKrnl_lzw *InstancePtr);
void XKrnl_lzw_DisableAutoRestart(XKrnl_lzw *InstancePtr);

void XKrnl_lzw_Set_in_r(XKrnl_lzw *InstancePtr, u64 Data);
u64 XKrnl_lzw_Get_in_r(XKrnl_lzw *InstancePtr);
void XKrnl_lzw_Set_input_length(XKrnl_lzw *InstancePtr, u64 Data);
u64 XKrnl_lzw_Get_input_length(XKrnl_lzw *InstancePtr);
void XKrnl_lzw_Set_send_data(XKrnl_lzw *InstancePtr, u64 Data);
u64 XKrnl_lzw_Get_send_data(XKrnl_lzw *InstancePtr);
void XKrnl_lzw_Set_output_length(XKrnl_lzw *InstancePtr, u64 Data);
u64 XKrnl_lzw_Get_output_length(XKrnl_lzw *InstancePtr);

void XKrnl_lzw_InterruptGlobalEnable(XKrnl_lzw *InstancePtr);
void XKrnl_lzw_InterruptGlobalDisable(XKrnl_lzw *InstancePtr);
void XKrnl_lzw_InterruptEnable(XKrnl_lzw *InstancePtr, u32 Mask);
void XKrnl_lzw_InterruptDisable(XKrnl_lzw *InstancePtr, u32 Mask);
void XKrnl_lzw_InterruptClear(XKrnl_lzw *InstancePtr, u32 Mask);
u32 XKrnl_lzw_InterruptGetEnabled(XKrnl_lzw *InstancePtr);
u32 XKrnl_lzw_InterruptGetStatus(XKrnl_lzw *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
