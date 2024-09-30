// Copyright 2024 CEI

#ifndef _CB_SAFETY_H_
#define _CB_SAFETY_H_

//Todo: Check if __cplusplus this is necesary
#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

#include "base_address.h"
#include "CPU_Private_regs.h"
#include "CB_heep_ctrl_regs.h"
#include "Safe_wrapper_ctrl_regs.h"

#define CHECK_RAM_ADDRESS       0xF002B000

#define FREE_LOCATION_POINTER   0xF002A000

#define CRITICAL_SECTION 	0x1
#define NONE_CRITICAL_SECTION	0x0

#define MASTER_CORE0	0x1	//0b001
#define MASTER_CORE1	0x2	//0b010
#define MASTER_CORE2	0x4	//0b100

//Functions
#define INTERRUPT_HANDLER_ABI __attribute__((aligned(4), interrupt))

__attribute__((aligned(4))) void TMR_Safe_Activate(void);
__attribute__((aligned(4))) void TMR_Safe_Stop(unsigned int master);
__attribute__((aligned(4),always_inline)) inline void TMR_Set_Critical_Section(unsigned int critical){
        volatile unsigned int *Priv_Reg = SAFE_WRAPPER_CTRL_BASEADDRESS | SAFE_WRAPPER_CTRL_CRITICAL_SECTION_REG_OFFSET;
        *Priv_Reg = critical;}
        
__attribute__((aligned(4))) void Check_RF(void);

//Handlers
INTERRUPT_HANDLER_ABI void handler_tmr_recoverysync(void);
INTERRUPT_HANDLER_ABI void handler_tmr_dmcontext_copy(void);
INTERRUPT_HANDLER_ABI void handler_tmr_dmshsync(void);
INTERRUPT_HANDLER_ABI void handler_safe_fsm(void);


#endif  
