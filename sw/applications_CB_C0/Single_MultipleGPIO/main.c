/*
 * Copyright 2020 ETH Zurich
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Author: Robert Balas <balasr@iis.ee.ethz.ch>
 */

#include <stdio.h>
#include <stdlib.h>
#include "gpio.h"

#define GPIO_LED0 6
#define GPIO_LED1 5
#define GPIO_LED2 4
#define GPIO_LED3 3

#define INTERRUPT_HANDLER_ABI __attribute__((aligned(4), interrupt))


#define PRIVATE_REG_BASEADDRESS 0xFF000000 
#define SAFE_REG_BASEADDRESS    0xF0020000

//__attribute__((aligned(4))) void TMR_Safe_Activate(void);
//__attribute__((aligned(4))) void TMR_Safe_Stop(void);
INTERRUPT_HANDLER_ABI void handler_tmr_recoverysync(void);
INTERRUPT_HANDLER_ABI void handler_tmr_dmcontext_copy(void);
INTERRUPT_HANDLER_ABI void handler_tmr_dmshsync(void);
INTERRUPT_HANDLER_ABI void handler_safe_fsm(void);

int main(int argc, char *argv[])
{
    /* INIT */
    volatile unsigned int *P = 0xF0108000;
    volatile unsigned int *START_P = 0xF0020018;
    volatile unsigned int *ENTRY_PROG = 0xF0020020;
    volatile unsigned int *END_SW = 0xF002001C;
    volatile unsigned int *CONFIG = 0xF0020000;
    volatile unsigned int *Priv_Reg = PRIVATE_REG_BASEADDRESS;    
    *END_SW= 0x0;
    /* ----------------- */
    gpio_result_t gpio_Led0;
    gpio_result_t gpio_Led1;
    gpio_result_t gpio_Led2;
    gpio_result_t gpio_Led3;
    gpio_cfg_t pin_cfg_Led0 = {
        .pin = GPIO_LED0,
        .mode = GpioModeOutPushPull
    };    
    gpio_cfg_t pin_cfg_Led1 = {
        .pin = GPIO_LED1,
        .mode = GpioModeOutPushPull
    }; 
    gpio_cfg_t pin_cfg_Led2 = {
        .pin = GPIO_LED2,
        .mode = GpioModeOutPushPull
    }; 
    gpio_cfg_t pin_cfg_Led3 = {
        .pin = GPIO_LED3,
        .mode = GpioModeOutPushPull
    };     
    gpio_Led0 = gpio_config (pin_cfg_Led0);
    gpio_Led1 = gpio_config (pin_cfg_Led1);
    gpio_Led2 = gpio_config (pin_cfg_Led2);
    gpio_Led3 = gpio_config (pin_cfg_Led3);    
    volatile unsigned int *i = 0xF0108040;

    for(int j=0;j<10;j++){
        while(1){
        if((*i)<50000){
            gpio_write(GPIO_LED0, true);        
        }else if((*i)<100000){
            gpio_write(GPIO_LED0, false);
        }else{
        (*i)=0;
        break;
        }
        (*i)++;
        }
     }
    for(int j=0;j<10;j++){
        while(1){
        if((*i)<50000){
            gpio_write(GPIO_LED1, true);        
        }else if((*i)<100000){
            gpio_write(GPIO_LED1, false);
        }else{
        (*i)=0;
        break;
        }
        (*i)++;
        }
     }
    for(int j=0;j<10;j++){
        while(1){
        if((*i)<50000){
            gpio_write(GPIO_LED2, true);        
        }else if((*i)<100000){
            gpio_write(GPIO_LED2, false);
        }else{
        (*i)=0;
        break;
        }
        (*i)++;
        }
     }        
     





//END PROGRAM
    *END_SW= 0x1;
    while(1){asm volatile("wfi");}
    return 0;
    //return EXIT_SUCCESS;

}

void handler_tmr_recoverysync(void){ 
  //ACK INTC
  volatile unsigned int *Priv_Reg = 0xFF000004;
  *Priv_Reg = 0x1;      //Handshake ACK 
          //Modify mepc
  
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

        *Priv_Reg = 0x0; //Handshake ACK  
}

void handler_safe_fsm(void) { 

  volatile unsigned int *Priv_Reg = 0xFF000004;
  *Priv_Reg = 0x1;
  *Priv_Reg = 0x0;

//        asm volatill("li   t6,0x00");
//        asm volatilel"csrw mstatus, t6"); 
//        asm volatile("li   t6,0x08");
//        asm volatile("csrw mstatus, t6"); 
        // Set mie.MEIE bit to one to enable machine-level external interrupts
        //Activate Interrupt
        // Enable interrupt on processor side
        // Enable global interrupt for machine-level interrupts
//        asm volatile("li   t6,0x08");
//        asm volatile("csrw mstatus, t6"); 
        // Set mie.MEIE bit to one to enable machine-level external interrupts
}

void handler_tmr_dmcontext_copy(void){
  volatile unsigned int *Priv_Reg = 0xFF000004;
  *Priv_Reg = 0x1;
  *Priv_Reg = 0x0;

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

        asm volatile("li t6, 0xF0010200");     //PC -> wfi Debug_Boot_ROM
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
        asm volatile("li t5, 0xF0010200"); 
        asm volatile("sw t5, 124(t6)");
        //x30   t5  
//        asm volatile("li t6, 0xC874");
        asm volatile("sw t5, 116(t6)"); 

        //x31   t6 
//        asm volatile("li t6, 0xC878");
        asm volatile("sw t6, 120(t6)");


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