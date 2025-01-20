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

unsigned int f_cal(unsigned int *a,unsigned int *b);
int main(int argc, char *argv[]) 
{
        
        volatile unsigned int *P = FREE_LOCATION_POINTER; 
        volatile unsigned int *END_SW = SAFE_WRAPPER_CTRL_BASEADDRESS | SAFE_WRAPPER_CTRL_END_SW_ROUTINE_REG_OFFSET; 
        volatile unsigned int *i = 0xF0028040; 
        asm volatile("li   t6, %0" : : "i" (SAFE_WRAPPER_CTRL_BASEADDRESS));
        asm volatile("sw        sp, %0(t6)" :: "i" (SAFE_WRAPPER_CTRL_INITIAL_STACK_ADDR_REG_OFFSET));
        (*(P+1))=0;
        (*(P+2))=3;
        (*(P+3))=2;        
//        printf("[EROS-HEEP]: Start Single :)\n");        

        //Entering Safe DMR mode 
        TMR_Safe_Activate(DMR_MODE); 
//        TMR_Set_Critical_Section(CRITICAL_SECTION);
         *i=0xdeadbee0;
         *i=0xdeadbee1;
         *i=0xdeadbee2;
         *i=0xdeadbee3;
        Store_Checkpoint();

                (*(P+4))=f_cal((P+2),(P+3));
//        CSR_READ(CSR_REG_MHARTID,P);

         *i=0xdeadbee4;
         *i=0xdeadbee5;
         *i=0xdeadbee6;
         *i=0xdeadbee7; 

        //Reference for exit store_checkpoint 
//        asm volatile(".global _exit_Store_checkpoint");
//        asm volatile("_exit_Store_checkpoint:"); 

//        printf("[EROS-HEEP]: Execute DMR_MODE :)\n"); 
        printf("Resultado a= %d + b= %d c= %d \n",*(P+2),*(P+3),*(P+4));
         *i=0xdeadbee8;
         *i=0xdeadbee9;
         *i=0xdeadbe10;
         *i=0xdeadbe11;
        if((*(P+1))==0){
        (*(P+1))=1;
        CSR_READ(CSR_REG_MHARTID,P);
        }

        TMR_Safe_Stop(MASTER_CORE1); 
        //        printf("[EROS-HEEP]: Exit from DMR_MODE :)\n"); 
         *i=0xdeadbee4;
         *i=0xdeadbee5;
         *i=0xdeadbee6;
         *i=0xdeadbee7; 

        //Entering Safe TMR mode
        TMR_Safe_Activate(TMR_MODE); 
//        TMR_Set_Critical_Section(CRITICAL_SECTION);
         *i=0xdeadbee0;
         *i=0xdeadbee1;
         *i=0xdeadbee2;
         *i=0xdeadbee3;

        CSR_READ(CSR_REG_MHARTID,P);

         *i=0xdeadbee4;
         *i=0xdeadbee5;
         *i=0xdeadbee6;
         *i=0xdeadbee7;

//        printf("[EROS-HEEP]: Execute TMR_MODE :)\n");

         *i=0xdeadbee8;
         *i=0xdeadbee9;
         *i=0xdeadbe10;
         *i=0xdeadbe11;

        TMR_Safe_Stop(MASTER_CORE0); 

         *i=0xdeadbee4;
         *i=0xdeadbee5;
         *i=0xdeadbee6;
         *i=0xdeadbee7; 

//        printf("[EROS-HEEP]: Exit from TMR_MODE :)\n");

        //Entering Safe LOCKSTEP mode 
        TMR_Safe_Activate(LOCKSTEP_MODE); 
//        TMR_Set_Critical_Section(CRITICAL_SECTION);
         *i=0xdeadbee0;
         *i=0xdeadbee1;
         *i=0xdeadbee2;
         *i=0xdeadbee3;
        Store_Checkpoint();

         *i=0xdeadbee4;
         *i=0xdeadbee5;
         *i=0xdeadbee6;
         *i=0xdeadbee7; 
/*
        //Reference for exit store_checkpoint 
        asm volatile(".global _exit_Store_checkpoint");
        asm volatile("_exit_Store_checkpoint:"); 
*/

//       printf("[EROS-HEEP]: Execute LOCKSTEP_MODE :)\n");


//        Store_Checkpoint();
//         if((*(P+1))==0){
//        (*(P+1))=1;
//        CSR_READ(CSR_REG_MHARTID,P);
//        }
         *i=0xdeadbee4;
         *i=0xdeadbee5;
         *i=0xdeadbee6;
         *i=0xdeadbee7; 

        //Reference for exit store_checkpoint 
///        asm volatile(".global _exit_Store_checkpoint");
 //       asm volatile("_exit_Store_checkpoint:"); 

        TMR_Safe_Stop(MASTER_CORE0); 

        printf("[EROS-HEEP]: Exit from LOCKSTEP_MODE :)\n");
         
        /******END PROGRAM******/
    
        return 0;
}

unsigned int f_cal(unsigned int *a,unsigned int *b){
int i;
unsigned int c;
        for(i=0;i<10;i++){
                c += (*a) + (*b);
        }
return c;
}