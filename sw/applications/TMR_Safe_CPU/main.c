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


int main(int argc, char *argv[]) 
{
        volatile unsigned int *P = FREE_LOCATION_POINTER;
        volatile unsigned int *END_SW = SAFE_WRAPPER_CTRL_END_SW_ROUTINE_OFFSET;   
        //Entering Safe mode TMR 
        TMR_Safe_Activate(); 
//        TMR_Set_Critical_Section(CRITICAL_SECTION);


        CSR_READ(CSR_REG_MHARTID,P);  

        volatile unsigned int *i = 0xF0028040; 

        for(int j=0;j<10;j++)  
                *i=j;
         *i=0xdeadbeef;

      //  Check_RF();

//        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();

        TMR_Safe_Stop(MASTER_CORE0); 
/*
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

*/


 
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