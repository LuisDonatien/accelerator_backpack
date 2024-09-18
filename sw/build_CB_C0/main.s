
/home/luis/Documents/PhD/CB-heep/hw/vendor/cei_mochila/sw/build_CB_C0/CMakeFiles/main.elf.dir/applications_CB_C0/TMR_Safe_CPU/main.c.obj:     file format elf32-littleriscv


Disassembly of section .text.startup.main:

00000000 <main>:
INTERRUPT_HANDLER_ABI void handler_tmr_dmcontext_copy(void);
INTERRUPT_HANDLER_ABI void handler_tmr_dmshsync(void);
INTERRUPT_HANDLER_ABI void handler_safe_fsm(void);
*/
int main(int argc, char *argv[]) 
{
   0:	1141                	addi	sp,sp,-16
   2:	c606                	sw	ra,12(sp)
   4:	c422                	sw	s0,8(sp)

volatile unsigned int *P=0xF0109000;
volatile unsigned int *Safe_config_reg= SAFE_REG_BASEADDRESS;    
volatile unsigned int *END_SW = 0xF002001C;     
//        printf("Hart: %d init the program...\n",*P); 
        asm volatile("csrr t6, mstatus");
   6:	30002ff3          	csrr	t6,mstatus
        asm volatile("ori t6,t6,0x08"); 
   a:	008fef93          	ori	t6,t6,8
        asm volatile("csrw mstatus, t6");  
   e:	300f9073          	csrw	mstatus,t6
        // Set mie.MEIE bit to one to enable machine-level external interrupts
        asm volatile("li   t6,0xFFFF0000"); 
  12:	7fc1                	lui	t6,0xffff0
        asm volatile("csrw mie, t6"); //mask = 1 << 31        
  14:	304f9073          	csrw	mie,t6
        //Entering Safe mode TMR 
        TMR_Safe_Activate(); 
  18:	00000097          	auipc	ra,0x0
  1c:	000080e7          	jalr	ra # 18 <main+0x18>

00000020 <.LBB17>:

__attribute__((aligned(4))) void TMR_Safe_Activate(void);
__attribute__((aligned(4))) void TMR_Safe_Stop(unsigned int master);
__attribute__((aligned(4),always_inline)) inline void TMR_Set_Critical_Section(unsigned int critical){
        volatile unsigned int *Priv_Reg = SAFE_REG_BASEADDRESS | 0xC;
        *Priv_Reg = critical;}
  20:	f00207b7          	lui	a5,0xf0020
  24:	4705                	li	a4,1
  26:	c7d8                	sw	a4,12(a5)

00000028 <.LBE17>:
        TMR_Set_Critical_Section(CRITICAL_SECTION);


        CSR_READ(CSR_REG_MHARTID,P);  
  28:	f1402773          	csrr	a4,mhartid
  2c:	f01097b7          	lui	a5,0xf0109
  30:	c398                	sw	a4,0(a5)

00000032 <.LBB19>:

        volatile unsigned int *i = 0xF0108040; 

        for(int j=0;j<10;j++)  
  32:	4629                	li	a2,10
  34:	4781                	li	a5,0
                *i=j;
  36:	f0108737          	lui	a4,0xf0108

0000003a <.L2>:
  3a:	c33c                	sw	a5,64(a4)
        for(int j=0;j<10;j++)  
  3c:	0785                	addi	a5,a5,1
  3e:	fec79ee3          	bne	a5,a2,3a <.L2>

00000042 <.LBE19>:
         *i=0xdeadbeef;
  42:	deadc7b7          	lui	a5,0xdeadc

00000046 <.LVL6>:
  46:	eef78793          	addi	a5,a5,-273 # deadbeef <.LFE4+0xdeadbdcf>
  4a:	c33c                	sw	a5,64(a4)

0000004c <.LBB20>:
  4c:	f0020437          	lui	s0,0xf0020

00000050 <.LBE20>:

        Check_RF();
  50:	00000097          	auipc	ra,0x0
  54:	000080e7          	jalr	ra # 50 <.LBE20>

00000058 <.LBB23>:
  58:	00042623          	sw	zero,12(s0) # f002000c <.LFE4+0xf001feec>

0000005c <.LBE23>:

        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();
  5c:	00000097          	auipc	ra,0x0
  60:	000080e7          	jalr	ra # 5c <.LBE23>

00000064 <.LVL10>:

        TMR_Safe_Stop(MASTER_CORE0); 
  64:	4505                	li	a0,1
  66:	00000097          	auipc	ra,0x0
  6a:	000080e7          	jalr	ra # 66 <.LVL10+0x2>

0000006e <.LVL11>:

        TMR_Safe_Activate(); 
  6e:	00000097          	auipc	ra,0x0
  72:	000080e7          	jalr	ra # 6e <.LVL11>

00000076 <.LBB24>:
  76:	4785                	li	a5,1
  78:	c45c                	sw	a5,12(s0)

0000007a <.LBE24>:
        TMR_Set_Critical_Section(CRITICAL_SECTION); 
 
 
        CSR_READ(CSR_REG_MHARTID,P);  
  7a:	f1402773          	csrr	a4,mhartid
  7e:	f01097b7          	lui	a5,0xf0109
  82:	c398                	sw	a4,0(a5)

00000084 <.LBB26>:

 
        for(int j=0;j<10;j++)   
  84:	4629                	li	a2,10
  86:	4781                	li	a5,0
                *i=j;  
  88:	f0108737          	lui	a4,0xf0108

0000008c <.L3>:
  8c:	c33c                	sw	a5,64(a4)
        for(int j=0;j<10;j++)   
  8e:	0785                	addi	a5,a5,1
  90:	fec79ee3          	bne	a5,a2,8c <.L3>

00000094 <.LBE26>:
         *i=0xdeadbeef;
  94:	deadc7b7          	lui	a5,0xdeadc

00000098 <.LVL17>:
  98:	eef78793          	addi	a5,a5,-273 # deadbeef <.LFE4+0xdeadbdcf>
  9c:	c33c                	sw	a5,64(a4)

0000009e <.LBB27>:
  9e:	f0020437          	lui	s0,0xf0020

000000a2 <.LBE27>:

        Check_RF();
  a2:	00000097          	auipc	ra,0x0
  a6:	000080e7          	jalr	ra # a2 <.LBE27>

000000aa <.LBB30>:
  aa:	00042623          	sw	zero,12(s0) # f002000c <.LFE4+0xf001feec>

000000ae <.LBE30>:

        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();
  ae:	00000097          	auipc	ra,0x0
  b2:	000080e7          	jalr	ra # ae <.LBE30>

000000b6 <.LVL21>:

        TMR_Safe_Stop(MASTER_CORE2);   
  b6:	4511                	li	a0,4
  b8:	00000097          	auipc	ra,0x0
  bc:	000080e7          	jalr	ra # b8 <.LVL21+0x2>

000000c0 <.LVL22>:
 
        TMR_Safe_Activate();  
  c0:	00000097          	auipc	ra,0x0
  c4:	000080e7          	jalr	ra # c0 <.LVL22>

000000c8 <.LBB31>:
  c8:	4785                	li	a5,1
  ca:	c45c                	sw	a5,12(s0)

000000cc <.LBE31>:
        TMR_Set_Critical_Section(CRITICAL_SECTION);
  

        CSR_READ(CSR_REG_MHARTID,P);  
  cc:	f1402773          	csrr	a4,mhartid
  d0:	f01097b7          	lui	a5,0xf0109
  d4:	c398                	sw	a4,0(a5)

000000d6 <.LBB33>:


        for(int j=0;j<10;j++)  
  d6:	4629                	li	a2,10
  d8:	4781                	li	a5,0
                *i=j;
  da:	f0108737          	lui	a4,0xf0108

000000de <.L4>:
  de:	c33c                	sw	a5,64(a4)
        for(int j=0;j<10;j++)  
  e0:	0785                	addi	a5,a5,1
  e2:	fec79ee3          	bne	a5,a2,de <.L4>

000000e6 <.LBE33>:
         *i=0xdeadbeef;
  e6:	deadc7b7          	lui	a5,0xdeadc

000000ea <.LVL28>:
  ea:	eef78793          	addi	a5,a5,-273 # deadbeef <.LFE4+0xdeadbdcf>
  ee:	c33c                	sw	a5,64(a4)

000000f0 <.LBB34>:
  f0:	f0020437          	lui	s0,0xf0020

000000f4 <.LBE34>:
 
        Check_RF();
  f4:	00000097          	auipc	ra,0x0
  f8:	000080e7          	jalr	ra # f4 <.LBE34>

000000fc <.LBB37>:
  fc:	00042623          	sw	zero,12(s0) # f002000c <.LFE4+0xf001feec>

00000100 <.LBE37>:

        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();
 100:	00000097          	auipc	ra,0x0
 104:	000080e7          	jalr	ra # 100 <.LBE37>

00000108 <.LVL32>:

        TMR_Safe_Stop(MASTER_CORE1); 
 108:	4509                	li	a0,2
 10a:	00000097          	auipc	ra,0x0
 10e:	000080e7          	jalr	ra # 10a <.LVL32+0x2>

00000112 <.LVL33>:


 
//       CSR_READ(CSR_REG_MHARTID,P); 
        /******END PROGRAM******/  
        *END_SW = 0x1;
 112:	4785                	li	a5,1
 114:	cc5c                	sw	a5,28(s0)
        asm volatile("fence");
 116:	0ff0000f          	fence

0000011a <.L5>:
        while(1){ 
        asm volatile("wfi");
 11a:	10500073          	wfi
        while(1){ 
 11e:	bff5                	j	11a <.L5>
