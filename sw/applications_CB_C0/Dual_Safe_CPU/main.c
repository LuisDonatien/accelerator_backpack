/*
 * Copyright 2024 CEI Politécnica Madrid
 *

 * Author: Luis Waucquez <luis.waucquez.jimenez@upm.es>
 */
  
#include <stdio.h>
#include <stdlib.h>
#include "csr.h"
#include "csr_registers.h"

#define PRIVATE_REG_BASEADDRESS 0xFF000000 

int main(int argc, char *argv[])
{

volatile unsigned int *P=0xF0109000;
volatile unsigned int *Safe_config_reg= 0xF0020000;
volatile unsigned int *Priv_Reg = PRIVATE_REG_BASEADDRESS;

//Starting Configuration
*Safe_config_reg = 0x1;
*(Safe_config_reg+1) = 0x1;

   CSR_READ(CSR_REG_MHARTID,P);
   
   printf("Hart: %d init the program...\n",*P); 
   
   *Priv_Reg =0x0;

   //Activate Interrupt
    // Enable interrupt on processor side
    // Enable global interrupt for machine-level interrupts
//    CSR_SET_BITS(CSR_REG_MSTATUS, 0x8);
    // Set mie.MEIE bit to one to enable machine-level external interrupts
//    const uint32_t mask = 1 << 11;
//    CSR_SET_BITS(CSR_REG_MIE, mask);        
        asm volatile("li   t6,0x8");
        asm volatile("csrw mstatus, t6"); 
        asm volatile("li   t6,0x40000000"); 
        asm volatile("csrw mie, t6"); //mask = 1 << 31

 
    //Control & Status Register
    //Set Base Address
        asm volatile("li   t5,0xF0108000");
    //Machine Status
    //mstatus   0x300
        asm volatile("csrr t6, mstatus");
        asm volatile("sw    t6,0(t5)");

    //Machine Interrupt Enable
    //mie       0x304
        asm volatile("csrr t6, mie");
        asm volatile("sw    t6,4(t5)");

    //Machine Trap-Vector
    //mtvec     0x305
        asm volatile("csrr t6, mtvec");
        asm volatile("sw    t6,8(t5)");

    //Machine Exception Program Counter
    //mepc      0x341
        asm volatile("csrr t6, mepc");
        asm volatile("sw    t6,12(t5)"); 

    //Machine Trap Value Register
    //mtval     0x343
        asm volatile("csrr t6, mtval");
        asm volatile("sw    t6,16(t5)");


    //Register File
        //x1    ra
        asm volatile("li t6, 0xF0108100");
        asm volatile("sw ra, 0(t6)");

        //x2    sp
//        asm volatile("li t6, 0xC804");
        asm volatile("sw sp, 4(t6)");

        //x3    gp
//        asm volatile("li t6, 0xC808");
        asm volatile("sw gp, 8(t6)"); 

        //x4    tp
//        asm volatile("li t6, 0xC80C");
        asm volatile("sw tp, 12(t6)");

        //x5    t0
//        asm volatile("li t6, 0xC810");
        asm volatile("sw t0, 16(t6)");   

        //x6    t1
//        asm volatile("li t6, 0xC814");
        asm volatile("sw t1, 20(t6)");       

        //x7    t2
//        asm volatile("li t6, 0xC818");
        asm volatile("sw t2, 24(t6)");

        //x8   s0/fp
//        asm volatile("li t6, 0xC81C");
        asm volatile("sw s0, 28(t6)");

        //x9    s1
//        asm volatile("li t6, 0xC820");
        asm volatile("sw s1, 32(t6)");

        //x10   a0 
//        asm volatile("li t6, 0xC824");
        asm volatile("sw a0, 36(t6)");

        //x11   a1 
//        asm volatile("li t6, 0xC828");
        asm volatile("sw a1, 40(t6)");

        //x12   a2 
//        asm volatile("li t6, 0xC82C");
        asm volatile("sw a2, 44(t6)");

        //x13   a3 
//        asm volatile("li t6, 0xC830");
        asm volatile("sw a3, 48(t6)");

        //x14   a4 
//        asm volatile("li t6, 0xC834");
        asm volatile("sw a4, 52(t6)");

        //x15   a5 
//        asm volatile("li t6, 0xC838");
        asm volatile("sw a5, 56(t6)");

        //x16   a6 
//        asm volatile("li t6, 0xC83C");
        asm volatile("sw a6, 60(t6)");

        //x17   a7 
//        asm volatile("li t6, 0xC840");
        asm volatile("sw a7, 64(t6)");

        //x18   s2 
//        asm volatile("li t6, 0xC844");
        asm volatile("sw s2, 68(t6)");

        //x19   s3 
//        asm volatile("li t6, 0xC848");
        asm volatile("sw s3, 72(t6)");

        //x20   s4 
//        asm volatile("li t6, 0xC84C");
        asm volatile("sw s4, 76(t6)");

        //x21   s5 
//        asm volatile("li t6, 0xC850");
        asm volatile("sw s5, 80(t6)");

        //x22   s6 
//        asm volatile("li t6, 0xC854");
        asm volatile("sw s6, 84(t6)");

        //x23   s7 
//        asm volatile("li t6, 0xC858");
        asm volatile("sw s7, 88(t6)");

        //x24   s8 
//        asm volatile("li t6, 0xC85C");
        asm volatile("sw s8, 92(t6)");

        //x25   s9 
//        asm volatile("li t6, 0xC860");
        asm volatile("sw s9, 96(t6)");

        //x26   s10 
//        asm volatile("li t6, 0xC864");
        asm volatile("sw s10, 100(t6)");

        //x27   s11 
//        asm volatile("li t6, 0xC868");
        asm volatile("sw s11, 104(t6)");

        //x28   t3 
//        asm volatile("li t6, 0xC86C");
        asm volatile("sw t3, 108(t6)");

        //x29   t4 
//        asm volatile("li t6, 0xC870");
        asm volatile("sw t4, 112(t6)"); 

        //x30   t5  
//        asm volatile("li t6, 0xC874");
        asm volatile("sw t5, 116(t6)"); 

        //x31   t6 
//        asm volatile("li t6, 0xC878");
        asm volatile("sw t6, 120(t6)");

        //Master Sync Priv Reg
        *(Priv_Reg+1) = 0x1;
        //PC Program Counter
        asm volatile("auipc t5, 0");
        asm volatile("sw t5, 124(t6)");

        asm volatile ("fence"); 
        asm volatile("wfi");  

        *(Priv_Reg+2) = 0x0;
        //end safe mode
        *(Safe_config_reg+1) = 0x0;
        *(Safe_config_reg+2) = 0x4;
        asm volatile("wfi");


volatile unsigned int *P1=0xF0109000;
        CSR_READ(CSR_REG_MHARTID,P1);

   printf("Hart: %d finish the program...\n",*P1); 
    
   return EXIT_SUCCESS;
}

