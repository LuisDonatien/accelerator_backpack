// Copyright 2024 CEI

#include "CB_Safety.h"


//Todo Check influence of t0-t6 in simple function
void TMR_Safe_Activate(void){
volatile unsigned int *P=0xF0109000;
volatile unsigned int *Safe_config_reg= SAFE_REG_BASEADDRESS;
volatile unsigned int *Priv_Reg = PRIVATE_REG_BASEADDRESS;

     //Starting Configuration
     if (*Safe_config_reg==0x0){
        *Safe_config_reg = 0x1;
        *(Safe_config_reg+1) = 0x1;

        //Activate Interrupt 
        // Enable interrupt on processor side
        // Enable global interrupt for machine-level interrupts
        asm volatile("csrr t6, mstatus");
        asm volatile("ori t6,t6,0x08");
        asm volatile("csrw mstatus, t6"); 
        // Set mie.MEIE bit to one to enable machine-level external interrupts
        asm volatile("li   t6,0xFFFF0000"); 
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
        *(Safe_config_reg+5) = 0x1;
        asm volatile(".ALIGN(2)");
        //PC Program Counter
        asm volatile("auipc t5, 0");
        asm volatile("sw t5, 124(t6)");


        asm volatile("fence");
        asm volatile("wfi"); 

        //Reset Values
        *(Safe_config_reg+5) = 0x0;
        *(Priv_Reg+1) = 0x0;
        }
}


void TMR_Safe_Stop(unsigned int master){
volatile unsigned int *Safe_config_reg= SAFE_REG_BASEADDRESS;
        if(*Safe_config_reg == 0x1){
                if (*(Safe_config_reg+3) ==0x1)
                        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
                *(Safe_config_reg+2) = master;
                *(Safe_config_reg+1) = 0x0;
                *(Safe_config_reg) = 0x0;
                asm volatile("fence");
                asm volatile("wfi");
        }
}

