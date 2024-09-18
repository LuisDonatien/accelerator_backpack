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

//Define
#define PRIVATE_REG_BASEADDRESS 0xFF000000 

#define CPU_PRIVATE_CORE_ID_OFFSET 0x0
#define CPU_PRIVATE_HART_INTC_ACK_OFFSET 0x4


#define SAFE_REG_BASEADDRESS    0xF0020000

#define SAFE_WRAPPER_CTRL_SAFE_CONFIGURATION_OFFSET     0x0
#define SAFE_WRAPPER_CTRL_SAFE_MODE_OFFSET              0x4
#define SAFE_WRAPPER_CTRL_MASTER_CORE_OFFSET            0x8
#define SAFE_WRAPPER_CTRL_CRITICAL_SECTION_OFFSET       0xC
#define SAFE_WRAPPER_CTRL_EXTERNAL_DEBUG_REQ_OFFSET     0x10
#define SAFE_WRAPPER_CTRL_INITIAL_SYNC_MASTER_OFFSET    0x14
#define SAFE_WRAPPER_CTRL_START_OFFSET                  0x18
#define SAFE_WRAPPER_CTRL_END_SW_ROUTINE_OFFSET         0x1C
#define SAFE_WRAPPER_CTRL_ENTRY_ADDRESS_OFFSET          0x20

#define CHECK_RAM_ADDRESS       0xF0109000

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
        volatile unsigned int *Priv_Reg = SAFE_REG_BASEADDRESS | 0xC;
        *Priv_Reg = critical;}
        
__attribute__((aligned(4))) void Check_RF(void);

//Handlers
INTERRUPT_HANDLER_ABI void handler_tmr_recoverysync(void);
INTERRUPT_HANDLER_ABI void handler_tmr_dmcontext_copy(void);
INTERRUPT_HANDLER_ABI void handler_tmr_dmshsync(void);
INTERRUPT_HANDLER_ABI void handler_safe_fsm(void);


#endif  
