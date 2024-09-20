/*
 * Copyright 2024 CEI Politécnica Madrid
 *

 * Author: Luis Waucquez <luis.waucquez.jimenez@upm.es>
 */
  
#include <stdio.h>
#include <stdlib.h>
#include "csr.h"
#include "csr_registers.h"
#include "CB_Safety.h"
/*
#define INTERRUPT_HANDLER_ABI __attribute__((aligned(4), interrupt))

/*
#define PRIVATE_REG_BASEADDRESS 0xFF000000 
#define SAFE_REG_BASEADDRESS    0xF0020000 
/*
__attribute__((aligned(4))) void TMR_Safe_Activate(void);
__attribute__((aligned(4))) void TMR_Safe_Stop(void);
INTERRUPT_HANDLER_ABI void handler_tmr_recoverysync(void); 
INTERRUPT_HANDLER_ABI void handler_tmr_dmcontext_copy(void);
INTERRUPT_HANDLER_ABI void handler_tmr_dmshsync(void);
INTERRUPT_HANDLER_ABI void handler_safe_fsm(void);
*/
int main(int argc, char *argv[]) 
{

volatile unsigned int *P=0xF0109000;
volatile unsigned int *Safe_config_reg= SAFE_REG_BASEADDRESS;    
volatile unsigned int *END_SW = 0xF002001C;     
//        printf("Hart: %d init the program...\n",*P); 
        asm volatile("csrr t6, mstatus");
        asm volatile("ori t6,t6,0x08"); 
        asm volatile("csrw mstatus, t6");  
        // Set mie.MEIE bit to one to enable machine-level external interrupts
        asm volatile("li   t6,0xFFFF0000"); 
        asm volatile("csrw mie, t6"); //mask = 1 << 31        
        //Entering Safe mode TMR 
        TMR_Safe_Activate(); 
        TMR_Set_Critical_Section(CRITICAL_SECTION);


        CSR_READ(CSR_REG_MHARTID,P);  

        volatile unsigned int *i = 0xF0108040; 

        for(int j=0;j<10;j++)  
                *i=j;
         *i=0xdeadbeef;

        Check_RF();

        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();

        TMR_Safe_Stop(MASTER_CORE0); 

        TMR_Safe_Activate(); 
        TMR_Set_Critical_Section(CRITICAL_SECTION); 
 
 
        CSR_READ(CSR_REG_MHARTID,P);  

 
        for(int j=0;j<10;j++)   
                *i=j;  
         *i=0xdeadbeef;

        Check_RF();

        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();

        TMR_Safe_Stop(MASTER_CORE2);   
 
        TMR_Safe_Activate();  
        TMR_Set_Critical_Section(CRITICAL_SECTION);
  

        CSR_READ(CSR_REG_MHARTID,P);  


        for(int j=0;j<10;j++)  
                *i=j;
         *i=0xdeadbeef;
 
        Check_RF();

        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();

        TMR_Safe_Stop(MASTER_CORE1); 




 
//       CSR_READ(CSR_REG_MHARTID,P); 
        /******END PROGRAM******/  
        *END_SW = 0x1;
        asm volatile("fence");
        while(1){ 
        asm volatile("wfi");
        }        
        /******END PROGRAM******/
    
//        return EXIT_SUCCESS;
}