void handler_tmr_recoverysync(void){ 

        asm volatile("addi    sp,sp,-16");
        asm volatile("sw      a4,12(sp)");
        asm volatile("sw      a5,8(sp)");
        
        asm volatile ("li a4,1");          //Operate with address INTC ACK
        asm volatile ("li a5, %0" : : "i" (PRIVATE_REG_BASEADDRESS));
        asm volatile ("sw  a4,4(a5)");

        asm volatile("lw      a4,12(sp)");
        asm volatile("lw      a5,8(sp)");
  
        //Push Stack//
    //Register File
        //x1    ra
        asm volatile("sw ra, -4(sp)");
        //x2    sp
        asm volatile("sw sp, -8(sp)");
        //x3    gp
        asm volatile("sw gp, -12(sp)"); 
        //x4    tp
        asm volatile("sw tp, -16(sp)");
        //x5    t0
        asm volatile("sw t0, -20(sp)");   
        //x6    t1
        asm volatile("sw t1, -24(sp)");       
        //x7    t2
        asm volatile("sw t2, -28(sp)");
        //x8   s0/fp
        asm volatile("sw s0, -32(sp)");
        //x9    s1
        asm volatile("sw s1, -36(sp)");
        //x10   a0 
        asm volatile("sw a0, -40(sp)");
        //x11   a1 
        asm volatile("sw a1, -44(sp)");
        //x12   a2 
        asm volatile("sw a2, -48(sp)");
        //x13   a3 
        asm volatile("sw a3, -52(sp)");
        //x14   a4 
        asm volatile("sw a4, -56(sp)");
        //x15   a5 
        asm volatile("sw a5, -60(sp)");
        //x16   a6 
        asm volatile("sw a6, -64(sp)");
        //x17   a7 
        asm volatile("sw a7, -68(sp)");
        //x18   s2 
        asm volatile("sw s2, -72(sp)");
        //x19   s3 
        asm volatile("sw s3, -76(sp)");
        //x20   s4 
        asm volatile("sw s4, -80(sp)");
        //x21   s5 
        asm volatile("sw s5, -84(sp)");
        //x22   s6 
        asm volatile("sw s6, -88(sp)");
        //x23   s7 
        asm volatile("sw s7, -92(sp)");
        //x24   s8 
        asm volatile("sw s8, -96(sp)");
        //x25   s9 
        asm volatile("sw s9, -100(sp)");
        //x26   s10 
        asm volatile("sw s10, -104(sp)");
        //x27   s11 
        asm volatile("sw s11, -108(sp)");
        //x28   t3 
        asm volatile("sw t3, -112(sp)");
        //x29   t4 
        asm volatile("sw t4, -116(sp)"); 
        //x30   t5  
        asm volatile("sw t5, -120(sp)"); 
        //x31   t6 
        asm volatile("sw t6, -124(sp)");  

    //Control & Status Register
        //mstatus   0x300
        asm volatile("csrr t6, mstatus");
        asm volatile("sw    t6,-128(sp)");
        //Machine Interrupt Enable
        //mie       0x304
        asm volatile("csrr t6, mie");
        asm volatile("sw    t6,-132(sp)"); 
        //mtvec     0x305
        asm volatile("csrr t6, mtvec");
        asm volatile("sw    t6,-136(sp)");
        //mepc      0x341
        asm volatile("csrr t6, mepc");
        asm volatile("sw    t6,-140(sp)"); 
        //mtval     0x343
        asm volatile("csrr t6, mtval");
        asm volatile("sw    t6,-144(sp)");


        //Pop Stack//
    //Control & Status Register
        //mstatus   0x300
        asm volatile("lw    t6,-128(sp)");
        asm volatile("csrw mstatus, t6");
        //Machine Interrupt Enable
        //mie       0x304
        asm volatile("lw    t6,-132(sp)"); 
        asm volatile("csrw mie, t6");
        //mtvec     0x305
        asm volatile("lw    t6,-136(sp)");
        asm volatile("csrw mtvec, t6");
        //mepc      0x341
        asm volatile("lw    t6,-140(sp)");
        asm volatile("csrw mepc, t6"); 
        //mtval     0x343
        asm volatile("lw    t6,-144(sp)");
        asm volatile("csrw mtval, t6");  


    //Register File
        //x1    ra
        asm volatile("lw ra, -4(sp)");
        //x2    sp
        asm volatile("lw sp, -8(sp)");
        //x3    gp
        asm volatile("lw gp, -12(sp)"); 
        //x4    tp
        asm volatile("lw tp, -16(sp)");
        //x5    t0
        asm volatile("lw t0, -20(sp)");   
        //x6    t1
        asm volatile("lw t1, -24(sp)");       
        //x7    t2
        asm volatile("lw t2, -28(sp)");
        //x8   s0/fp
        asm volatile("lw s0, -32(sp)");
        //x9    s1
        asm volatile("lw s1, -36(sp)");
        //x10   a0 
        asm volatile("lw a0, -40(sp)");
        //x11   a1 
        asm volatile("lw a1, -44(sp)");
        //x12   a2 
        asm volatile("lw a2, -48(sp)");
        //x13   a3 
        asm volatile("lw a3, -52(sp)");
        //x14   a4 
        asm volatile("lw a4, -56(sp)");
        //x15   a5 
        asm volatile("lw a5, -60(sp)");
        //x16   a6 
        asm volatile("lw a6, -64(sp)");
        //x17   a7 
        asm volatile("lw a7, -68(sp)");
        //x18   s2 
        asm volatile("lw s2, -72(sp)");
        //x19   s3 
        asm volatile("lw s3, -76(sp)");
        //x20   s4 
        asm volatile("lw s4, -80(sp)");
        //x21   s5 
        asm volatile("lw s5, -84(sp)");
        //x22   s6 
        asm volatile("lw s6, -88(sp)");
        //x23   s7 
        asm volatile("lw s7, -92(sp)");
        //x24   s8 
        asm volatile("lw s8, -96(sp)");
        //x25   s9 
        asm volatile("lw s9, -100(sp)");
        //x26   s10 
        asm volatile("lw s10, -104(sp)");
        //x27   s11 
        asm volatile("lw s11, -108(sp)");
        //x28   t3 
        asm volatile("lw t3, -112(sp)");
        //x29   t4 
        asm volatile("lw t4, -116(sp)"); 
        //x30   t5  
        asm volatile("lw t5, -120(sp)"); 
        //x31   t6 
        asm volatile("lw t6, -124(sp)");  

        asm volatile ("li a5, %0" : : "i" (PRIVATE_REG_BASEADDRESS));
        asm volatile("sw  zero,4(a5)"); 
        asm volatile("lw  a5,8(sp)");
        asm volatile("addi sp,sp,16");
}

void handler_safe_fsm(void) { 

  volatile unsigned int *Priv_Reg = PRIVATE_REG_BASEADDRESS;
  *(Priv_Reg+1) = 0x1;
  *(Priv_Reg+1) = 0x0;
}

void handler_tmr_dmcontext_copy(void){
/*  volatile unsigned int *Priv_Reg = 0xFF000004;
  *Priv_Reg = 0x1;
  *Priv_Reg = 0x0;
*/
        asm volatile ("addi sp,sp,-16");     //Store in stack a4, a5
        asm volatile ("sw   a4,12(sp)");
        asm volatile ("sw   a5,8(sp)");
        
        asm volatile ("li a4,1");          //Operate with address
        asm volatile ("li a5, %0" : : "i" (PRIVATE_REG_BASEADDRESS));
        asm volatile ("sw  a4,4(a5)");
        asm volatile ("sw  zero,4(a5)");
                                                //Restore values 
        asm volatile ("lw  a4,12(sp)");
        asm volatile ("lw  a5,8(sp)");

    //Control & Status Register
    //Set Base Address
        asm volatile("li   t5,0xF0108000");
    //Machine Status
    //mstatus   0x300
 //       asm volatile("csrr t6, mstatus");
 //       asm volatile("sw    t6,0(t5)");

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

        asm volatile("li t6, 0xF0010000");     //PC -> wfi Debug_Boot_ROM
        asm volatile("csrw  mepc, t6");
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
        asm volatile("addi    t5,sp,16");
        asm volatile("sw      t5,12(t6)");      //Restore de sp before the function

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

        //PC -> 0xDebug_BootAddress + 0x200
        asm volatile("li t5, 0xF0010000"); 
        asm volatile("sw t5, 124(t6)");
        //x30   t5  
//        asm volatile("li t6, 0xC874");
        asm volatile("sw t5, 116(t6)"); 

        //x31   t6 
//        asm volatile("li t6, 0xC878");
        asm volatile("sw t6, 120(t6)");

        asm volatile("addi      sp,sp,16"); //Restore stack pointer

}
void handler_tmr_dmshsync(void){
  volatile unsigned int *Priv_Reg = 0xFF000004;
  *Priv_Reg = 0x1;
  *Priv_Reg = 0x0;

    //Control & Status Register
    //Set Base Address
        asm volatile("li   t5,0xF0108000");

    //Machine Exception Program Counter
    //mepc      0x341
        asm volatile("sw t5, -4(sp)");
        asm volatile("lw t5, 12(t5)");
        asm volatile("csrw mepc, t5"); 
        asm volatile("lw t5, -4(sp)");

}

void Check_RF(void){
        asm volatile ("addi sp,sp,-20");     //Store in stack a4, a5
        asm volatile ("sw   t4,16(sp)");
        asm volatile ("sw   t5,12(sp)");
        asm volatile ("sw   t6,8(sp)");
                                                //Restore values 
        asm volatile ("lw  a4,12(sp)");
        asm volatile ("lw  a5,8(sp)");


        asm volatile("li t6, %0" : : "i" (CHECK_RAM_ADDRESS));


    //Register File
        //x1    ra
        asm volatile("sw ra, 0(t6)");

        //x2    sp
//        asm volatile("li t6, 0xC804");
        asm volatile("addi    t5,sp,20");
        asm volatile("sw      t5,12(t6)");      //Restore de sp before the function

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
        asm volatile ("lw  t5,12(sp)"); //Restore t5
        asm volatile("sw t5, 116(t6)"); 

        //x31   t6 
//        asm volatile("li t6, 0xC878");
        asm volatile ("lw   t6,8(sp)"); //Restore t6
        asm volatile("li t5, %0" : : "i" (CHECK_RAM_ADDRESS));     //Set address in t5   
        asm volatile("sw t6, 120(t5)");

        asm volatile ("lw   t5,12(sp)"); //Restore t5
        asm volatile("addi      sp,sp,20"); //Restore stack pointer
}