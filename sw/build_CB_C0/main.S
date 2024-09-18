
main.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

f0100000 <__vector_start>:

.section .vectors, "ax"
.option norvc
vector_table:
	//  0 : exception Handler and user software interrupt
	j handler_exception
f0100000:	2810006f          	j	f0100a80 <handler_exception>
	//  1 : supervisor software interrupt
	j __no_irq_handler
f0100004:	2ec0006f          	j	f01002f0 <__no_irq_handler>
	//  2 : unmapped
	j __no_irq_handler
f0100008:	2e80006f          	j	f01002f0 <__no_irq_handler>
	//  3 : machine software interrupt handler
	j handler_irq_software
f010000c:	32d0006f          	j	f0100b38 <handler_irq_software>
	//  4 : user timer interrupt
	j __no_irq_handler
f0100010:	2e00006f          	j	f01002f0 <__no_irq_handler>
	//  5 : supervisor timer interrupt
	j __no_irq_handler
f0100014:	2dc0006f          	j	f01002f0 <__no_irq_handler>
	//  6 : unmapped
	j __no_irq_handler
f0100018:	2d80006f          	j	f01002f0 <__no_irq_handler>
	//  7 : machine timer interrupt handler
	j handler_irq_timer
f010001c:	38d0006f          	j	f0100ba8 <handler_irq_timer>
	//  8 : user external interrupt
	j __no_irq_handler
f0100020:	2d00006f          	j	f01002f0 <__no_irq_handler>
	//  9 : supervisor external interrupt
	j __no_irq_handler
f0100024:	2cc0006f          	j	f01002f0 <__no_irq_handler>
	// 10 : unmapped
	j __no_irq_handler
f0100028:	2c80006f          	j	f01002f0 <__no_irq_handler>
	// 11 : machine external interrupt handler
	j handler_irq_external
f010002c:	1650006f          	j	f0100990 <handler_irq_external>
	// 12 : unmapped
	j __no_irq_handler
f0100030:	2c00006f          	j	f01002f0 <__no_irq_handler>
	// 13 : unmapped
	j __no_irq_handler
f0100034:	2bc0006f          	j	f01002f0 <__no_irq_handler>
	// 14 : unmapped
	j __no_irq_handler
f0100038:	2b80006f          	j	f01002f0 <__no_irq_handler>
	// 15 : unmapped
	j __no_irq_handler
f010003c:	2b40006f          	j	f01002f0 <__no_irq_handler>
	// 16 : fast interrupt 
	j handler_tmr_recoverysync
f0100040:	6140006f          	j	f0100654 <handler_tmr_recoverysync>
	// 17 : fast interrupt 
	j handler_safe_fsm
f0100044:	77c0006f          	j	f01007c0 <handler_safe_fsm>
	// 18 : fast interrupt 
	j handler_tmr_dmcontext_copy
f0100048:	7980006f          	j	f01007e0 <handler_tmr_dmcontext_copy>
	// 19 : fast interrupt 
	j handler_tmr_dmshsync
f010004c:	0710006f          	j	f01008bc <handler_tmr_dmshsync>
	// 20 : fast interrupt 
	j __no_irq_handler
f0100050:	2a00006f          	j	f01002f0 <__no_irq_handler>
	// 21 : fast interrupt 
	j __no_irq_handler
f0100054:	29c0006f          	j	f01002f0 <__no_irq_handler>
	// 22 : fast interrupt 
	j __no_irq_handler
f0100058:	2980006f          	j	f01002f0 <__no_irq_handler>
	// 23 : fast interrupt 
	j __no_irq_handler
f010005c:	2940006f          	j	f01002f0 <__no_irq_handler>
	// 24 : fast interrupt 
	j __no_irq_handler
f0100060:	2900006f          	j	f01002f0 <__no_irq_handler>
	// 25 : fast interrupt
	j __no_irq_handler
f0100064:	28c0006f          	j	f01002f0 <__no_irq_handler>
	// 26 : fast interrupt 
	j __no_irq_handler
f0100068:	2880006f          	j	f01002f0 <__no_irq_handler>
	// 27 : fast interrupt 
	j __no_irq_handler
f010006c:	2840006f          	j	f01002f0 <__no_irq_handler>
	// 28 : fast interrupt 
	j __no_irq_handler
f0100070:	2800006f          	j	f01002f0 <__no_irq_handler>
	// 29 : fast interrupt 
	j __no_irq_handler
f0100074:	27c0006f          	j	f01002f0 <__no_irq_handler>
	// 30 : fast interrupt - Safe_FSM_handler
	j __no_irq_handler
f0100078:	2780006f          	j	f01002f0 <__no_irq_handler>
	// vendor interrupts: on Ibex interrupt id 31 is for non-maskable interrupts
	j __no_irq_handler
f010007c:	2740006f          	j	f01002f0 <__no_irq_handler>
	// 64-32 : not connected on Ibex
	j verification_irq_handler
f0100080:	2f80006f          	j	f0100378 <verification_irq_handler>
	j __no_irq_handler
f0100084:	26c0006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f0100088:	2680006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f010008c:	2640006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f0100090:	2600006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f0100094:	25c0006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f0100098:	2580006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f010009c:	2540006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000a0:	2500006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000a4:	24c0006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000a8:	2480006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000ac:	2440006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000b0:	2400006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000b4:	23c0006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000b8:	2380006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000bc:	2340006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000c0:	2300006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000c4:	22c0006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000c8:	2280006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000cc:	2240006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000d0:	2200006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000d4:	21c0006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000d8:	2180006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000dc:	2140006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000e0:	2100006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000e4:	20c0006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000e8:	2080006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000ec:	2040006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000f0:	2000006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000f4:	1fc0006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000f8:	1f80006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f01000fc:	1f40006f          	j	f01002f0 <__no_irq_handler>
	j __no_irq_handler
f0100100:	1f00006f          	j	f01002f0 <__no_irq_handler>

Disassembly of section .init:

f0100180 <_start>:

_start:
/* initialize global pointer */
.option push
.option norelax
1: auipc gp, %pcrel_hi(__global_pointer$)
f0100180:	00009197          	auipc	gp,0x9
   addi  gp, gp, %pcrel_lo(1b)
f0100184:	aac18193          	addi	gp,gp,-1364 # f0108c2c <__global_pointer$>
.option pop

/* initialize stack pointer */
   la sp, _sp
f0100188:	00009117          	auipc	sp,0x9
f010018c:	3c810113          	addi	sp,sp,968 # f0109550 <_sp>

/* set the frequency */
   li a0, SOC_CTRL_START_ADDRESS
f0100190:	20000537          	lui	a0,0x20000
   li a2, REFERENCE_CLOCK_Hz
f0100194:	05f5e637          	lui	a2,0x5f5e
f0100198:	10060613          	addi	a2,a2,256 # 5f5e100 <syscalls.c.1b5c30a8+0x5f5647c>
   sw a2, SOC_CTRL_SYSTEM_FREQUENCY_HZ_REG_OFFSET(a0)
f010019c:	cd50                	sw	a2,28(a0)

f010019e <_init_bss>:

/* clear the bss segment */
_init_bss:
    la     a0, __bss_start
f010019e:	00008517          	auipc	a0,0x8
f01001a2:	2fe50513          	addi	a0,a0,766 # f010849c <errno>
    la     a2, __bss_end
f01001a6:	00008617          	auipc	a2,0x8
f01001aa:	39e60613          	addi	a2,a2,926 # f0108544 <__BSS_END__>
    sub    a2, a2, a0
f01001ae:	8e09                	sub	a2,a2,a0
    li     a1, 0
f01001b0:	4581                	li	a1,0
    call   memset
f01001b2:	421000ef          	jal	ra,f0100dd2 <memset>
    blt a1, a2, loop_init_data
    end_init_data:
#endif

/* set vector table address and vectored mode */
    la a0, __vector_start
f01001b6:	00000517          	auipc	a0,0x0
f01001ba:	e4a50513          	addi	a0,a0,-438 # f0100000 <__vector_start>
    ori a0, a0, 0x1
f01001be:	00156513          	ori	a0,a0,1
    csrw mtvec, a0
f01001c2:	30551073          	csrw	mtvec,a0

/* new-style constructors and destructors */
    la a0, __libc_fini_array
f01001c6:	00001517          	auipc	a0,0x1
f01001ca:	b6c50513          	addi	a0,a0,-1172 # f0100d32 <__libc_fini_array>
    call atexit
f01001ce:	35b000ef          	jal	ra,f0100d28 <atexit>
    call __libc_init_array
f01001d2:	39b000ef          	jal	ra,f0100d6c <__libc_init_array>

/* call main */
    lw a0, 0(sp)                    /* a0 = argc */
f01001d6:	4502                	lw	a0,0(sp)
    addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
f01001d8:	004c                	addi	a1,sp,4
    li a2, 0                        /* a2 = envp = NULL */
f01001da:	4601                	li	a2,0
    call main
f01001dc:	03c000ef          	jal	ra,f0100218 <main>
    tail exit
f01001e0:	00c0006f          	j	f01001ec <exit>

f01001e4 <_init>:
.global _init
.type   _init, @function
.global _fini
.type   _fini, @function
_init:
    call init
f01001e4:	235000ef          	jal	ra,f0100c18 <init>

f01001e8 <_fini>:
_fini:
 /* These don't have to do anything since we use init_array/fini_array. Prevent
    missing symbol error */
    ret
f01001e8:	8082                	ret

Disassembly of section .text:

f01001ec <exit>:
f01001ec:	1141                	addi	sp,sp,-16
f01001ee:	f01017b7          	lui	a5,0xf0101
f01001f2:	c422                	sw	s0,8(sp)
f01001f4:	c606                	sw	ra,12(sp)
f01001f6:	22478793          	addi	a5,a5,548 # f0101224 <_sp+0xffff7cd4>
f01001fa:	842a                	mv	s0,a0
f01001fc:	c781                	beqz	a5,f0100204 <exit+0x18>
f01001fe:	4581                	li	a1,0
f0100200:	024010ef          	jal	ra,f0101224 <__call_exitprocs>
f0100204:	f01087b7          	lui	a5,0xf0108
f0100208:	48c7a503          	lw	a0,1164(a5) # f010848c <_sp+0xffffef3c>
f010020c:	551c                	lw	a5,40(a0)
f010020e:	c391                	beqz	a5,f0100212 <exit+0x26>
f0100210:	9782                	jalr	a5
f0100212:	8522                	mv	a0,s0
f0100214:	20d000ef          	jal	ra,f0100c20 <_exit>

f0100218 <main>:
INTERRUPT_HANDLER_ABI void handler_tmr_dmcontext_copy(void);
INTERRUPT_HANDLER_ABI void handler_tmr_dmshsync(void);
INTERRUPT_HANDLER_ABI void handler_safe_fsm(void);
*/
int main(int argc, char *argv[]) 
{
f0100218:	1141                	addi	sp,sp,-16
f010021a:	c606                	sw	ra,12(sp)
f010021c:	c422                	sw	s0,8(sp)

volatile unsigned int *P=0xF0109000;
volatile unsigned int *Safe_config_reg= SAFE_REG_BASEADDRESS;    
volatile unsigned int *END_SW = 0xF002001C;     
//        printf("Hart: %d init the program...\n",*P); 
        asm volatile("csrr t6, mstatus");
f010021e:	30002ff3          	csrr	t6,mstatus
        asm volatile("ori t6,t6,0x08"); 
f0100222:	008fef93          	ori	t6,t6,8
        asm volatile("csrw mstatus, t6");  
f0100226:	300f9073          	csrw	mstatus,t6
        // Set mie.MEIE bit to one to enable machine-level external interrupts
        asm volatile("li   t6,0xFFFF0000"); 
f010022a:	7fc1                	lui	t6,0xffff0
        asm volatile("csrw mie, t6"); //mask = 1 << 31        
f010022c:	304f9073          	csrw	mie,t6
        //Entering Safe mode TMR 
        TMR_Safe_Activate(); 
f0100230:	2601                	jal	f0100530 <TMR_Safe_Activate>

__attribute__((aligned(4))) void TMR_Safe_Activate(void);
__attribute__((aligned(4))) void TMR_Safe_Stop(unsigned int master);
__attribute__((aligned(4),always_inline)) inline void TMR_Set_Critical_Section(unsigned int critical){
        volatile unsigned int *Priv_Reg = SAFE_REG_BASEADDRESS | 0xC;
        *Priv_Reg = critical;}
f0100232:	f00207b7          	lui	a5,0xf0020
f0100236:	4705                	li	a4,1
f0100238:	c7d8                	sw	a4,12(a5)
        TMR_Set_Critical_Section(CRITICAL_SECTION);


        CSR_READ(CSR_REG_MHARTID,P);  
f010023a:	f1402773          	csrr	a4,mhartid
f010023e:	f01097b7          	lui	a5,0xf0109
f0100242:	c398                	sw	a4,0(a5)

        volatile unsigned int *i = 0xF0108040; 

        for(int j=0;j<10;j++)  
f0100244:	4629                	li	a2,10
f0100246:	4781                	li	a5,0
                *i=j;
f0100248:	f0108737          	lui	a4,0xf0108
f010024c:	c33c                	sw	a5,64(a4)
        for(int j=0;j<10;j++)  
f010024e:	0785                	addi	a5,a5,1
f0100250:	fec79ee3          	bne	a5,a2,f010024c <main+0x34>
         *i=0xdeadbeef;
f0100254:	deadc7b7          	lui	a5,0xdeadc
f0100258:	eef78793          	addi	a5,a5,-273 # deadbeef <_sp+0xee9d299f>
f010025c:	c33c                	sw	a5,64(a4)
f010025e:	f0020437          	lui	s0,0xf0020

        Check_RF();
f0100262:	2579                	jal	f01008f0 <Check_RF>
f0100264:	00042623          	sw	zero,12(s0) # f002000c <_sp+0xfff16abc>

        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();
f0100268:	2561                	jal	f01008f0 <Check_RF>

        TMR_Safe_Stop(MASTER_CORE0); 
f010026a:	4505                	li	a0,1
f010026c:	2e65                	jal	f0100624 <TMR_Safe_Stop>

        TMR_Safe_Activate(); 
f010026e:	24c9                	jal	f0100530 <TMR_Safe_Activate>
f0100270:	4785                	li	a5,1
f0100272:	c45c                	sw	a5,12(s0)
        TMR_Set_Critical_Section(CRITICAL_SECTION); 
 
 
        CSR_READ(CSR_REG_MHARTID,P);  
f0100274:	f1402773          	csrr	a4,mhartid
f0100278:	f01097b7          	lui	a5,0xf0109
f010027c:	c398                	sw	a4,0(a5)

 
        for(int j=0;j<10;j++)   
f010027e:	4629                	li	a2,10
f0100280:	4781                	li	a5,0
                *i=j;  
f0100282:	f0108737          	lui	a4,0xf0108
f0100286:	c33c                	sw	a5,64(a4)
        for(int j=0;j<10;j++)   
f0100288:	0785                	addi	a5,a5,1
f010028a:	fec79ee3          	bne	a5,a2,f0100286 <main+0x6e>
         *i=0xdeadbeef;
f010028e:	deadc7b7          	lui	a5,0xdeadc
f0100292:	eef78793          	addi	a5,a5,-273 # deadbeef <_sp+0xee9d299f>
f0100296:	c33c                	sw	a5,64(a4)
f0100298:	f0020437          	lui	s0,0xf0020

        Check_RF();
f010029c:	2d91                	jal	f01008f0 <Check_RF>
f010029e:	00042623          	sw	zero,12(s0) # f002000c <_sp+0xfff16abc>

        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();
f01002a2:	25b9                	jal	f01008f0 <Check_RF>

        TMR_Safe_Stop(MASTER_CORE2);   
f01002a4:	4511                	li	a0,4
f01002a6:	2ebd                	jal	f0100624 <TMR_Safe_Stop>
 
        TMR_Safe_Activate();  
f01002a8:	2461                	jal	f0100530 <TMR_Safe_Activate>
f01002aa:	4785                	li	a5,1
f01002ac:	c45c                	sw	a5,12(s0)
        TMR_Set_Critical_Section(CRITICAL_SECTION);
  

        CSR_READ(CSR_REG_MHARTID,P);  
f01002ae:	f1402773          	csrr	a4,mhartid
f01002b2:	f01097b7          	lui	a5,0xf0109
f01002b6:	c398                	sw	a4,0(a5)


        for(int j=0;j<10;j++)  
f01002b8:	4629                	li	a2,10
f01002ba:	4781                	li	a5,0
                *i=j;
f01002bc:	f0108737          	lui	a4,0xf0108
f01002c0:	c33c                	sw	a5,64(a4)
        for(int j=0;j<10;j++)  
f01002c2:	0785                	addi	a5,a5,1
f01002c4:	fec79ee3          	bne	a5,a2,f01002c0 <main+0xa8>
         *i=0xdeadbeef;
f01002c8:	deadc7b7          	lui	a5,0xdeadc
f01002cc:	eef78793          	addi	a5,a5,-273 # deadbeef <_sp+0xee9d299f>
f01002d0:	c33c                	sw	a5,64(a4)
f01002d2:	f0020437          	lui	s0,0xf0020
 
        Check_RF();
f01002d6:	2d29                	jal	f01008f0 <Check_RF>
f01002d8:	00042623          	sw	zero,12(s0) # f002000c <_sp+0xfff16abc>

        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
 
        Check_RF();
f01002dc:	2d11                	jal	f01008f0 <Check_RF>

        TMR_Safe_Stop(MASTER_CORE1); 
f01002de:	4509                	li	a0,2
f01002e0:	2691                	jal	f0100624 <TMR_Safe_Stop>


 
//       CSR_READ(CSR_REG_MHARTID,P); 
        /******END PROGRAM******/  
        *END_SW = 0x1;
f01002e2:	4785                	li	a5,1
f01002e4:	cc5c                	sw	a5,28(s0)
        asm volatile("fence");
f01002e6:	0ff0000f          	fence
        while(1){ 
        asm volatile("wfi");
f01002ea:	10500073          	wfi
        while(1){ 
f01002ee:	bff5                	j	f01002ea <main+0xd2>

f01002f0 <__no_irq_handler>:

.section .text.vecs
/* exception handling */
__no_irq_handler:
	la a0, no_exception_handler_msg
f01002f0:	00008517          	auipc	a0,0x8
f01002f4:	da550513          	addi	a0,a0,-603 # f0108095 <no_exception_handler_msg>
	jal ra, puts
f01002f8:	3c9000ef          	jal	ra,f0100ec0 <puts>
	j __no_irq_handler
f01002fc:	ff5ff06f          	j	f01002f0 <__no_irq_handler>

f0100300 <sw_irq_handler>:

sw_irq_handler:
	csrr t0, mcause
f0100300:	342022f3          	csrr	t0,mcause
	slli t0, t0, 1  /* shift off the high bit */
f0100304:	00129293          	slli	t0,t0,0x1
	srli t0, t0, 1
f0100308:	0012d293          	srli	t0,t0,0x1
	li t1, 2
f010030c:	00200313          	li	t1,2
	beq t0, t1, handle_illegal_insn
f0100310:	02628c63          	beq	t0,t1,f0100348 <handle_illegal_insn>
	li t1, 11
f0100314:	00b00313          	li	t1,11
	beq t0, t1, handle_ecall
f0100318:	00628863          	beq	t0,t1,f0100328 <handle_ecall>
	li t1, 3
f010031c:	00300313          	li	t1,3
	beq t0, t1, handle_ebreak
f0100320:	00628c63          	beq	t0,t1,f0100338 <handle_ebreak>
	j handle_unknown
f0100324:	0340006f          	j	f0100358 <handle_unknown>

f0100328 <handle_ecall>:

handle_ecall:
	la a0, ecall_msg
f0100328:	00008517          	auipc	a0,0x8
f010032c:	d0750513          	addi	a0,a0,-761 # f010802f <ecall_msg>
	jal ra, puts
f0100330:	391000ef          	jal	ra,f0100ec0 <puts>
	j end_handler
f0100334:	0340006f          	j	f0100368 <end_handler>

f0100338 <handle_ebreak>:

handle_ebreak:
	la a0, ebreak_msg
f0100338:	00008517          	auipc	a0,0x8
f010033c:	d1850513          	addi	a0,a0,-744 # f0108050 <ebreak_msg>
	jal ra, puts
f0100340:	381000ef          	jal	ra,f0100ec0 <puts>
	j end_handler
f0100344:	0240006f          	j	f0100368 <end_handler>

f0100348 <handle_illegal_insn>:

handle_illegal_insn:
	la a0, illegal_insn_msg
f0100348:	00008517          	auipc	a0,0x8
f010034c:	cb850513          	addi	a0,a0,-840 # f0108000 <illegal_insn_msg>
	jal ra, puts
f0100350:	371000ef          	jal	ra,f0100ec0 <puts>
	j end_handler
f0100354:	0140006f          	j	f0100368 <end_handler>

f0100358 <handle_unknown>:

handle_unknown:
	la a0, unknown_msg
f0100358:	00008517          	auipc	a0,0x8
f010035c:	d1a50513          	addi	a0,a0,-742 # f0108072 <unknown_msg>
	jal ra, puts
f0100360:	361000ef          	jal	ra,f0100ec0 <puts>
	j end_handler
f0100364:	0040006f          	j	f0100368 <end_handler>

f0100368 <end_handler>:

end_handler:
	csrr a0, mepc
f0100368:	34102573          	csrr	a0,mepc
	addi a0, a0, 4
f010036c:	00450513          	addi	a0,a0,4
	csrw mepc, a0
f0100370:	34151073          	csrw	mepc,a0
	mret
f0100374:	30200073          	mret

f0100378 <verification_irq_handler>:
/* this interrupt can be generated for verification purposes, random or when the PC is equal to a given value*/
verification_irq_handler:
	mret
f0100378:	30200073          	mret

f010037c <dma_is_ready>:
    return DMA_CONFIG_OK;
}


__attribute__((optimize("O0"))) uint32_t dma_is_ready(void)
{
f010037c:	1101                	addi	sp,sp,-32
f010037e:	ce22                	sw	s0,28(sp)
f0100380:	1000                	addi	s0,sp,32
    /* The transaction READY bit is read from the status register*/
    uint32_t ret = ( dma_cb.peri->STATUS & (1<<DMA_STATUS_READY_BIT) );
f0100382:	f01087b7          	lui	a5,0xf0108
f0100386:	4ac78793          	addi	a5,a5,1196 # f01084ac <_sp+0xffffef5c>
f010038a:	479c                	lw	a5,8(a5)
f010038c:	4b9c                	lw	a5,16(a5)
f010038e:	8b85                	andi	a5,a5,1
f0100390:	fef42623          	sw	a5,-20(s0)
    return ret;
f0100394:	fec42783          	lw	a5,-20(s0)
}
f0100398:	853e                	mv	a0,a5
f010039a:	4472                	lw	s0,28(sp)
f010039c:	6105                	addi	sp,sp,32
f010039e:	8082                	ret

f01003a0 <dma_intr_handler_trans_done>:
    dma_cb.peri->MODE = DMA_TRANS_MODE_SINGLE;
}


__attribute__((weak, optimize("O0"))) void dma_intr_handler_trans_done()
{
f01003a0:	1141                	addi	sp,sp,-16
f01003a2:	c622                	sw	s0,12(sp)
f01003a4:	0800                	addi	s0,sp,16
     * This is a weak implementation.
     * Create your own function called
     * void dma_intr_handler_trans_done()
     * to override this one.
     */
}
f01003a6:	0001                	nop
f01003a8:	4432                	lw	s0,12(sp)
f01003aa:	0141                	addi	sp,sp,16
f01003ac:	8082                	ret

f01003ae <dma_intr_handler_window_done>:
f01003ae:	1141                	addi	sp,sp,-16
f01003b0:	c622                	sw	s0,12(sp)
f01003b2:	0800                	addi	s0,sp,16
f01003b4:	4432                	lw	s0,12(sp)
f01003b6:	0141                	addi	sp,sp,16
f01003b8:	b7e5                	j	f01003a0 <dma_intr_handler_trans_done>

f01003ba <dma_window_ratio_warning_threshold>:
     * to override this one.
     */
}

__attribute__((weak, optimize("O0"))) uint8_t dma_window_ratio_warning_threshold()
{
f01003ba:	1141                	addi	sp,sp,-16
f01003bc:	c622                	sw	s0,12(sp)
f01003be:	0800                	addi	s0,sp,16
     * Create your own function called
     * void dma_window_ratio_warning_threshold()
     * to override this one.
     * Make it return 0 to disable this warning.
     */
    return DMA_DEFAULT_TRANS_TO_WIND_SIZE_RATIO_THRESHOLD;
f01003c0:	4791                	li	a5,4
}
f01003c2:	853e                	mv	a0,a5
f01003c4:	4432                	lw	s0,12(sp)
f01003c6:	0141                	addi	sp,sp,16
f01003c8:	8082                	ret

f01003ca <fic_irq_timer_1>:
f01003ca:	1141                	addi	sp,sp,-16
f01003cc:	c622                	sw	s0,12(sp)
f01003ce:	0800                	addi	s0,sp,16
f01003d0:	4432                	lw	s0,12(sp)
f01003d2:	0141                	addi	sp,sp,16
f01003d4:	b7f1                	j	f01003a0 <dma_intr_handler_trans_done>

f01003d6 <fic_irq_timer_2>:
f01003d6:	1141                	addi	sp,sp,-16
f01003d8:	c622                	sw	s0,12(sp)
f01003da:	0800                	addi	s0,sp,16
f01003dc:	4432                	lw	s0,12(sp)
f01003de:	0141                	addi	sp,sp,16
f01003e0:	b7c1                	j	f01003a0 <dma_intr_handler_trans_done>

f01003e2 <fic_irq_timer_3>:
f01003e2:	1141                	addi	sp,sp,-16
f01003e4:	c622                	sw	s0,12(sp)
f01003e6:	0800                	addi	s0,sp,16
f01003e8:	4432                	lw	s0,12(sp)
f01003ea:	0141                	addi	sp,sp,16
f01003ec:	bf55                	j	f01003a0 <dma_intr_handler_trans_done>

f01003ee <fic_irq_spi>:
f01003ee:	1141                	addi	sp,sp,-16
f01003f0:	c622                	sw	s0,12(sp)
f01003f2:	0800                	addi	s0,sp,16
f01003f4:	4432                	lw	s0,12(sp)
f01003f6:	0141                	addi	sp,sp,16
f01003f8:	b765                	j	f01003a0 <dma_intr_handler_trans_done>

f01003fa <fic_irq_spi_flash>:
f01003fa:	1141                	addi	sp,sp,-16
f01003fc:	c622                	sw	s0,12(sp)
f01003fe:	0800                	addi	s0,sp,16
f0100400:	4432                	lw	s0,12(sp)
f0100402:	0141                	addi	sp,sp,16
f0100404:	bf71                	j	f01003a0 <dma_intr_handler_trans_done>

f0100406 <fic_irq_gpio_0>:
f0100406:	1141                	addi	sp,sp,-16
f0100408:	c622                	sw	s0,12(sp)
f010040a:	0800                	addi	s0,sp,16
f010040c:	4432                	lw	s0,12(sp)
f010040e:	0141                	addi	sp,sp,16
f0100410:	bf41                	j	f01003a0 <dma_intr_handler_trans_done>

f0100412 <fic_irq_gpio_1>:
f0100412:	1141                	addi	sp,sp,-16
f0100414:	c622                	sw	s0,12(sp)
f0100416:	0800                	addi	s0,sp,16
f0100418:	4432                	lw	s0,12(sp)
f010041a:	0141                	addi	sp,sp,16
f010041c:	b751                	j	f01003a0 <dma_intr_handler_trans_done>

f010041e <fic_irq_gpio_2>:
f010041e:	1141                	addi	sp,sp,-16
f0100420:	c622                	sw	s0,12(sp)
f0100422:	0800                	addi	s0,sp,16
f0100424:	4432                	lw	s0,12(sp)
f0100426:	0141                	addi	sp,sp,16
f0100428:	bfa5                	j	f01003a0 <dma_intr_handler_trans_done>

f010042a <fic_irq_gpio_3>:
f010042a:	1141                	addi	sp,sp,-16
f010042c:	c622                	sw	s0,12(sp)
f010042e:	0800                	addi	s0,sp,16
f0100430:	4432                	lw	s0,12(sp)
f0100432:	0141                	addi	sp,sp,16
f0100434:	b7b5                	j	f01003a0 <dma_intr_handler_trans_done>

f0100436 <fic_irq_gpio_4>:
f0100436:	1141                	addi	sp,sp,-16
f0100438:	c622                	sw	s0,12(sp)
f010043a:	0800                	addi	s0,sp,16
f010043c:	4432                	lw	s0,12(sp)
f010043e:	0141                	addi	sp,sp,16
f0100440:	b785                	j	f01003a0 <dma_intr_handler_trans_done>

f0100442 <fic_irq_gpio_5>:
f0100442:	1141                	addi	sp,sp,-16
f0100444:	c622                	sw	s0,12(sp)
f0100446:	0800                	addi	s0,sp,16
f0100448:	4432                	lw	s0,12(sp)
f010044a:	0141                	addi	sp,sp,16
f010044c:	bf91                	j	f01003a0 <dma_intr_handler_trans_done>

f010044e <fic_irq_gpio_6>:
f010044e:	1141                	addi	sp,sp,-16
f0100450:	c622                	sw	s0,12(sp)
f0100452:	0800                	addi	s0,sp,16
f0100454:	4432                	lw	s0,12(sp)
f0100456:	0141                	addi	sp,sp,16
f0100458:	b7a1                	j	f01003a0 <dma_intr_handler_trans_done>

f010045a <fic_irq_gpio_7>:
f010045a:	1141                	addi	sp,sp,-16
f010045c:	c622                	sw	s0,12(sp)
f010045e:	0800                	addi	s0,sp,16
f0100460:	4432                	lw	s0,12(sp)
f0100462:	0141                	addi	sp,sp,16
f0100464:	bf35                	j	f01003a0 <dma_intr_handler_trans_done>

f0100466 <gpio_handler_irq_dummy>:
/*                            LOCAL FUNCTIONS                               */
/**                                                                        **/
/****************************************************************************/

__attribute__((optimize("O0"))) static void gpio_handler_irq_dummy( uint32_t dummy )
{
f0100466:	1101                	addi	sp,sp,-32
f0100468:	ce22                	sw	s0,28(sp)
f010046a:	1000                	addi	s0,sp,32
f010046c:	fea42623          	sw	a0,-20(s0)
  return;
f0100470:	0001                	nop
}
f0100472:	4472                	lw	s0,28(sp)
f0100474:	6105                	addi	sp,sp,32
f0100476:	8082                	ret

f0100478 <handler_irq_i2c>:

  return i2c_write_byte_raw(i2c, byte, flags);
}

__attribute__((weak, optimize("O0"))) void handler_irq_i2c(uint32_t id)
{
f0100478:	1101                	addi	sp,sp,-32
f010047a:	ce22                	sw	s0,28(sp)
f010047c:	1000                	addi	s0,sp,32
f010047e:	fea42623          	sw	a0,-20(s0)
 // Replace this function with a non-weak implementation
f0100482:	0001                	nop
f0100484:	4472                	lw	s0,28(sp)
f0100486:	6105                	addi	sp,sp,32
f0100488:	8082                	ret

f010048a <handler_irq_i2s>:
f010048a:	1101                	addi	sp,sp,-32
f010048c:	ce22                	sw	s0,28(sp)
f010048e:	1000                	addi	s0,sp,32
f0100490:	fea42623          	sw	a0,-20(s0)
f0100494:	fec42503          	lw	a0,-20(s0)
f0100498:	4472                	lw	s0,28(sp)
f010049a:	6105                	addi	sp,sp,32
f010049c:	bff1                	j	f0100478 <handler_irq_i2c>

f010049e <handler_irq_dummy>:
/*                            LOCAL FUNCTIONS                               */
/**                                                                        **/
/****************************************************************************/

__attribute__((optimize("O0"))) static void handler_irq_dummy( uint32_t dummy )
{
f010049e:	1101                	addi	sp,sp,-32
f01004a0:	ce22                	sw	s0,28(sp)
f01004a2:	1000                	addi	s0,sp,32
f01004a4:	fea42623          	sw	a0,-20(s0)
}
f01004a8:	0001                	nop
f01004aa:	4472                	lw	s0,28(sp)
f01004ac:	6105                	addi	sp,sp,32
f01004ae:	8082                	ret

f01004b0 <handler_irq_spi>:
f01004b0:	1101                	addi	sp,sp,-32
f01004b2:	ce22                	sw	s0,28(sp)
f01004b4:	1000                	addi	s0,sp,32
f01004b6:	fea42623          	sw	a0,-20(s0)
f01004ba:	fec42503          	lw	a0,-20(s0)
f01004be:	4472                	lw	s0,28(sp)
f01004c0:	6105                	addi	sp,sp,32
f01004c2:	bf5d                	j	f0100478 <handler_irq_i2c>

f01004c4 <handler_irq_uart>:
f01004c4:	1101                	addi	sp,sp,-32
f01004c6:	ce22                	sw	s0,28(sp)
f01004c8:	1000                	addi	s0,sp,32
f01004ca:	fea42623          	sw	a0,-20(s0)
f01004ce:	fec42503          	lw	a0,-20(s0)
f01004d2:	4472                	lw	s0,28(sp)
f01004d4:	6105                	addi	sp,sp,32
f01004d6:	b74d                	j	f0100478 <handler_irq_i2c>

f01004d8 <print_exc_msg>:
/**
 * Default Error Handling
 * @param msg error message supplied by caller
 * TODO - this will be soon by a real print formatting
 */
static void print_exc_msg(const char *msg) {
f01004d8:	85aa                	mv	a1,a0
  printf("%s", msg);
f01004da:	f0108537          	lui	a0,0xf0108
static void print_exc_msg(const char *msg) {
f01004de:	1141                	addi	sp,sp,-16
  printf("%s", msg);
f01004e0:	0b850513          	addi	a0,a0,184 # f01080b8 <_sp+0xffffeb68>
static void print_exc_msg(const char *msg) {
f01004e4:	c606                	sw	ra,12(sp)
  printf("%s", msg);
f01004e6:	780010ef          	jal	ra,f0101c66 <iprintf>
  CSR_READ(CSR_REG_MTVAL, &mtval);
f01004ea:	343025f3          	csrr	a1,mtval
  printf("MTVAL value is 0x%x\n", get_mtval());
f01004ee:	f0108537          	lui	a0,0xf0108
f01004f2:	0bc50513          	addi	a0,a0,188 # f01080bc <_sp+0xffffeb6c>
f01004f6:	770010ef          	jal	ra,f0101c66 <iprintf>
  while (1) {
f01004fa:	a001                	j	f01004fa <print_exc_msg+0x22>

f01004fc <handler_instr_acc_fault>:
//__attribute__((weak)) void handler_safe_fsm(void) {
//  volatile unsigned int *Priv_Reg = 0xFF000008;
//  *Priv_Reg = 0x1;
//}

__attribute__((weak)) void handler_instr_acc_fault(void) {
f01004fc:	715d                	addi	sp,sp,-80
  const char fault_msg[] =
f01004fe:	f01085b7          	lui	a1,0xf0108
f0100502:	03500613          	li	a2,53
f0100506:	0d458593          	addi	a1,a1,212 # f01080d4 <_sp+0xffffeb84>
f010050a:	0028                	addi	a0,sp,8
__attribute__((weak)) void handler_instr_acc_fault(void) {
f010050c:	c686                	sw	ra,76(sp)
  const char fault_msg[] =
f010050e:	70a010ef          	jal	ra,f0101c18 <memcpy>
      "Instruction access fault, mtval shows fault address\n";
  print_exc_msg(fault_msg);
f0100512:	0028                	addi	a0,sp,8
f0100514:	37d1                	jal	f01004d8 <print_exc_msg>

f0100516 <handler_lsu_fault>:
  const char exc_msg[] =
      "Breakpoint triggerd, mtval shows the breakpoint address\n";
  print_exc_msg(exc_msg);
}

__attribute__((weak)) void handler_lsu_fault(void) {
f0100516:	715d                	addi	sp,sp,-80
  const char exc_msg[] = "Load/Store fault, mtval shows the fault address\n";
f0100518:	f01085b7          	lui	a1,0xf0108
f010051c:	03100613          	li	a2,49
f0100520:	10c58593          	addi	a1,a1,268 # f010810c <_sp+0xffffebbc>
f0100524:	0068                	addi	a0,sp,12
__attribute__((weak)) void handler_lsu_fault(void) {
f0100526:	c686                	sw	ra,76(sp)
  const char exc_msg[] = "Load/Store fault, mtval shows the fault address\n";
f0100528:	6f0010ef          	jal	ra,f0101c18 <memcpy>
  print_exc_msg(exc_msg);
f010052c:	0068                	addi	a0,sp,12
f010052e:	376d                	jal	f01004d8 <print_exc_msg>

f0100530 <TMR_Safe_Activate>:
volatile unsigned int *P=0xF0109000;
volatile unsigned int *Safe_config_reg= SAFE_REG_BASEADDRESS;
volatile unsigned int *Priv_Reg = PRIVATE_REG_BASEADDRESS;

     //Starting Configuration
     if (*Safe_config_reg==0x0){
f0100530:	f00207b7          	lui	a5,0xf0020
f0100534:	4398                	lw	a4,0(a5)
f0100536:	e76d                	bnez	a4,f0100620 <TMR_Safe_Activate+0xf0>
        *Safe_config_reg = 0x1;
f0100538:	4705                	li	a4,1
f010053a:	c398                	sw	a4,0(a5)
        *(Safe_config_reg+1) = 0x1;
f010053c:	c3d8                	sw	a4,4(a5)

        //Activate Interrupt 
        // Enable interrupt on processor side
        // Enable global interrupt for machine-level interrupts
        asm volatile("csrr t6, mstatus");
f010053e:	30002ff3          	csrr	t6,mstatus
        asm volatile("ori t6,t6,0x08");
f0100542:	008fef93          	ori	t6,t6,8
        asm volatile("csrw mstatus, t6"); 
f0100546:	300f9073          	csrw	mstatus,t6
        // Set mie.MEIE bit to one to enable machine-level external interrupts
        asm volatile("li   t6,0xFFFF0000"); 
f010054a:	7fc1                	lui	t6,0xffff0
        asm volatile("csrw mie, t6"); //mask = 1 << 31
f010054c:	304f9073          	csrw	mie,t6

        
    //Control & Status Register
    //Set Base Address
        asm volatile("li   t5,0xF0108000");
f0100550:	f0108f37          	lui	t5,0xf0108
    //Machine Status
    //mstatus   0x300
        asm volatile("csrr t6, mstatus");
f0100554:	30002ff3          	csrr	t6,mstatus
        asm volatile("sw    t6,0(t5)");
f0100558:	01ff2023          	sw	t6,0(t5) # f0108000 <_sp+0xffffeab0>

    //Machine Interrupt Enable
    //mie       0x304
        asm volatile("csrr t6, mie");
f010055c:	30402ff3          	csrr	t6,mie
        asm volatile("sw    t6,4(t5)"); 
f0100560:	01ff2223          	sw	t6,4(t5)

    //Machine Trap-Vector
    //mtvec     0x305
        asm volatile("csrr t6, mtvec");
f0100564:	30502ff3          	csrr	t6,mtvec
        asm volatile("sw    t6,8(t5)");
f0100568:	01ff2423          	sw	t6,8(t5)

    //Machine Exception Program Counter
    //mepc      0x341
        asm volatile("csrr t6, mepc");
f010056c:	34102ff3          	csrr	t6,mepc
        asm volatile("sw    t6,12(t5)"); 
f0100570:	01ff2623          	sw	t6,12(t5)

    //Machine Trap Value Register
    //mtval     0x343
        asm volatile("csrr t6, mtval");
f0100574:	34302ff3          	csrr	t6,mtval
        asm volatile("sw    t6,16(t5)");
f0100578:	01ff2823          	sw	t6,16(t5)


    //Register File
        //x1    ra
        asm volatile("li t6, 0xF0108100");
f010057c:	f0108fb7          	lui	t6,0xf0108
f0100580:	100f8f93          	addi	t6,t6,256 # f0108100 <_sp+0xffffebb0>
        asm volatile("sw ra, 0(t6)");
f0100584:	001fa023          	sw	ra,0(t6)

        //x2    sp
//        asm volatile("li t6, 0xC804");
        asm volatile("sw sp, 4(t6)");
f0100588:	002fa223          	sw	sp,4(t6)

        //x3    gp
//        asm volatile("li t6, 0xC808");
        asm volatile("sw gp, 8(t6)"); 
f010058c:	003fa423          	sw	gp,8(t6)

        //x4    tp
//        asm volatile("li t6, 0xC80C");
        asm volatile("sw tp, 12(t6)");
f0100590:	004fa623          	sw	tp,12(t6)

        //x5    t0
//        asm volatile("li t6, 0xC810");
        asm volatile("sw t0, 16(t6)");   
f0100594:	005fa823          	sw	t0,16(t6)

        //x6    t1
//        asm volatile("li t6, 0xC814");
        asm volatile("sw t1, 20(t6)");       
f0100598:	006faa23          	sw	t1,20(t6)

        //x7    t2
//        asm volatile("li t6, 0xC818");
        asm volatile("sw t2, 24(t6)");
f010059c:	007fac23          	sw	t2,24(t6)

        //x8   s0/fp
//        asm volatile("li t6, 0xC81C");
        asm volatile("sw s0, 28(t6)");
f01005a0:	008fae23          	sw	s0,28(t6)

        //x9    s1
//        asm volatile("li t6, 0xC820");
        asm volatile("sw s1, 32(t6)");
f01005a4:	029fa023          	sw	s1,32(t6)

        //x10   a0 
//        asm volatile("li t6, 0xC824");
        asm volatile("sw a0, 36(t6)");
f01005a8:	02afa223          	sw	a0,36(t6)

        //x11   a1 
//        asm volatile("li t6, 0xC828");
        asm volatile("sw a1, 40(t6)");
f01005ac:	02bfa423          	sw	a1,40(t6)

        //x12   a2 
//        asm volatile("li t6, 0xC82C");
        asm volatile("sw a2, 44(t6)");
f01005b0:	02cfa623          	sw	a2,44(t6)

        //x13   a3 
//        asm volatile("li t6, 0xC830");
        asm volatile("sw a3, 48(t6)");
f01005b4:	02dfa823          	sw	a3,48(t6)


        //x14   a4 
//        asm volatile("li t6, 0xC834");
        asm volatile("sw a4, 52(t6)");
f01005b8:	02efaa23          	sw	a4,52(t6)

        //x15   a5 
//        asm volatile("li t6, 0xC838");
        asm volatile("sw a5, 56(t6)");
f01005bc:	02ffac23          	sw	a5,56(t6)

        //x16   a6 
//        asm volatile("li t6, 0xC83C");
        asm volatile("sw a6, 60(t6)");
f01005c0:	030fae23          	sw	a6,60(t6)

        //x17   a7 
//        asm volatile("li t6, 0xC840");
        asm volatile("sw a7, 64(t6)");
f01005c4:	051fa023          	sw	a7,64(t6)

        //x18   s2 
//        asm volatile("li t6, 0xC844");
        asm volatile("sw s2, 68(t6)");
f01005c8:	052fa223          	sw	s2,68(t6)

        //x19   s3 
//        asm volatile("li t6, 0xC848");
        asm volatile("sw s3, 72(t6)");
f01005cc:	053fa423          	sw	s3,72(t6)

        //x20   s4 
//        asm volatile("li t6, 0xC84C");
        asm volatile("sw s4, 76(t6)");
f01005d0:	054fa623          	sw	s4,76(t6)

        //x21   s5 
//        asm volatile("li t6, 0xC850");
        asm volatile("sw s5, 80(t6)");
f01005d4:	055fa823          	sw	s5,80(t6)

        //x22   s6 
//        asm volatile("li t6, 0xC854");
        asm volatile("sw s6, 84(t6)");
f01005d8:	056faa23          	sw	s6,84(t6)

        //x23   s7 
//        asm volatile("li t6, 0xC858");
        asm volatile("sw s7, 88(t6)");
f01005dc:	057fac23          	sw	s7,88(t6)

        //x24   s8 
//        asm volatile("li t6, 0xC85C");
        asm volatile("sw s8, 92(t6)");
f01005e0:	058fae23          	sw	s8,92(t6)

        //x25   s9 
//        asm volatile("li t6, 0xC860");
        asm volatile("sw s9, 96(t6)");
f01005e4:	079fa023          	sw	s9,96(t6)

        //x26   s10 
//        asm volatile("li t6, 0xC864");
        asm volatile("sw s10, 100(t6)");
f01005e8:	07afa223          	sw	s10,100(t6)

        //x27   s11 
//        asm volatile("li t6, 0xC868");
        asm volatile("sw s11, 104(t6)");
f01005ec:	07bfa423          	sw	s11,104(t6)

        //x28   t3 
//        asm volatile("li t6, 0xC86C");
        asm volatile("sw t3, 108(t6)");
f01005f0:	07cfa623          	sw	t3,108(t6)

        //x29   t4 
//        asm volatile("li t6, 0xC870");
        asm volatile("sw t4, 112(t6)"); 
f01005f4:	07dfa823          	sw	t4,112(t6)

        //x30   t5  
//        asm volatile("li t6, 0xC874");
        asm volatile("sw t5, 116(t6)"); 
f01005f8:	07efaa23          	sw	t5,116(t6)

        //x31   t6 
//        asm volatile("li t6, 0xC878");
        asm volatile("sw t6, 120(t6)");
f01005fc:	07ffac23          	sw	t6,120(t6)

        //Master Sync Priv Reg
        *(Safe_config_reg+5) = 0x1;
f0100600:	cbd8                	sw	a4,20(a5)
f0100602:	0001                	nop
        asm volatile(".ALIGN(2)");
        //PC Program Counter
        asm volatile("auipc t5, 0");
f0100604:	00000f17          	auipc	t5,0x0
        asm volatile("sw t5, 124(t6)");
f0100608:	07efae23          	sw	t5,124(t6)


        asm volatile("fence");
f010060c:	0ff0000f          	fence
        asm volatile("wfi"); 
f0100610:	10500073          	wfi

        //Reset Values
        *(Safe_config_reg+5) = 0x0;
f0100614:	0007aa23          	sw	zero,20(a5) # f0020014 <_sp+0xfff16ac4>
        *(Priv_Reg+1) = 0x0;
f0100618:	ff0007b7          	lui	a5,0xff000
f010061c:	0007a223          	sw	zero,4(a5) # ff000004 <_sp+0xeef6ab4>
        }
}
f0100620:	8082                	ret
	...

f0100624 <TMR_Safe_Stop>:


void TMR_Safe_Stop(unsigned int master){
volatile unsigned int *Safe_config_reg= SAFE_REG_BASEADDRESS;
        if(*Safe_config_reg == 0x1){
f0100624:	f00207b7          	lui	a5,0xf0020
f0100628:	4398                	lw	a4,0(a5)
f010062a:	4685                	li	a3,1
f010062c:	02d71263          	bne	a4,a3,f0100650 <TMR_Safe_Stop+0x2c>
                if (*(Safe_config_reg+3) ==0x1)
f0100630:	47d4                	lw	a3,12(a5)
f0100632:	00e69463          	bne	a3,a4,f010063a <TMR_Safe_Stop+0x16>
f0100636:	0007a623          	sw	zero,12(a5) # f002000c <_sp+0xfff16abc>
                        TMR_Set_Critical_Section(NONE_CRITICAL_SECTION);
                *(Safe_config_reg+2) = master;
f010063a:	f00207b7          	lui	a5,0xf0020
f010063e:	c788                	sw	a0,8(a5)
                *(Safe_config_reg+1) = 0x0;
f0100640:	0007a223          	sw	zero,4(a5) # f0020004 <_sp+0xfff16ab4>
                *(Safe_config_reg) = 0x0;
f0100644:	0007a023          	sw	zero,0(a5)
                asm volatile("fence");
f0100648:	0ff0000f          	fence
                asm volatile("wfi");
f010064c:	10500073          	wfi
        }
}
f0100650:	8082                	ret
	...

f0100654 <handler_tmr_recoverysync>:

void handler_tmr_recoverysync(void){ 

        asm volatile("addi    sp,sp,-16");
f0100654:	1141                	addi	sp,sp,-16
        asm volatile("sw      a4,12(sp)");
f0100656:	c63a                	sw	a4,12(sp)
        asm volatile("sw      a5,8(sp)");
f0100658:	c43e                	sw	a5,8(sp)
        
        asm volatile ("li a4,1");          //Operate with address INTC ACK
f010065a:	4705                	li	a4,1
        asm volatile ("li a5, %0" : : "i" (PRIVATE_REG_BASEADDRESS));
f010065c:	ff0007b7          	lui	a5,0xff000
        asm volatile ("sw  a4,4(a5)");
f0100660:	c3d8                	sw	a4,4(a5)

        asm volatile("lw      a4,12(sp)");
f0100662:	4732                	lw	a4,12(sp)
        asm volatile("lw      a5,8(sp)");
f0100664:	47a2                	lw	a5,8(sp)
  
        //Push Stack//
    //Register File
        //x1    ra
        asm volatile("sw ra, -4(sp)");
f0100666:	fe112e23          	sw	ra,-4(sp)
        //x2    sp
        asm volatile("sw sp, -8(sp)");
f010066a:	fe212c23          	sw	sp,-8(sp)
        //x3    gp
        asm volatile("sw gp, -12(sp)"); 
f010066e:	fe312a23          	sw	gp,-12(sp)
        //x4    tp
        asm volatile("sw tp, -16(sp)");
f0100672:	fe412823          	sw	tp,-16(sp)
        //x5    t0
        asm volatile("sw t0, -20(sp)");   
f0100676:	fe512623          	sw	t0,-20(sp)
        //x6    t1
        asm volatile("sw t1, -24(sp)");       
f010067a:	fe612423          	sw	t1,-24(sp)
        //x7    t2
        asm volatile("sw t2, -28(sp)");
f010067e:	fe712223          	sw	t2,-28(sp)
        //x8   s0/fp
        asm volatile("sw s0, -32(sp)");
f0100682:	fe812023          	sw	s0,-32(sp)
        //x9    s1
        asm volatile("sw s1, -36(sp)");
f0100686:	fc912e23          	sw	s1,-36(sp)
        //x10   a0 
        asm volatile("sw a0, -40(sp)");
f010068a:	fca12c23          	sw	a0,-40(sp)
        //x11   a1 
        asm volatile("sw a1, -44(sp)");
f010068e:	fcb12a23          	sw	a1,-44(sp)
        //x12   a2 
        asm volatile("sw a2, -48(sp)");
f0100692:	fcc12823          	sw	a2,-48(sp)
        //x13   a3 
        asm volatile("sw a3, -52(sp)");
f0100696:	fcd12623          	sw	a3,-52(sp)
        //x14   a4 
        asm volatile("sw a4, -56(sp)");
f010069a:	fce12423          	sw	a4,-56(sp)
        //x15   a5 
        asm volatile("sw a5, -60(sp)");
f010069e:	fcf12223          	sw	a5,-60(sp)
        //x16   a6 
        asm volatile("sw a6, -64(sp)");
f01006a2:	fd012023          	sw	a6,-64(sp)
        //x17   a7 
        asm volatile("sw a7, -68(sp)");
f01006a6:	fb112e23          	sw	a7,-68(sp)
        //x18   s2 
        asm volatile("sw s2, -72(sp)");
f01006aa:	fb212c23          	sw	s2,-72(sp)
        //x19   s3 
        asm volatile("sw s3, -76(sp)");
f01006ae:	fb312a23          	sw	s3,-76(sp)
        //x20   s4 
        asm volatile("sw s4, -80(sp)");
f01006b2:	fb412823          	sw	s4,-80(sp)
        //x21   s5 
        asm volatile("sw s5, -84(sp)");
f01006b6:	fb512623          	sw	s5,-84(sp)
        //x22   s6 
        asm volatile("sw s6, -88(sp)");
f01006ba:	fb612423          	sw	s6,-88(sp)
        //x23   s7 
        asm volatile("sw s7, -92(sp)");
f01006be:	fb712223          	sw	s7,-92(sp)
        //x24   s8 
        asm volatile("sw s8, -96(sp)");
f01006c2:	fb812023          	sw	s8,-96(sp)
        //x25   s9 
        asm volatile("sw s9, -100(sp)");
f01006c6:	f9912e23          	sw	s9,-100(sp)
        //x26   s10 
        asm volatile("sw s10, -104(sp)");
f01006ca:	f9a12c23          	sw	s10,-104(sp)
        //x27   s11 
        asm volatile("sw s11, -108(sp)");
f01006ce:	f9b12a23          	sw	s11,-108(sp)
        //x28   t3 
        asm volatile("sw t3, -112(sp)");
f01006d2:	f9c12823          	sw	t3,-112(sp)
        //x29   t4 
        asm volatile("sw t4, -116(sp)"); 
f01006d6:	f9d12623          	sw	t4,-116(sp)
        //x30   t5  
        asm volatile("sw t5, -120(sp)"); 
f01006da:	f9e12423          	sw	t5,-120(sp)
        //x31   t6 
        asm volatile("sw t6, -124(sp)");  
f01006de:	f9f12223          	sw	t6,-124(sp)

    //Control & Status Register
        //mstatus   0x300
        asm volatile("csrr t6, mstatus");
f01006e2:	30002ff3          	csrr	t6,mstatus
        asm volatile("sw    t6,-128(sp)");
f01006e6:	f9f12023          	sw	t6,-128(sp)
        //Machine Interrupt Enable
        //mie       0x304
        asm volatile("csrr t6, mie");
f01006ea:	30402ff3          	csrr	t6,mie
        asm volatile("sw    t6,-132(sp)"); 
f01006ee:	f7f12e23          	sw	t6,-132(sp)
        //mtvec     0x305
        asm volatile("csrr t6, mtvec");
f01006f2:	30502ff3          	csrr	t6,mtvec
        asm volatile("sw    t6,-136(sp)");
f01006f6:	f7f12c23          	sw	t6,-136(sp)
        //mepc      0x341
        asm volatile("csrr t6, mepc");
f01006fa:	34102ff3          	csrr	t6,mepc
        asm volatile("sw    t6,-140(sp)"); 
f01006fe:	f7f12a23          	sw	t6,-140(sp)
        //mtval     0x343
        asm volatile("csrr t6, mtval");
f0100702:	34302ff3          	csrr	t6,mtval
        asm volatile("sw    t6,-144(sp)");
f0100706:	f7f12823          	sw	t6,-144(sp)


        //Pop Stack//
    //Control & Status Register
        //mstatus   0x300
        asm volatile("lw    t6,-128(sp)");
f010070a:	f8012f83          	lw	t6,-128(sp)
        asm volatile("csrw mstatus, t6");
f010070e:	300f9073          	csrw	mstatus,t6
        //Machine Interrupt Enable
        //mie       0x304
        asm volatile("lw    t6,-132(sp)"); 
f0100712:	f7c12f83          	lw	t6,-132(sp)
        asm volatile("csrw mie, t6");
f0100716:	304f9073          	csrw	mie,t6
        //mtvec     0x305
        asm volatile("lw    t6,-136(sp)");
f010071a:	f7812f83          	lw	t6,-136(sp)
        asm volatile("csrw mtvec, t6");
f010071e:	305f9073          	csrw	mtvec,t6
        //mepc      0x341
        asm volatile("lw    t6,-140(sp)");
f0100722:	f7412f83          	lw	t6,-140(sp)
        asm volatile("csrw mepc, t6"); 
f0100726:	341f9073          	csrw	mepc,t6
        //mtval     0x343
        asm volatile("lw    t6,-144(sp)");
f010072a:	f7012f83          	lw	t6,-144(sp)
        asm volatile("csrw mtval, t6");  
f010072e:	343f9073          	csrw	mtval,t6


    //Register File
        //x1    ra
        asm volatile("lw ra, -4(sp)");
f0100732:	ffc12083          	lw	ra,-4(sp)
        //x2    sp
        asm volatile("lw sp, -8(sp)");
f0100736:	ff812103          	lw	sp,-8(sp)
        //x3    gp
        asm volatile("lw gp, -12(sp)"); 
f010073a:	ff412183          	lw	gp,-12(sp)
        //x4    tp
        asm volatile("lw tp, -16(sp)");
f010073e:	ff012203          	lw	tp,-16(sp)
        //x5    t0
        asm volatile("lw t0, -20(sp)");   
f0100742:	fec12283          	lw	t0,-20(sp)
        //x6    t1
        asm volatile("lw t1, -24(sp)");       
f0100746:	fe812303          	lw	t1,-24(sp)
        //x7    t2
        asm volatile("lw t2, -28(sp)");
f010074a:	fe412383          	lw	t2,-28(sp)
        //x8   s0/fp
        asm volatile("lw s0, -32(sp)");
f010074e:	fe012403          	lw	s0,-32(sp)
        //x9    s1
        asm volatile("lw s1, -36(sp)");
f0100752:	fdc12483          	lw	s1,-36(sp)
        //x10   a0 
        asm volatile("lw a0, -40(sp)");
f0100756:	fd812503          	lw	a0,-40(sp)
        //x11   a1 
        asm volatile("lw a1, -44(sp)");
f010075a:	fd412583          	lw	a1,-44(sp)
        //x12   a2 
        asm volatile("lw a2, -48(sp)");
f010075e:	fd012603          	lw	a2,-48(sp)
        //x13   a3 
        asm volatile("lw a3, -52(sp)");
f0100762:	fcc12683          	lw	a3,-52(sp)
        //x14   a4 
        asm volatile("lw a4, -56(sp)");
f0100766:	fc812703          	lw	a4,-56(sp)
        //x15   a5 
        asm volatile("lw a5, -60(sp)");
f010076a:	fc412783          	lw	a5,-60(sp)
        //x16   a6 
        asm volatile("lw a6, -64(sp)");
f010076e:	fc012803          	lw	a6,-64(sp)
        //x17   a7 
        asm volatile("lw a7, -68(sp)");
f0100772:	fbc12883          	lw	a7,-68(sp)
        //x18   s2 
        asm volatile("lw s2, -72(sp)");
f0100776:	fb812903          	lw	s2,-72(sp)
        //x19   s3 
        asm volatile("lw s3, -76(sp)");
f010077a:	fb412983          	lw	s3,-76(sp)
        //x20   s4 
        asm volatile("lw s4, -80(sp)");
f010077e:	fb012a03          	lw	s4,-80(sp)
        //x21   s5 
        asm volatile("lw s5, -84(sp)");
f0100782:	fac12a83          	lw	s5,-84(sp)
        //x22   s6 
        asm volatile("lw s6, -88(sp)");
f0100786:	fa812b03          	lw	s6,-88(sp)
        //x23   s7 
        asm volatile("lw s7, -92(sp)");
f010078a:	fa412b83          	lw	s7,-92(sp)
        //x24   s8 
        asm volatile("lw s8, -96(sp)");
f010078e:	fa012c03          	lw	s8,-96(sp)
        //x25   s9 
        asm volatile("lw s9, -100(sp)");
f0100792:	f9c12c83          	lw	s9,-100(sp)
        //x26   s10 
        asm volatile("lw s10, -104(sp)");
f0100796:	f9812d03          	lw	s10,-104(sp)
        //x27   s11 
        asm volatile("lw s11, -108(sp)");
f010079a:	f9412d83          	lw	s11,-108(sp)
        //x28   t3 
        asm volatile("lw t3, -112(sp)");
f010079e:	f9012e03          	lw	t3,-112(sp)
        //x29   t4 
        asm volatile("lw t4, -116(sp)"); 
f01007a2:	f8c12e83          	lw	t4,-116(sp)
        //x30   t5  
        asm volatile("lw t5, -120(sp)"); 
f01007a6:	f8812f03          	lw	t5,-120(sp)
        //x31   t6 
        asm volatile("lw t6, -124(sp)");  
f01007aa:	f8412f83          	lw	t6,-124(sp)

        asm volatile ("li a5, %0" : : "i" (PRIVATE_REG_BASEADDRESS));
f01007ae:	ff0007b7          	lui	a5,0xff000
        asm volatile("sw  zero,4(a5)"); 
f01007b2:	0007a223          	sw	zero,4(a5) # ff000004 <_sp+0xeef6ab4>
        asm volatile("lw  a5,8(sp)");
f01007b6:	47a2                	lw	a5,8(sp)
        asm volatile("addi sp,sp,16");
f01007b8:	0141                	addi	sp,sp,16
}
f01007ba:	30200073          	mret
	...

f01007c0 <handler_safe_fsm>:

void handler_safe_fsm(void) { 
f01007c0:	1141                	addi	sp,sp,-16
f01007c2:	c63a                	sw	a4,12(sp)
f01007c4:	c43e                	sw	a5,8(sp)

  volatile unsigned int *Priv_Reg = PRIVATE_REG_BASEADDRESS;
  *(Priv_Reg+1) = 0x1;
f01007c6:	4705                	li	a4,1
f01007c8:	ff0007b7          	lui	a5,0xff000
f01007cc:	c3d8                	sw	a4,4(a5)
  *(Priv_Reg+1) = 0x0;
f01007ce:	0007a223          	sw	zero,4(a5) # ff000004 <_sp+0xeef6ab4>
}
f01007d2:	4732                	lw	a4,12(sp)
f01007d4:	47a2                	lw	a5,8(sp)
f01007d6:	0141                	addi	sp,sp,16
f01007d8:	30200073          	mret
f01007dc:	0000                	unimp
	...

f01007e0 <handler_tmr_dmcontext_copy>:
void handler_tmr_dmcontext_copy(void){
/*  volatile unsigned int *Priv_Reg = 0xFF000004;
  *Priv_Reg = 0x1;
  *Priv_Reg = 0x0;
*/
        asm volatile ("addi sp,sp,-16");     //Store in stack a4, a5
f01007e0:	1141                	addi	sp,sp,-16
        asm volatile ("sw   a4,12(sp)");
f01007e2:	c63a                	sw	a4,12(sp)
        asm volatile ("sw   a5,8(sp)");
f01007e4:	c43e                	sw	a5,8(sp)
        
        asm volatile ("li a4,1");          //Operate with address
f01007e6:	4705                	li	a4,1
        asm volatile ("li a5, %0" : : "i" (PRIVATE_REG_BASEADDRESS));
f01007e8:	ff0007b7          	lui	a5,0xff000
        asm volatile ("sw  a4,4(a5)");
f01007ec:	c3d8                	sw	a4,4(a5)
        asm volatile ("sw  zero,4(a5)");
f01007ee:	0007a223          	sw	zero,4(a5) # ff000004 <_sp+0xeef6ab4>
                                                //Restore values 
        asm volatile ("lw  a4,12(sp)");
f01007f2:	4732                	lw	a4,12(sp)
        asm volatile ("lw  a5,8(sp)");
f01007f4:	47a2                	lw	a5,8(sp)

    //Control & Status Register
    //Set Base Address
        asm volatile("li   t5,0xF0108000");
f01007f6:	f0108f37          	lui	t5,0xf0108
 //       asm volatile("csrr t6, mstatus");
 //       asm volatile("sw    t6,0(t5)");

    //Machine Interrupt Enable
    //mie       0x304
        asm volatile("csrr t6, mie");
f01007fa:	30402ff3          	csrr	t6,mie
        asm volatile("sw    t6,4(t5)"); 
f01007fe:	01ff2223          	sw	t6,4(t5) # f0108004 <_sp+0xffffeab4>

    //Machine Trap-Vector
    //mtvec     0x305
        asm volatile("csrr t6, mtvec");
f0100802:	30502ff3          	csrr	t6,mtvec
        asm volatile("sw    t6,8(t5)");
f0100806:	01ff2423          	sw	t6,8(t5)

    //Machine Exception Program Counter
    //mepc      0x341
        asm volatile("csrr t6, mepc");
f010080a:	34102ff3          	csrr	t6,mepc
        asm volatile("sw    t6,12(t5)"); 
f010080e:	01ff2623          	sw	t6,12(t5)

        asm volatile("li t6, 0xF0010000");     //PC -> wfi Debug_Boot_ROM
f0100812:	f0010fb7          	lui	t6,0xf0010
        asm volatile("csrw  mepc, t6");
f0100816:	341f9073          	csrw	mepc,t6
    //Machine Trap Value Register
    //mtval     0x343
        asm volatile("csrr t6, mtval");
f010081a:	34302ff3          	csrr	t6,mtval
        asm volatile("sw    t6,16(t5)");
f010081e:	01ff2823          	sw	t6,16(t5)


    //Register File
        //x1    ra
        asm volatile("li t6, 0xF0108100");
f0100822:	f0108fb7          	lui	t6,0xf0108
f0100826:	100f8f93          	addi	t6,t6,256 # f0108100 <_sp+0xffffebb0>
        asm volatile("sw ra, 0(t6)");
f010082a:	001fa023          	sw	ra,0(t6)

        //x2    sp
//        asm volatile("li t6, 0xC804");
        asm volatile("addi    t5,sp,16");
f010082e:	01010f13          	addi	t5,sp,16
        asm volatile("sw      t5,12(t6)");      //Restore de sp before the function
f0100832:	01efa623          	sw	t5,12(t6)

        //x3    gp
//        asm volatile("li t6, 0xC808");
        asm volatile("sw gp, 8(t6)"); 
f0100836:	003fa423          	sw	gp,8(t6)

        //x4    tp
//        asm volatile("li t6, 0xC80C");
        asm volatile("sw tp, 12(t6)");
f010083a:	004fa623          	sw	tp,12(t6)

        //x5    t0
//        asm volatile("li t6, 0xC810");
        asm volatile("sw t0, 16(t6)");   
f010083e:	005fa823          	sw	t0,16(t6)

        //x6    t1
//        asm volatile("li t6, 0xC814");
        asm volatile("sw t1, 20(t6)");       
f0100842:	006faa23          	sw	t1,20(t6)

        //x7    t2
//        asm volatile("li t6, 0xC818");
        asm volatile("sw t2, 24(t6)");
f0100846:	007fac23          	sw	t2,24(t6)

        //x8   s0/fp
//        asm volatile("li t6, 0xC81C");
        asm volatile("sw s0, 28(t6)");
f010084a:	008fae23          	sw	s0,28(t6)

        //x9    s1
//        asm volatile("li t6, 0xC820");
        asm volatile("sw s1, 32(t6)");
f010084e:	029fa023          	sw	s1,32(t6)

        //x10   a0 
//        asm volatile("li t6, 0xC824");
        asm volatile("sw a0, 36(t6)");
f0100852:	02afa223          	sw	a0,36(t6)

        //x11   a1 
//        asm volatile("li t6, 0xC828");
        asm volatile("sw a1, 40(t6)");
f0100856:	02bfa423          	sw	a1,40(t6)

        //x12   a2 
//        asm volatile("li t6, 0xC82C");
        asm volatile("sw a2, 44(t6)");
f010085a:	02cfa623          	sw	a2,44(t6)

        //x13   a3 
//        asm volatile("li t6, 0xC830");
        asm volatile("sw a3, 48(t6)");
f010085e:	02dfa823          	sw	a3,48(t6)


        //x14   a4 
//        asm volatile("li t6, 0xC834");
        asm volatile("sw a4, 52(t6)");
f0100862:	02efaa23          	sw	a4,52(t6)

        //x15   a5 
//        asm volatile("li t6, 0xC838");
        asm volatile("sw a5, 56(t6)");
f0100866:	02ffac23          	sw	a5,56(t6)

        //x16   a6 
//        asm volatile("li t6, 0xC83C");
        asm volatile("sw a6, 60(t6)");
f010086a:	030fae23          	sw	a6,60(t6)

        //x17   a7 
//        asm volatile("li t6, 0xC840");
        asm volatile("sw a7, 64(t6)");
f010086e:	051fa023          	sw	a7,64(t6)

        //x18   s2 
//        asm volatile("li t6, 0xC844");
        asm volatile("sw s2, 68(t6)");
f0100872:	052fa223          	sw	s2,68(t6)

        //x19   s3 
//        asm volatile("li t6, 0xC848");
        asm volatile("sw s3, 72(t6)");
f0100876:	053fa423          	sw	s3,72(t6)

        //x20   s4 
//        asm volatile("li t6, 0xC84C");
        asm volatile("sw s4, 76(t6)");
f010087a:	054fa623          	sw	s4,76(t6)

        //x21   s5 
//        asm volatile("li t6, 0xC850");
        asm volatile("sw s5, 80(t6)");
f010087e:	055fa823          	sw	s5,80(t6)

        //x22   s6 
//        asm volatile("li t6, 0xC854");
        asm volatile("sw s6, 84(t6)");
f0100882:	056faa23          	sw	s6,84(t6)

        //x23   s7 
//        asm volatile("li t6, 0xC858");
        asm volatile("sw s7, 88(t6)");
f0100886:	057fac23          	sw	s7,88(t6)

        //x24   s8 
//        asm volatile("li t6, 0xC85C");
        asm volatile("sw s8, 92(t6)");
f010088a:	058fae23          	sw	s8,92(t6)

        //x25   s9 
//        asm volatile("li t6, 0xC860");
        asm volatile("sw s9, 96(t6)");
f010088e:	079fa023          	sw	s9,96(t6)

        //x26   s10 
//        asm volatile("li t6, 0xC864");
        asm volatile("sw s10, 100(t6)");
f0100892:	07afa223          	sw	s10,100(t6)

        //x27   s11 
//        asm volatile("li t6, 0xC868");
        asm volatile("sw s11, 104(t6)");
f0100896:	07bfa423          	sw	s11,104(t6)

        //x28   t3 
//        asm volatile("li t6, 0xC86C");
        asm volatile("sw t3, 108(t6)");
f010089a:	07cfa623          	sw	t3,108(t6)

        //x29   t4 
//        asm volatile("li t6, 0xC870");
        asm volatile("sw t4, 112(t6)"); 
f010089e:	07dfa823          	sw	t4,112(t6)

        //PC -> 0xDebug_BootAddress + 0x200
        asm volatile("li t5, 0xF0010000"); 
f01008a2:	f0010f37          	lui	t5,0xf0010
        asm volatile("sw t5, 124(t6)");
f01008a6:	07efae23          	sw	t5,124(t6)
        //x30   t5  
//        asm volatile("li t6, 0xC874");
        asm volatile("sw t5, 116(t6)"); 
f01008aa:	07efaa23          	sw	t5,116(t6)

        //x31   t6 
//        asm volatile("li t6, 0xC878");
        asm volatile("sw t6, 120(t6)");
f01008ae:	07ffac23          	sw	t6,120(t6)

        asm volatile("addi      sp,sp,16"); //Restore stack pointer
f01008b2:	0141                	addi	sp,sp,16

}
f01008b4:	30200073          	mret
f01008b8:	0000                	unimp
	...

f01008bc <handler_tmr_dmshsync>:
void handler_tmr_dmshsync(void){
f01008bc:	1141                	addi	sp,sp,-16
f01008be:	c63a                	sw	a4,12(sp)
f01008c0:	c43e                	sw	a5,8(sp)
  volatile unsigned int *Priv_Reg = 0xFF000004;
  *Priv_Reg = 0x1;
f01008c2:	4705                	li	a4,1
f01008c4:	ff0007b7          	lui	a5,0xff000
f01008c8:	c3d8                	sw	a4,4(a5)
  *Priv_Reg = 0x0;
f01008ca:	0007a223          	sw	zero,4(a5) # ff000004 <_sp+0xeef6ab4>

    //Control & Status Register
    //Set Base Address
        asm volatile("li   t5,0xF0108000");
f01008ce:	f0108f37          	lui	t5,0xf0108

    //Machine Exception Program Counter
    //mepc      0x341
        asm volatile("sw t5, -4(sp)");
f01008d2:	ffe12e23          	sw	t5,-4(sp)
        asm volatile("lw t5, 12(t5)");
f01008d6:	00cf2f03          	lw	t5,12(t5) # f010800c <_sp+0xffffeabc>
        asm volatile("csrw mepc, t5"); 
f01008da:	341f1073          	csrw	mepc,t5
        asm volatile("lw t5, -4(sp)");
f01008de:	ffc12f03          	lw	t5,-4(sp)

}
f01008e2:	4732                	lw	a4,12(sp)
f01008e4:	47a2                	lw	a5,8(sp)
f01008e6:	0141                	addi	sp,sp,16
f01008e8:	30200073          	mret
f01008ec:	0000                	unimp
	...

f01008f0 <Check_RF>:

void Check_RF(void){
        asm volatile ("addi sp,sp,-20");     //Store in stack a4, a5
f01008f0:	1131                	addi	sp,sp,-20
        asm volatile ("sw   t4,16(sp)");
f01008f2:	c876                	sw	t4,16(sp)
        asm volatile ("sw   t5,12(sp)");
f01008f4:	c67a                	sw	t5,12(sp)
        asm volatile ("sw   t6,8(sp)");
f01008f6:	c47e                	sw	t6,8(sp)
                                                //Restore values 
        asm volatile ("lw  a4,12(sp)");
f01008f8:	4732                	lw	a4,12(sp)
        asm volatile ("lw  a5,8(sp)");
f01008fa:	47a2                	lw	a5,8(sp)


        asm volatile("li t6, %0" : : "i" (CHECK_RAM_ADDRESS));
f01008fc:	f0109fb7          	lui	t6,0xf0109


    //Register File
        //x1    ra
        asm volatile("sw ra, 0(t6)");
f0100900:	001fa023          	sw	ra,0(t6) # f0109000 <_sp+0xfffffab0>

        //x2    sp
//        asm volatile("li t6, 0xC804");
        asm volatile("addi    t5,sp,20");
f0100904:	01410f13          	addi	t5,sp,20
        asm volatile("sw      t5,12(t6)");      //Restore de sp before the function
f0100908:	01efa623          	sw	t5,12(t6)

        //x3    gp
//        asm volatile("li t6, 0xC808");
        asm volatile("sw gp, 8(t6)"); 
f010090c:	003fa423          	sw	gp,8(t6)

        //x4    tp
//        asm volatile("li t6, 0xC80C");
        asm volatile("sw tp, 12(t6)");
f0100910:	004fa623          	sw	tp,12(t6)

        //x5    t0
//        asm volatile("li t6, 0xC810");
        asm volatile("sw t0, 16(t6)");   
f0100914:	005fa823          	sw	t0,16(t6)

        //x6    t1
//        asm volatile("li t6, 0xC814");
        asm volatile("sw t1, 20(t6)");       
f0100918:	006faa23          	sw	t1,20(t6)

        //x7    t2
//        asm volatile("li t6, 0xC818");
        asm volatile("sw t2, 24(t6)");
f010091c:	007fac23          	sw	t2,24(t6)

        //x8   s0/fp
//        asm volatile("li t6, 0xC81C");
        asm volatile("sw s0, 28(t6)");
f0100920:	008fae23          	sw	s0,28(t6)

        //x9    s1
//        asm volatile("li t6, 0xC820");
        asm volatile("sw s1, 32(t6)");
f0100924:	029fa023          	sw	s1,32(t6)

        //x10   a0 
//        asm volatile("li t6, 0xC824");
        asm volatile("sw a0, 36(t6)");
f0100928:	02afa223          	sw	a0,36(t6)

        //x11   a1 
//        asm volatile("li t6, 0xC828");
        asm volatile("sw a1, 40(t6)");
f010092c:	02bfa423          	sw	a1,40(t6)

        //x12   a2 
//        asm volatile("li t6, 0xC82C");
        asm volatile("sw a2, 44(t6)");
f0100930:	02cfa623          	sw	a2,44(t6)

        //x13   a3 
//        asm volatile("li t6, 0xC830");
        asm volatile("sw a3, 48(t6)");
f0100934:	02dfa823          	sw	a3,48(t6)


        //x14   a4 
//        asm volatile("li t6, 0xC834");
        asm volatile("sw a4, 52(t6)");
f0100938:	02efaa23          	sw	a4,52(t6)

        //x15   a5 
//        asm volatile("li t6, 0xC838");
        asm volatile("sw a5, 56(t6)");
f010093c:	02ffac23          	sw	a5,56(t6)

        //x16   a6 
//        asm volatile("li t6, 0xC83C");
        asm volatile("sw a6, 60(t6)");
f0100940:	030fae23          	sw	a6,60(t6)

        //x17   a7 
//        asm volatile("li t6, 0xC840");
        asm volatile("sw a7, 64(t6)");
f0100944:	051fa023          	sw	a7,64(t6)

        //x18   s2 
//        asm volatile("li t6, 0xC844");
        asm volatile("sw s2, 68(t6)");
f0100948:	052fa223          	sw	s2,68(t6)

        //x19   s3 
//        asm volatile("li t6, 0xC848");
        asm volatile("sw s3, 72(t6)");
f010094c:	053fa423          	sw	s3,72(t6)

        //x20   s4 
//        asm volatile("li t6, 0xC84C");
        asm volatile("sw s4, 76(t6)");
f0100950:	054fa623          	sw	s4,76(t6)

        //x21   s5 
//        asm volatile("li t6, 0xC850");
        asm volatile("sw s5, 80(t6)");
f0100954:	055fa823          	sw	s5,80(t6)

        //x22   s6 
//        asm volatile("li t6, 0xC854");
        asm volatile("sw s6, 84(t6)");
f0100958:	056faa23          	sw	s6,84(t6)

        //x23   s7 
//        asm volatile("li t6, 0xC858");
        asm volatile("sw s7, 88(t6)");
f010095c:	057fac23          	sw	s7,88(t6)

        //x24   s8 
//        asm volatile("li t6, 0xC85C");
        asm volatile("sw s8, 92(t6)");
f0100960:	058fae23          	sw	s8,92(t6)

        //x25   s9 
//        asm volatile("li t6, 0xC860");
        asm volatile("sw s9, 96(t6)");
f0100964:	079fa023          	sw	s9,96(t6)

        //x26   s10 
//        asm volatile("li t6, 0xC864");
        asm volatile("sw s10, 100(t6)");
f0100968:	07afa223          	sw	s10,100(t6)

        //x27   s11 
//        asm volatile("li t6, 0xC868");
        asm volatile("sw s11, 104(t6)");
f010096c:	07bfa423          	sw	s11,104(t6)

        //x28   t3 
//        asm volatile("li t6, 0xC86C");
        asm volatile("sw t3, 108(t6)");
f0100970:	07cfa623          	sw	t3,108(t6)

        //x29   t4 
//        asm volatile("li t6, 0xC870");
        asm volatile("sw t4, 112(t6)"); 
f0100974:	07dfa823          	sw	t4,112(t6)

        //x30   t5  
//        asm volatile("li t6, 0xC874");        
        asm volatile ("lw  t5,12(sp)"); //Restore t5
f0100978:	4f32                	lw	t5,12(sp)
        asm volatile("sw t5, 116(t6)"); 
f010097a:	07efaa23          	sw	t5,116(t6)

        //x31   t6 
//        asm volatile("li t6, 0xC878");
        asm volatile ("lw   t6,8(sp)"); //Restore t6
f010097e:	4fa2                	lw	t6,8(sp)
        asm volatile("li t5, %0" : : "i" (CHECK_RAM_ADDRESS));     //Set address in t5   
f0100980:	f0109f37          	lui	t5,0xf0109
        asm volatile("sw t6, 120(t5)");
f0100984:	07ff2c23          	sw	t6,120(t5) # f0109078 <_sp+0xfffffb28>

        asm volatile ("lw   t5,12(sp)"); //Restore t5
f0100988:	4f32                	lw	t5,12(sp)
        asm volatile("addi      sp,sp,20"); //Restore stack pointer
f010098a:	0151                	addi	sp,sp,20
f010098c:	8082                	ret
	...

f0100990 <handler_irq_external>:
{
f0100990:	7155                	addi	sp,sp,-208
f0100992:	c786                	sw	ra,204(sp)
f0100994:	c596                	sw	t0,200(sp)
f0100996:	c39a                	sw	t1,196(sp)
f0100998:	c19e                	sw	t2,192(sp)
f010099a:	df26                	sw	s1,188(sp)
f010099c:	dd2a                	sw	a0,184(sp)
f010099e:	db2e                	sw	a1,180(sp)
f01009a0:	d932                	sw	a2,176(sp)
f01009a2:	d736                	sw	a3,172(sp)
f01009a4:	d53a                	sw	a4,168(sp)
f01009a6:	d33e                	sw	a5,164(sp)
f01009a8:	d142                	sw	a6,160(sp)
f01009aa:	cf46                	sw	a7,156(sp)
f01009ac:	cd4a                	sw	s2,152(sp)
f01009ae:	cb72                	sw	t3,148(sp)
f01009b0:	c976                	sw	t4,144(sp)
f01009b2:	c77a                	sw	t5,140(sp)
f01009b4:	c57e                	sw	t6,136(sp)
f01009b6:	fe82                	fsw	ft0,124(sp)
f01009b8:	fc86                	fsw	ft1,120(sp)
f01009ba:	fa8a                	fsw	ft2,116(sp)
f01009bc:	f88e                	fsw	ft3,112(sp)
f01009be:	f692                	fsw	ft4,108(sp)
f01009c0:	f496                	fsw	ft5,104(sp)
f01009c2:	f29a                	fsw	ft6,100(sp)
f01009c4:	f09e                	fsw	ft7,96(sp)
f01009c6:	eea2                	fsw	fs0,92(sp)
f01009c8:	eca6                	fsw	fs1,88(sp)
f01009ca:	eaaa                	fsw	fa0,84(sp)
f01009cc:	e8ae                	fsw	fa1,80(sp)
f01009ce:	e6b2                	fsw	fa2,76(sp)
f01009d0:	e4b6                	fsw	fa3,72(sp)
  *claim_data = rv_plic_peri->CC0;
f01009d2:	300004b7          	lui	s1,0x30000
{
f01009d6:	e2ba                	fsw	fa4,68(sp)
  *claim_data = rv_plic_peri->CC0;
f01009d8:	20c4a903          	lw	s2,524(s1) # 3000020c <syscalls.c.1b5c30a8+0x2fff8588>
{
f01009dc:	e0be                	fsw	fa5,64(sp)
f01009de:	fe42                	fsw	fa6,60(sp)
f01009e0:	fc46                	fsw	fa7,56(sp)
f01009e2:	fa4a                	fsw	fs2,52(sp)
f01009e4:	f84e                	fsw	fs3,48(sp)
f01009e6:	f652                	fsw	fs4,44(sp)
f01009e8:	f456                	fsw	fs5,40(sp)
f01009ea:	f25a                	fsw	fs6,36(sp)
f01009ec:	f05e                	fsw	fs7,32(sp)
f01009ee:	ee62                	fsw	fs8,28(sp)
f01009f0:	ec66                	fsw	fs9,24(sp)
f01009f2:	ea6a                	fsw	fs10,20(sp)
f01009f4:	e86e                	fsw	fs11,16(sp)
f01009f6:	e672                	fsw	ft8,12(sp)
f01009f8:	e476                	fsw	ft9,8(sp)
f01009fa:	e27a                	fsw	ft10,4(sp)
f01009fc:	e07e                	fsw	ft11,0(sp)
    handlers[int_id](int_id);
f01009fe:	854a                	mv	a0,s2
f0100a00:	4781                	li	a5,0
f0100a02:	9782                	jalr	a5
}
f0100a04:	40be                	lw	ra,204(sp)
  rv_plic_peri->CC0 = *complete_data;
f0100a06:	2124a623          	sw	s2,524(s1)
}
f0100a0a:	42ae                	lw	t0,200(sp)
f0100a0c:	431e                	lw	t1,196(sp)
f0100a0e:	438e                	lw	t2,192(sp)
f0100a10:	54fa                	lw	s1,188(sp)
f0100a12:	556a                	lw	a0,184(sp)
f0100a14:	55da                	lw	a1,180(sp)
f0100a16:	564a                	lw	a2,176(sp)
f0100a18:	56ba                	lw	a3,172(sp)
f0100a1a:	572a                	lw	a4,168(sp)
f0100a1c:	579a                	lw	a5,164(sp)
f0100a1e:	580a                	lw	a6,160(sp)
f0100a20:	48fa                	lw	a7,156(sp)
f0100a22:	496a                	lw	s2,152(sp)
f0100a24:	4e5a                	lw	t3,148(sp)
f0100a26:	4eca                	lw	t4,144(sp)
f0100a28:	4f3a                	lw	t5,140(sp)
f0100a2a:	4faa                	lw	t6,136(sp)
f0100a2c:	7076                	flw	ft0,124(sp)
f0100a2e:	70e6                	flw	ft1,120(sp)
f0100a30:	7156                	flw	ft2,116(sp)
f0100a32:	71c6                	flw	ft3,112(sp)
f0100a34:	7236                	flw	ft4,108(sp)
f0100a36:	72a6                	flw	ft5,104(sp)
f0100a38:	7316                	flw	ft6,100(sp)
f0100a3a:	7386                	flw	ft7,96(sp)
f0100a3c:	6476                	flw	fs0,92(sp)
f0100a3e:	64e6                	flw	fs1,88(sp)
f0100a40:	6556                	flw	fa0,84(sp)
f0100a42:	65c6                	flw	fa1,80(sp)
f0100a44:	6636                	flw	fa2,76(sp)
f0100a46:	66a6                	flw	fa3,72(sp)
f0100a48:	6716                	flw	fa4,68(sp)
f0100a4a:	6786                	flw	fa5,64(sp)
f0100a4c:	7872                	flw	fa6,60(sp)
f0100a4e:	78e2                	flw	fa7,56(sp)
f0100a50:	7952                	flw	fs2,52(sp)
f0100a52:	79c2                	flw	fs3,48(sp)
f0100a54:	7a32                	flw	fs4,44(sp)
f0100a56:	7aa2                	flw	fs5,40(sp)
f0100a58:	7b12                	flw	fs6,36(sp)
f0100a5a:	7b82                	flw	fs7,32(sp)
f0100a5c:	6c72                	flw	fs8,28(sp)
f0100a5e:	6ce2                	flw	fs9,24(sp)
f0100a60:	6d52                	flw	fs10,20(sp)
f0100a62:	6dc2                	flw	fs11,16(sp)
f0100a64:	6e32                	flw	ft8,12(sp)
f0100a66:	6ea2                	flw	ft9,8(sp)
f0100a68:	6f12                	flw	ft10,4(sp)
f0100a6a:	6f82                	flw	ft11,0(sp)
f0100a6c:	6169                	addi	sp,sp,208
f0100a6e:	30200073          	mret

f0100a72 <fic_irq_dma>:
    dma_cb.intrFlag = 1;
f0100a72:	f01087b7          	lui	a5,0xf0108
f0100a76:	4705                	li	a4,1
f0100a78:	4ae78823          	sb	a4,1200(a5) # f01084b0 <_sp+0xffffef60>
    dma_intr_handler_trans_done();
f0100a7c:	b215                	j	f01003a0 <dma_intr_handler_trans_done>
	...

f0100a80 <handler_exception>:
__attribute__((weak)) void handler_exception(void) {
f0100a80:	7111                	addi	sp,sp,-256
f0100a82:	df86                	sw	ra,252(sp)
f0100a84:	dd96                	sw	t0,248(sp)
f0100a86:	db9a                	sw	t1,244(sp)
f0100a88:	d99e                	sw	t2,240(sp)
f0100a8a:	d7aa                	sw	a0,236(sp)
f0100a8c:	d5ae                	sw	a1,232(sp)
f0100a8e:	d3b2                	sw	a2,228(sp)
f0100a90:	d1b6                	sw	a3,224(sp)
f0100a92:	cfba                	sw	a4,220(sp)
f0100a94:	cdbe                	sw	a5,216(sp)
f0100a96:	cbc2                	sw	a6,212(sp)
f0100a98:	c9c6                	sw	a7,208(sp)
f0100a9a:	c7f2                	sw	t3,204(sp)
f0100a9c:	c5f6                	sw	t4,200(sp)
f0100a9e:	c3fa                	sw	t5,196(sp)
f0100aa0:	c1fe                	sw	t6,192(sp)
f0100aa2:	ff02                	fsw	ft0,188(sp)
f0100aa4:	fd06                	fsw	ft1,184(sp)
f0100aa6:	fb0a                	fsw	ft2,180(sp)
f0100aa8:	f90e                	fsw	ft3,176(sp)
f0100aaa:	f712                	fsw	ft4,172(sp)
f0100aac:	f516                	fsw	ft5,168(sp)
f0100aae:	f31a                	fsw	ft6,164(sp)
f0100ab0:	f11e                	fsw	ft7,160(sp)
f0100ab2:	ef22                	fsw	fs0,156(sp)
f0100ab4:	ed26                	fsw	fs1,152(sp)
f0100ab6:	eb2a                	fsw	fa0,148(sp)
f0100ab8:	e92e                	fsw	fa1,144(sp)
f0100aba:	e732                	fsw	fa2,140(sp)
f0100abc:	e536                	fsw	fa3,136(sp)
f0100abe:	e33a                	fsw	fa4,132(sp)
f0100ac0:	e13e                	fsw	fa5,128(sp)
f0100ac2:	fec2                	fsw	fa6,124(sp)
f0100ac4:	fcc6                	fsw	fa7,120(sp)
f0100ac6:	faca                	fsw	fs2,116(sp)
f0100ac8:	f8ce                	fsw	fs3,112(sp)
f0100aca:	f6d2                	fsw	fs4,108(sp)
f0100acc:	f4d6                	fsw	fs5,104(sp)
f0100ace:	f2da                	fsw	fs6,100(sp)
f0100ad0:	f0de                	fsw	fs7,96(sp)
f0100ad2:	eee2                	fsw	fs8,92(sp)
f0100ad4:	ece6                	fsw	fs9,88(sp)
f0100ad6:	eaea                	fsw	fs10,84(sp)
f0100ad8:	e8ee                	fsw	fs11,80(sp)
f0100ada:	e6f2                	fsw	ft8,76(sp)
f0100adc:	e4f6                	fsw	ft9,72(sp)
f0100ade:	e2fa                	fsw	ft10,68(sp)
f0100ae0:	e0fe                	fsw	ft11,64(sp)
  CSR_READ(CSR_REG_MCAUSE, &mcause);
f0100ae2:	342027f3          	csrr	a5,mcause
  switch (exc_cause) {
f0100ae6:	472d                	li	a4,11
  exc_cause = (exc_id_t)(mcause & kIdMax);
f0100ae8:	8bfd                	andi	a5,a5,31
  switch (exc_cause) {
f0100aea:	04f76463          	bltu	a4,a5,f0100b32 <handler_exception+0xb2>
f0100aee:	f0108737          	lui	a4,0xf0108
f0100af2:	078a                	slli	a5,a5,0x2
f0100af4:	1d870713          	addi	a4,a4,472 # f01081d8 <_sp+0xffffec88>
f0100af8:	97ba                	add	a5,a5,a4
f0100afa:	439c                	lw	a5,0(a5)
f0100afc:	8782                	jr	a5
      handler_instr_acc_fault();
f0100afe:	3afd                	jal	f01004fc <handler_instr_acc_fault>
  const char fault_msg[] =
f0100b00:	f01085b7          	lui	a1,0xf0108
f0100b04:	03c00613          	li	a2,60
f0100b08:	16058593          	addi	a1,a1,352 # f0108160 <_sp+0xffffec10>
  const char exc_msg[] =
f0100b0c:	0048                	addi	a0,sp,4
f0100b0e:	10a010ef          	jal	ra,f0101c18 <memcpy>
  print_exc_msg(exc_msg);
f0100b12:	0048                	addi	a0,sp,4
f0100b14:	32d1                	jal	f01004d8 <print_exc_msg>
  const char exc_msg[] =
f0100b16:	f01085b7          	lui	a1,0xf0108
f0100b1a:	03900613          	li	a2,57
f0100b1e:	19c58593          	addi	a1,a1,412 # f010819c <_sp+0xffffec4c>
f0100b22:	b7ed                	j	f0100b0c <handler_exception+0x8c>
      handler_lsu_fault();
f0100b24:	3acd                	jal	f0100516 <handler_lsu_fault>
}

__attribute__((weak)) void handler_ecall(void) {
  printf("Environment call encountered\n");
f0100b26:	f0108537          	lui	a0,0xf0108
f0100b2a:	14050513          	addi	a0,a0,320 # f0108140 <_sp+0xffffebf0>
f0100b2e:	2e49                	jal	f0100ec0 <puts>
  while (1) {
f0100b30:	a001                	j	f0100b30 <handler_exception+0xb0>
      while (1) {
f0100b32:	a001                	j	f0100b32 <handler_exception+0xb2>
f0100b34:	0000                	unimp
	...

f0100b38 <handler_irq_software>:
__attribute__((weak)) void handler_irq_software(void) {
f0100b38:	7131                	addi	sp,sp,-192
f0100b3a:	d72a                	sw	a0,172(sp)
  printf("Software IRQ triggered!\n");
f0100b3c:	f0108537          	lui	a0,0xf0108
__attribute__((weak)) void handler_irq_software(void) {
f0100b40:	df06                	sw	ra,188(sp)
f0100b42:	dd16                	sw	t0,184(sp)
f0100b44:	db1a                	sw	t1,180(sp)
f0100b46:	d91e                	sw	t2,176(sp)
f0100b48:	d52e                	sw	a1,168(sp)
f0100b4a:	d332                	sw	a2,164(sp)
f0100b4c:	d136                	sw	a3,160(sp)
f0100b4e:	cf3a                	sw	a4,156(sp)
f0100b50:	cd3e                	sw	a5,152(sp)
f0100b52:	cb42                	sw	a6,148(sp)
f0100b54:	c946                	sw	a7,144(sp)
f0100b56:	c772                	sw	t3,140(sp)
f0100b58:	c576                	sw	t4,136(sp)
f0100b5a:	c37a                	sw	t5,132(sp)
f0100b5c:	c17e                	sw	t6,128(sp)
f0100b5e:	fe82                	fsw	ft0,124(sp)
f0100b60:	fc86                	fsw	ft1,120(sp)
f0100b62:	fa8a                	fsw	ft2,116(sp)
f0100b64:	f88e                	fsw	ft3,112(sp)
f0100b66:	f692                	fsw	ft4,108(sp)
f0100b68:	f496                	fsw	ft5,104(sp)
f0100b6a:	f29a                	fsw	ft6,100(sp)
f0100b6c:	f09e                	fsw	ft7,96(sp)
f0100b6e:	eea2                	fsw	fs0,92(sp)
f0100b70:	eca6                	fsw	fs1,88(sp)
f0100b72:	eaaa                	fsw	fa0,84(sp)
f0100b74:	e8ae                	fsw	fa1,80(sp)
f0100b76:	e6b2                	fsw	fa2,76(sp)
f0100b78:	e4b6                	fsw	fa3,72(sp)
f0100b7a:	e2ba                	fsw	fa4,68(sp)
f0100b7c:	e0be                	fsw	fa5,64(sp)
  printf("Software IRQ triggered!\n");
f0100b7e:	20850513          	addi	a0,a0,520 # f0108208 <_sp+0xffffecb8>
__attribute__((weak)) void handler_irq_software(void) {
f0100b82:	fe42                	fsw	fa6,60(sp)
f0100b84:	fc46                	fsw	fa7,56(sp)
f0100b86:	fa4a                	fsw	fs2,52(sp)
f0100b88:	f84e                	fsw	fs3,48(sp)
f0100b8a:	f652                	fsw	fs4,44(sp)
f0100b8c:	f456                	fsw	fs5,40(sp)
f0100b8e:	f25a                	fsw	fs6,36(sp)
f0100b90:	f05e                	fsw	fs7,32(sp)
f0100b92:	ee62                	fsw	fs8,28(sp)
f0100b94:	ec66                	fsw	fs9,24(sp)
f0100b96:	ea6a                	fsw	fs10,20(sp)
f0100b98:	e86e                	fsw	fs11,16(sp)
f0100b9a:	e672                	fsw	ft8,12(sp)
f0100b9c:	e476                	fsw	ft9,8(sp)
f0100b9e:	e27a                	fsw	ft10,4(sp)
f0100ba0:	e07e                	fsw	ft11,0(sp)
  printf("Software IRQ triggered!\n");
f0100ba2:	2e39                	jal	f0100ec0 <puts>
  while (1) {
f0100ba4:	a001                	j	f0100ba4 <handler_irq_software+0x6c>
	...

f0100ba8 <handler_irq_timer>:
__attribute__((weak)) void handler_irq_timer(void) {
f0100ba8:	7131                	addi	sp,sp,-192
f0100baa:	d72a                	sw	a0,172(sp)
  printf("Timer IRQ triggered!\n");
f0100bac:	f0108537          	lui	a0,0xf0108
__attribute__((weak)) void handler_irq_timer(void) {
f0100bb0:	df06                	sw	ra,188(sp)
f0100bb2:	dd16                	sw	t0,184(sp)
f0100bb4:	db1a                	sw	t1,180(sp)
f0100bb6:	d91e                	sw	t2,176(sp)
f0100bb8:	d52e                	sw	a1,168(sp)
f0100bba:	d332                	sw	a2,164(sp)
f0100bbc:	d136                	sw	a3,160(sp)
f0100bbe:	cf3a                	sw	a4,156(sp)
f0100bc0:	cd3e                	sw	a5,152(sp)
f0100bc2:	cb42                	sw	a6,148(sp)
f0100bc4:	c946                	sw	a7,144(sp)
f0100bc6:	c772                	sw	t3,140(sp)
f0100bc8:	c576                	sw	t4,136(sp)
f0100bca:	c37a                	sw	t5,132(sp)
f0100bcc:	c17e                	sw	t6,128(sp)
f0100bce:	fe82                	fsw	ft0,124(sp)
f0100bd0:	fc86                	fsw	ft1,120(sp)
f0100bd2:	fa8a                	fsw	ft2,116(sp)
f0100bd4:	f88e                	fsw	ft3,112(sp)
f0100bd6:	f692                	fsw	ft4,108(sp)
f0100bd8:	f496                	fsw	ft5,104(sp)
f0100bda:	f29a                	fsw	ft6,100(sp)
f0100bdc:	f09e                	fsw	ft7,96(sp)
f0100bde:	eea2                	fsw	fs0,92(sp)
f0100be0:	eca6                	fsw	fs1,88(sp)
f0100be2:	eaaa                	fsw	fa0,84(sp)
f0100be4:	e8ae                	fsw	fa1,80(sp)
f0100be6:	e6b2                	fsw	fa2,76(sp)
f0100be8:	e4b6                	fsw	fa3,72(sp)
f0100bea:	e2ba                	fsw	fa4,68(sp)
f0100bec:	e0be                	fsw	fa5,64(sp)
  printf("Timer IRQ triggered!\n");
f0100bee:	22050513          	addi	a0,a0,544 # f0108220 <_sp+0xffffecd0>
__attribute__((weak)) void handler_irq_timer(void) {
f0100bf2:	fe42                	fsw	fa6,60(sp)
f0100bf4:	fc46                	fsw	fa7,56(sp)
f0100bf6:	fa4a                	fsw	fs2,52(sp)
f0100bf8:	f84e                	fsw	fs3,48(sp)
f0100bfa:	f652                	fsw	fs4,44(sp)
f0100bfc:	f456                	fsw	fs5,40(sp)
f0100bfe:	f25a                	fsw	fs6,36(sp)
f0100c00:	f05e                	fsw	fs7,32(sp)
f0100c02:	ee62                	fsw	fs8,28(sp)
f0100c04:	ec66                	fsw	fs9,24(sp)
f0100c06:	ea6a                	fsw	fs10,20(sp)
f0100c08:	e86e                	fsw	fs11,16(sp)
f0100c0a:	e672                	fsw	ft8,12(sp)
f0100c0c:	e476                	fsw	ft9,8(sp)
f0100c0e:	e27a                	fsw	ft10,4(sp)
f0100c10:	e07e                	fsw	ft11,0(sp)
  printf("Timer IRQ triggered!\n");
f0100c12:	247d                	jal	f0100ec0 <puts>
  while (1) {
f0100c14:	a001                	j	f0100c14 <handler_irq_timer+0x6c>
	...

f0100c18 <init>:
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
int init()
{
    return 0;
f0100c18:	4501                	li	a0,0
f0100c1a:	8082                	ret

f0100c1c <_close>:
}

int _close(int file)
{
    return -1;
}
f0100c1c:	557d                	li	a0,-1
f0100c1e:	8082                	ret

f0100c20 <_exit>:
 * @param offset the offset to write at, in bytes.
 * @param value the value to write.
 */
inline void mmio_region_write32(mmio_region_t base, ptrdiff_t offset,
                                uint32_t value) {
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
f0100c20:	200007b7          	lui	a5,0x20000
f0100c24:	c3c8                	sw	a0,4(a5)
  ((volatile uint8_t *)base.base)[offset / sizeof(uint8_t)] = value;
f0100c26:	4705                	li	a4,1
f0100c28:	00e78023          	sb	a4,0(a5) # 20000000 <syscalls.c.1b5c30a8+0x1fff837c>
    soc_ctrl_t soc_ctrl;
    soc_ctrl.base_addr = mmio_region_from_addr((uintptr_t)SOC_CTRL_START_ADDRESS);
    soc_ctrl_set_exit_value(&soc_ctrl, exit_status);
    soc_ctrl_set_valid(&soc_ctrl, (uint8_t)1);

    asm volatile("wfi");
f0100c2c:	10500073          	wfi

f0100c30 <_fstat>:
    return -1;
}

int _fstat(int file, struct stat *st)
{
    st->st_mode = S_IFCHR;
f0100c30:	6789                	lui	a5,0x2
f0100c32:	c1dc                	sw	a5,4(a1)
    return 0;
    // errno = -ENOSYS;
    // return -1;
}
f0100c34:	4501                	li	a0,0
f0100c36:	8082                	ret

f0100c38 <_isatty>:
    return -1;
}

int _isatty(int file)
{
    return (file == STDOUT_FILENO);
f0100c38:	157d                	addi	a0,a0,-1
}
f0100c3a:	00153513          	seqz	a0,a0
f0100c3e:	8082                	ret

f0100c40 <_lseek>:
}

off_t _lseek(int file, off_t ptr, int dir)
{
    return 0;
}
f0100c40:	4501                	li	a0,0
f0100c42:	8082                	ret

f0100c44 <_read>:
}

ssize_t _read(int file, void *ptr, size_t len)
{
    return 0;
}
f0100c44:	4501                	li	a0,0
f0100c46:	8082                	ret

f0100c48 <_write>:
    return -1;
}

ssize_t _write(int file, const void *ptr, size_t len)
{
    if (file != STDOUT_FILENO) {
f0100c48:	4785                	li	a5,1
f0100c4a:	02f50663          	beq	a0,a5,f0100c76 <_write+0x2e>
        errno = ENOSYS;
f0100c4e:	f01087b7          	lui	a5,0xf0108
f0100c52:	05800713          	li	a4,88
f0100c56:	48e7ae23          	sw	a4,1180(a5) # f010849c <_sp+0xffffef4c>
        return -1;
f0100c5a:	557d                	li	a0,-1
        return -1;
    }

    return uart_write(&uart,(uint8_t *)ptr,len);

}
f0100c5c:	8082                	ret
        errno = ENOSYS;
f0100c5e:	f01087b7          	lui	a5,0xf0108
f0100c62:	05800713          	li	a4,88
f0100c66:	48e7ae23          	sw	a4,1180(a5) # f010849c <_sp+0xffffef4c>
        return -1;
f0100c6a:	557d                	li	a0,-1
}
f0100c6c:	40b2                	lw	ra,12(sp)
f0100c6e:	44a2                	lw	s1,8(sp)
f0100c70:	4912                	lw	s2,4(sp)
f0100c72:	0141                	addi	sp,sp,16
f0100c74:	8082                	ret
{
f0100c76:	1141                	addi	sp,sp,-16
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
f0100c78:	200007b7          	lui	a5,0x20000
f0100c7c:	c426                	sw	s1,8(sp)
f0100c7e:	84b2                	mv	s1,a2
f0100c80:	4fd0                	lw	a2,28(a5)
f0100c82:	c606                	sw	ra,12(sp)
f0100c84:	c24a                	sw	s2,4(sp)
system_error_t uart_init(const uart_t *uart) {
  if (uart == NULL) {
    return kErrorUartInvalidArgument;
  }

  if (uart->baudrate == 0 || uart->clk_freq_hz == 0) {
f0100c86:	de61                	beqz	a2,f0100c5e <_write+0x16>
f0100c88:	892e                	mv	s2,a1
  }

  // Calculation formula: NCO = 16 * 2^nco_width * baud / fclk.
  // NCO creates 16x of baudrate. So, in addition to the nco_width,
  // 2^4 should be multiplied.
  uint64_t nco =
f0100c8a:	4681                	li	a3,0
f0100c8c:	80000537          	lui	a0,0x80000
f0100c90:	03e00593          	li	a1,62
f0100c94:	5fb010ef          	jal	ra,f0102a8e <__udivdi3>
      ((uint64_t)uart->baudrate << (NCO_WIDTH + 4)) / uart->clk_freq_hz;
  uint32_t nco_masked = nco & UART_CTRL_NCO_MASK;
f0100c98:	01051793          	slli	a5,a0,0x10
f0100c9c:	83c1                	srli	a5,a5,0x10

  // Requested baudrate is too high for the given clock frequency.
  if (nco != nco_masked) {
f0100c9e:	fca790e3          	bne	a5,a0,f0100c5e <_write+0x16>
f0100ca2:	fdd5                	bnez	a1,f0100c5e <_write+0x16>
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
f0100ca4:	200b0737          	lui	a4,0x200b0
f0100ca8:	00072623          	sw	zero,12(a4) # 200b000c <syscalls.c.1b5c30a8+0x200a8388>
f0100cac:	478d                	li	a5,3
f0100cae:	cf5c                	sw	a5,28(a4)
f0100cb0:	02072223          	sw	zero,36(a4)
f0100cb4:	02072623          	sw	zero,44(a4)
f0100cb8:	00072223          	sw	zero,4(a4)
f0100cbc:	57fd                	li	a5,-1
f0100cbe:	c31c                	sw	a5,0(a4)
BITFIELD_WARN_UNUSED_RESULT
inline uint32_t bitfield_field32_write(uint32_t bitfield,
                                       bitfield_field32_t field,
                                       uint32_t value) {
  bitfield &= ~(field.mask << field.index);
  bitfield |= (value & field.mask) << field.index;
f0100cc0:	01051793          	slli	a5,a0,0x10
f0100cc4:	0037e793          	ori	a5,a5,3
f0100cc8:	c75c                	sw	a5,12(a4)
f0100cca:	00072223          	sw	zero,4(a4)
  reg = bitfield_bit32_write(reg, UART_CTRL_RX_BIT, true);
  mmio_region_write32(uart->base_addr, UART_CTRL_REG_OFFSET, reg);

  // Disable interrupts.
  mmio_region_write32(uart->base_addr, UART_INTR_ENABLE_REG_OFFSET, 0u);
  return kErrorOk;
f0100cce:	009906b3          	add	a3,s2,s1
/**
 * Write `len` bytes to the UART TX FIFO.
 */
size_t uart_write(const uart_t *uart, const uint8_t *data, size_t len) {
  size_t total = len;
  while (len) {
f0100cd2:	01269463          	bne	a3,s2,f0100cda <_write+0x92>
    return uart_write(&uart,(uint8_t *)ptr,len);
f0100cd6:	8526                	mv	a0,s1
f0100cd8:	bf51                	j	f0100c6c <_write+0x24>
    uart_putchar(uart, *data);
f0100cda:	00094603          	lbu	a2,0(s2)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
f0100cde:	4b1c                	lw	a5,16(a4)
  while (uart_tx_full(uart)) {
f0100ce0:	8b85                	andi	a5,a5,1
f0100ce2:	fff5                	bnez	a5,f0100cde <_write+0x96>
  ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)] = value;
f0100ce4:	cf10                	sw	a2,24(a4)
  return ((volatile uint32_t *)base.base)[offset / sizeof(uint32_t)];
f0100ce6:	4b1c                	lw	a5,16(a4)
  return (bitfield >> field.index) & field.mask;
f0100ce8:	838d                	srli	a5,a5,0x3
  while (!uart_tx_idle(uart)) {
f0100cea:	8b85                	andi	a5,a5,1
f0100cec:	dfed                	beqz	a5,f0100ce6 <_write+0x9e>
    data++;
f0100cee:	0905                	addi	s2,s2,1
    len--;
f0100cf0:	b7cd                	j	f0100cd2 <_write+0x8a>

f0100cf2 <_sbrk>:
    return 0;
}

void *_sbrk(ptrdiff_t incr)
{
    char *old_brk = brk;
f0100cf2:	f01087b7          	lui	a5,0xf0108

    if (__heap_start == __heap_end) {
f0100cf6:	f01086b7          	lui	a3,0xf0108
f0100cfa:	f0109737          	lui	a4,0xf0109
    char *old_brk = brk;
f0100cfe:	49078793          	addi	a5,a5,1168 # f0108490 <_sp+0xffffef40>
    if (__heap_start == __heap_end) {
f0100d02:	54468693          	addi	a3,a3,1348 # f0108544 <_sp+0xffffeff4>
f0100d06:	d4470713          	addi	a4,a4,-700 # f0108d44 <_sp+0xfffff7f4>
{
f0100d0a:	862a                	mv	a2,a0
    char *old_brk = brk;
f0100d0c:	4388                	lw	a0,0(a5)
    if (__heap_start == __heap_end) {
f0100d0e:	00e68b63          	beq	a3,a4,f0100d24 <_sbrk+0x32>
        return NULL;
    }

    if ((brk += incr) < __heap_end) {
f0100d12:	00c506b3          	add	a3,a0,a2
f0100d16:	00e6f563          	bgeu	a3,a4,f0100d20 <_sbrk+0x2e>
        brk += incr;
f0100d1a:	96b2                	add	a3,a3,a2
f0100d1c:	c394                	sw	a3,0(a5)
f0100d1e:	8082                	ret
    } else {
        brk = __heap_end;
f0100d20:	c398                	sw	a4,0(a5)
f0100d22:	8082                	ret
        return NULL;
f0100d24:	4501                	li	a0,0
    }
    return old_brk;
}
f0100d26:	8082                	ret

f0100d28 <atexit>:
f0100d28:	85aa                	mv	a1,a0
f0100d2a:	4681                	li	a3,0
f0100d2c:	4601                	li	a2,0
f0100d2e:	4501                	li	a0,0
f0100d30:	a985                	j	f01011a0 <__register_exitproc>

f0100d32 <__libc_fini_array>:
f0100d32:	1141                	addi	sp,sp,-16
f0100d34:	f01087b7          	lui	a5,0xf0108
f0100d38:	c422                	sw	s0,8(sp)
f0100d3a:	f0108437          	lui	s0,0xf0108
f0100d3e:	42c78713          	addi	a4,a5,1068 # f010842c <_sp+0xffffeedc>
f0100d42:	42c40413          	addi	s0,s0,1068 # f010842c <_sp+0xffffeedc>
f0100d46:	8c19                	sub	s0,s0,a4
f0100d48:	c226                	sw	s1,4(sp)
f0100d4a:	c606                	sw	ra,12(sp)
f0100d4c:	8409                	srai	s0,s0,0x2
f0100d4e:	42c78493          	addi	s1,a5,1068
f0100d52:	e411                	bnez	s0,f0100d5e <__libc_fini_array+0x2c>
f0100d54:	40b2                	lw	ra,12(sp)
f0100d56:	4422                	lw	s0,8(sp)
f0100d58:	4492                	lw	s1,4(sp)
f0100d5a:	0141                	addi	sp,sp,16
f0100d5c:	8082                	ret
f0100d5e:	147d                	addi	s0,s0,-1
f0100d60:	00241793          	slli	a5,s0,0x2
f0100d64:	97a6                	add	a5,a5,s1
f0100d66:	439c                	lw	a5,0(a5)
f0100d68:	9782                	jalr	a5
f0100d6a:	b7e5                	j	f0100d52 <__libc_fini_array+0x20>

f0100d6c <__libc_init_array>:
f0100d6c:	1141                	addi	sp,sp,-16
f0100d6e:	c422                	sw	s0,8(sp)
f0100d70:	c226                	sw	s1,4(sp)
f0100d72:	f0108437          	lui	s0,0xf0108
f0100d76:	f01084b7          	lui	s1,0xf0108
f0100d7a:	42c48793          	addi	a5,s1,1068 # f010842c <_sp+0xffffeedc>
f0100d7e:	42c40413          	addi	s0,s0,1068 # f010842c <_sp+0xffffeedc>
f0100d82:	8c1d                	sub	s0,s0,a5
f0100d84:	c04a                	sw	s2,0(sp)
f0100d86:	c606                	sw	ra,12(sp)
f0100d88:	8409                	srai	s0,s0,0x2
f0100d8a:	42c48493          	addi	s1,s1,1068
f0100d8e:	4901                	li	s2,0
f0100d90:	02891763          	bne	s2,s0,f0100dbe <__libc_init_array+0x52>
f0100d94:	f01084b7          	lui	s1,0xf0108
f0100d98:	f0108437          	lui	s0,0xf0108
f0100d9c:	42c48793          	addi	a5,s1,1068 # f010842c <_sp+0xffffeedc>
f0100da0:	42c40413          	addi	s0,s0,1068 # f010842c <_sp+0xffffeedc>
f0100da4:	8c1d                	sub	s0,s0,a5
f0100da6:	8409                	srai	s0,s0,0x2
f0100da8:	42c48493          	addi	s1,s1,1068
f0100dac:	4901                	li	s2,0
f0100dae:	00891d63          	bne	s2,s0,f0100dc8 <__libc_init_array+0x5c>
f0100db2:	40b2                	lw	ra,12(sp)
f0100db4:	4422                	lw	s0,8(sp)
f0100db6:	4492                	lw	s1,4(sp)
f0100db8:	4902                	lw	s2,0(sp)
f0100dba:	0141                	addi	sp,sp,16
f0100dbc:	8082                	ret
f0100dbe:	409c                	lw	a5,0(s1)
f0100dc0:	0905                	addi	s2,s2,1
f0100dc2:	0491                	addi	s1,s1,4
f0100dc4:	9782                	jalr	a5
f0100dc6:	b7e9                	j	f0100d90 <__libc_init_array+0x24>
f0100dc8:	409c                	lw	a5,0(s1)
f0100dca:	0905                	addi	s2,s2,1
f0100dcc:	0491                	addi	s1,s1,4
f0100dce:	9782                	jalr	a5
f0100dd0:	bff9                	j	f0100dae <__libc_init_array+0x42>

f0100dd2 <memset>:
f0100dd2:	832a                	mv	t1,a0
f0100dd4:	c611                	beqz	a2,f0100de0 <memset+0xe>
f0100dd6:	00b30023          	sb	a1,0(t1)
f0100dda:	167d                	addi	a2,a2,-1
f0100ddc:	0305                	addi	t1,t1,1
f0100dde:	fe65                	bnez	a2,f0100dd6 <memset+0x4>
f0100de0:	8082                	ret

f0100de2 <_puts_r>:
f0100de2:	1101                	addi	sp,sp,-32
f0100de4:	ca26                	sw	s1,20(sp)
f0100de6:	c84a                	sw	s2,16(sp)
f0100de8:	ce06                	sw	ra,28(sp)
f0100dea:	cc22                	sw	s0,24(sp)
f0100dec:	c64e                	sw	s3,12(sp)
f0100dee:	c452                	sw	s4,8(sp)
f0100df0:	84aa                	mv	s1,a0
f0100df2:	892e                	mv	s2,a1
f0100df4:	c509                	beqz	a0,f0100dfe <_puts_r+0x1c>
f0100df6:	4d1c                	lw	a5,24(a0)
f0100df8:	e399                	bnez	a5,f0100dfe <_puts_r+0x1c>
f0100dfa:	788000ef          	jal	ra,f0101582 <__sinit>
f0100dfe:	4c9c                	lw	a5,24(s1)
f0100e00:	4480                	lw	s0,8(s1)
f0100e02:	e781                	bnez	a5,f0100e0a <_puts_r+0x28>
f0100e04:	8526                	mv	a0,s1
f0100e06:	77c000ef          	jal	ra,f0101582 <__sinit>
f0100e0a:	f01087b7          	lui	a5,0xf0108
f0100e0e:	25878793          	addi	a5,a5,600 # f0108258 <_sp+0xffffed08>
f0100e12:	02f41c63          	bne	s0,a5,f0100e4a <_puts_r+0x68>
f0100e16:	40c0                	lw	s0,4(s1)
f0100e18:	00c45783          	lhu	a5,12(s0)
f0100e1c:	8ba1                	andi	a5,a5,8
f0100e1e:	c7b1                	beqz	a5,f0100e6a <_puts_r+0x88>
f0100e20:	481c                	lw	a5,16(s0)
f0100e22:	c7a1                	beqz	a5,f0100e6a <_puts_r+0x88>
f0100e24:	59fd                	li	s3,-1
f0100e26:	4a29                	li	s4,10
f0100e28:	441c                	lw	a5,8(s0)
f0100e2a:	00094583          	lbu	a1,0(s2)
f0100e2e:	17fd                	addi	a5,a5,-1
f0100e30:	e9b1                	bnez	a1,f0100e84 <_puts_r+0xa2>
f0100e32:	c41c                	sw	a5,8(s0)
f0100e34:	0607de63          	bgez	a5,f0100eb0 <_puts_r+0xce>
f0100e38:	8622                	mv	a2,s0
f0100e3a:	45a9                	li	a1,10
f0100e3c:	8526                	mv	a0,s1
f0100e3e:	2261                	jal	f0100fc6 <__swbuf_r>
f0100e40:	57fd                	li	a5,-1
f0100e42:	02f50863          	beq	a0,a5,f0100e72 <_puts_r+0x90>
f0100e46:	4529                	li	a0,10
f0100e48:	a035                	j	f0100e74 <_puts_r+0x92>
f0100e4a:	f01087b7          	lui	a5,0xf0108
f0100e4e:	27878793          	addi	a5,a5,632 # f0108278 <_sp+0xffffed28>
f0100e52:	00f41463          	bne	s0,a5,f0100e5a <_puts_r+0x78>
f0100e56:	4480                	lw	s0,8(s1)
f0100e58:	b7c1                	j	f0100e18 <_puts_r+0x36>
f0100e5a:	f01087b7          	lui	a5,0xf0108
f0100e5e:	23878793          	addi	a5,a5,568 # f0108238 <_sp+0xffffece8>
f0100e62:	faf41be3          	bne	s0,a5,f0100e18 <_puts_r+0x36>
f0100e66:	44c0                	lw	s0,12(s1)
f0100e68:	bf45                	j	f0100e18 <_puts_r+0x36>
f0100e6a:	85a2                	mv	a1,s0
f0100e6c:	8526                	mv	a0,s1
f0100e6e:	241d                	jal	f0101094 <__swsetup_r>
f0100e70:	d955                	beqz	a0,f0100e24 <_puts_r+0x42>
f0100e72:	557d                	li	a0,-1
f0100e74:	40f2                	lw	ra,28(sp)
f0100e76:	4462                	lw	s0,24(sp)
f0100e78:	44d2                	lw	s1,20(sp)
f0100e7a:	4942                	lw	s2,16(sp)
f0100e7c:	49b2                	lw	s3,12(sp)
f0100e7e:	4a22                	lw	s4,8(sp)
f0100e80:	6105                	addi	sp,sp,32
f0100e82:	8082                	ret
f0100e84:	c41c                	sw	a5,8(s0)
f0100e86:	0905                	addi	s2,s2,1
f0100e88:	0007d763          	bgez	a5,f0100e96 <_puts_r+0xb4>
f0100e8c:	4c18                	lw	a4,24(s0)
f0100e8e:	00e7cb63          	blt	a5,a4,f0100ea4 <_puts_r+0xc2>
f0100e92:	01458963          	beq	a1,s4,f0100ea4 <_puts_r+0xc2>
f0100e96:	401c                	lw	a5,0(s0)
f0100e98:	00178713          	addi	a4,a5,1
f0100e9c:	c018                	sw	a4,0(s0)
f0100e9e:	00b78023          	sb	a1,0(a5)
f0100ea2:	b759                	j	f0100e28 <_puts_r+0x46>
f0100ea4:	8622                	mv	a2,s0
f0100ea6:	8526                	mv	a0,s1
f0100ea8:	2a39                	jal	f0100fc6 <__swbuf_r>
f0100eaa:	f7351fe3          	bne	a0,s3,f0100e28 <_puts_r+0x46>
f0100eae:	b7d1                	j	f0100e72 <_puts_r+0x90>
f0100eb0:	401c                	lw	a5,0(s0)
f0100eb2:	00178713          	addi	a4,a5,1
f0100eb6:	c018                	sw	a4,0(s0)
f0100eb8:	4729                	li	a4,10
f0100eba:	00e78023          	sb	a4,0(a5)
f0100ebe:	b761                	j	f0100e46 <_puts_r+0x64>

f0100ec0 <puts>:
f0100ec0:	f01087b7          	lui	a5,0xf0108
f0100ec4:	85aa                	mv	a1,a0
f0100ec6:	4947a503          	lw	a0,1172(a5) # f0108494 <_sp+0xffffef44>
f0100eca:	bf21                	j	f0100de2 <_puts_r>

f0100ecc <cleanup_glue>:
f0100ecc:	1141                	addi	sp,sp,-16
f0100ece:	c422                	sw	s0,8(sp)
f0100ed0:	842e                	mv	s0,a1
f0100ed2:	418c                	lw	a1,0(a1)
f0100ed4:	c226                	sw	s1,4(sp)
f0100ed6:	c606                	sw	ra,12(sp)
f0100ed8:	84aa                	mv	s1,a0
f0100eda:	c191                	beqz	a1,f0100ede <cleanup_glue+0x12>
f0100edc:	3fc5                	jal	f0100ecc <cleanup_glue>
f0100ede:	85a2                	mv	a1,s0
f0100ee0:	4422                	lw	s0,8(sp)
f0100ee2:	40b2                	lw	ra,12(sp)
f0100ee4:	8526                	mv	a0,s1
f0100ee6:	4492                	lw	s1,4(sp)
f0100ee8:	0141                	addi	sp,sp,16
f0100eea:	1910006f          	j	f010187a <_free_r>

f0100eee <_reclaim_reent>:
f0100eee:	f01087b7          	lui	a5,0xf0108
f0100ef2:	4947a783          	lw	a5,1172(a5) # f0108494 <_sp+0xffffef44>
f0100ef6:	0ca78763          	beq	a5,a0,f0100fc4 <_reclaim_reent+0xd6>
f0100efa:	515c                	lw	a5,36(a0)
f0100efc:	1101                	addi	sp,sp,-32
f0100efe:	cc22                	sw	s0,24(sp)
f0100f00:	ce06                	sw	ra,28(sp)
f0100f02:	ca26                	sw	s1,20(sp)
f0100f04:	c84a                	sw	s2,16(sp)
f0100f06:	c64e                	sw	s3,12(sp)
f0100f08:	842a                	mv	s0,a0
f0100f0a:	cf81                	beqz	a5,f0100f22 <_reclaim_reent+0x34>
f0100f0c:	47dc                	lw	a5,12(a5)
f0100f0e:	4481                	li	s1,0
f0100f10:	08000913          	li	s2,128
f0100f14:	e3d1                	bnez	a5,f0100f98 <_reclaim_reent+0xaa>
f0100f16:	505c                	lw	a5,36(s0)
f0100f18:	438c                	lw	a1,0(a5)
f0100f1a:	c581                	beqz	a1,f0100f22 <_reclaim_reent+0x34>
f0100f1c:	8522                	mv	a0,s0
f0100f1e:	15d000ef          	jal	ra,f010187a <_free_r>
f0100f22:	484c                	lw	a1,20(s0)
f0100f24:	c581                	beqz	a1,f0100f2c <_reclaim_reent+0x3e>
f0100f26:	8522                	mv	a0,s0
f0100f28:	153000ef          	jal	ra,f010187a <_free_r>
f0100f2c:	504c                	lw	a1,36(s0)
f0100f2e:	c581                	beqz	a1,f0100f36 <_reclaim_reent+0x48>
f0100f30:	8522                	mv	a0,s0
f0100f32:	149000ef          	jal	ra,f010187a <_free_r>
f0100f36:	5c0c                	lw	a1,56(s0)
f0100f38:	c581                	beqz	a1,f0100f40 <_reclaim_reent+0x52>
f0100f3a:	8522                	mv	a0,s0
f0100f3c:	13f000ef          	jal	ra,f010187a <_free_r>
f0100f40:	5c4c                	lw	a1,60(s0)
f0100f42:	c581                	beqz	a1,f0100f4a <_reclaim_reent+0x5c>
f0100f44:	8522                	mv	a0,s0
f0100f46:	135000ef          	jal	ra,f010187a <_free_r>
f0100f4a:	402c                	lw	a1,64(s0)
f0100f4c:	c581                	beqz	a1,f0100f54 <_reclaim_reent+0x66>
f0100f4e:	8522                	mv	a0,s0
f0100f50:	12b000ef          	jal	ra,f010187a <_free_r>
f0100f54:	4c6c                	lw	a1,92(s0)
f0100f56:	c581                	beqz	a1,f0100f5e <_reclaim_reent+0x70>
f0100f58:	8522                	mv	a0,s0
f0100f5a:	121000ef          	jal	ra,f010187a <_free_r>
f0100f5e:	4c2c                	lw	a1,88(s0)
f0100f60:	c581                	beqz	a1,f0100f68 <_reclaim_reent+0x7a>
f0100f62:	8522                	mv	a0,s0
f0100f64:	117000ef          	jal	ra,f010187a <_free_r>
f0100f68:	584c                	lw	a1,52(s0)
f0100f6a:	c581                	beqz	a1,f0100f72 <_reclaim_reent+0x84>
f0100f6c:	8522                	mv	a0,s0
f0100f6e:	10d000ef          	jal	ra,f010187a <_free_r>
f0100f72:	4c1c                	lw	a5,24(s0)
f0100f74:	c3a9                	beqz	a5,f0100fb6 <_reclaim_reent+0xc8>
f0100f76:	541c                	lw	a5,40(s0)
f0100f78:	8522                	mv	a0,s0
f0100f7a:	9782                	jalr	a5
f0100f7c:	442c                	lw	a1,72(s0)
f0100f7e:	cd85                	beqz	a1,f0100fb6 <_reclaim_reent+0xc8>
f0100f80:	8522                	mv	a0,s0
f0100f82:	4462                	lw	s0,24(sp)
f0100f84:	40f2                	lw	ra,28(sp)
f0100f86:	44d2                	lw	s1,20(sp)
f0100f88:	4942                	lw	s2,16(sp)
f0100f8a:	49b2                	lw	s3,12(sp)
f0100f8c:	6105                	addi	sp,sp,32
f0100f8e:	bf3d                	j	f0100ecc <cleanup_glue>
f0100f90:	95a6                	add	a1,a1,s1
f0100f92:	418c                	lw	a1,0(a1)
f0100f94:	e991                	bnez	a1,f0100fa8 <_reclaim_reent+0xba>
f0100f96:	0491                	addi	s1,s1,4
f0100f98:	505c                	lw	a5,36(s0)
f0100f9a:	47cc                	lw	a1,12(a5)
f0100f9c:	ff249ae3          	bne	s1,s2,f0100f90 <_reclaim_reent+0xa2>
f0100fa0:	8522                	mv	a0,s0
f0100fa2:	0d9000ef          	jal	ra,f010187a <_free_r>
f0100fa6:	bf85                	j	f0100f16 <_reclaim_reent+0x28>
f0100fa8:	0005a983          	lw	s3,0(a1)
f0100fac:	8522                	mv	a0,s0
f0100fae:	0cd000ef          	jal	ra,f010187a <_free_r>
f0100fb2:	85ce                	mv	a1,s3
f0100fb4:	b7c5                	j	f0100f94 <_reclaim_reent+0xa6>
f0100fb6:	40f2                	lw	ra,28(sp)
f0100fb8:	4462                	lw	s0,24(sp)
f0100fba:	44d2                	lw	s1,20(sp)
f0100fbc:	4942                	lw	s2,16(sp)
f0100fbe:	49b2                	lw	s3,12(sp)
f0100fc0:	6105                	addi	sp,sp,32
f0100fc2:	8082                	ret
f0100fc4:	8082                	ret

f0100fc6 <__swbuf_r>:
f0100fc6:	1101                	addi	sp,sp,-32
f0100fc8:	cc22                	sw	s0,24(sp)
f0100fca:	ca26                	sw	s1,20(sp)
f0100fcc:	c84a                	sw	s2,16(sp)
f0100fce:	ce06                	sw	ra,28(sp)
f0100fd0:	c64e                	sw	s3,12(sp)
f0100fd2:	84aa                	mv	s1,a0
f0100fd4:	892e                	mv	s2,a1
f0100fd6:	8432                	mv	s0,a2
f0100fd8:	c501                	beqz	a0,f0100fe0 <__swbuf_r+0x1a>
f0100fda:	4d1c                	lw	a5,24(a0)
f0100fdc:	e391                	bnez	a5,f0100fe0 <__swbuf_r+0x1a>
f0100fde:	2355                	jal	f0101582 <__sinit>
f0100fe0:	f01087b7          	lui	a5,0xf0108
f0100fe4:	25878793          	addi	a5,a5,600 # f0108258 <_sp+0xffffed08>
f0100fe8:	06f41963          	bne	s0,a5,f010105a <__swbuf_r+0x94>
f0100fec:	40c0                	lw	s0,4(s1)
f0100fee:	4c1c                	lw	a5,24(s0)
f0100ff0:	c41c                	sw	a5,8(s0)
f0100ff2:	00c45783          	lhu	a5,12(s0)
f0100ff6:	8ba1                	andi	a5,a5,8
f0100ff8:	c3c9                	beqz	a5,f010107a <__swbuf_r+0xb4>
f0100ffa:	481c                	lw	a5,16(s0)
f0100ffc:	cfbd                	beqz	a5,f010107a <__swbuf_r+0xb4>
f0100ffe:	481c                	lw	a5,16(s0)
f0101000:	4008                	lw	a0,0(s0)
f0101002:	0ff97993          	zext.b	s3,s2
f0101006:	0ff97913          	zext.b	s2,s2
f010100a:	8d1d                	sub	a0,a0,a5
f010100c:	485c                	lw	a5,20(s0)
f010100e:	00f54663          	blt	a0,a5,f010101a <__swbuf_r+0x54>
f0101012:	85a2                	mv	a1,s0
f0101014:	8526                	mv	a0,s1
f0101016:	2931                	jal	f0101432 <_fflush_r>
f0101018:	e52d                	bnez	a0,f0101082 <__swbuf_r+0xbc>
f010101a:	441c                	lw	a5,8(s0)
f010101c:	0505                	addi	a0,a0,1
f010101e:	17fd                	addi	a5,a5,-1
f0101020:	c41c                	sw	a5,8(s0)
f0101022:	401c                	lw	a5,0(s0)
f0101024:	00178713          	addi	a4,a5,1
f0101028:	c018                	sw	a4,0(s0)
f010102a:	01378023          	sb	s3,0(a5)
f010102e:	485c                	lw	a5,20(s0)
f0101030:	00a78963          	beq	a5,a0,f0101042 <__swbuf_r+0x7c>
f0101034:	00c45783          	lhu	a5,12(s0)
f0101038:	8b85                	andi	a5,a5,1
f010103a:	cb81                	beqz	a5,f010104a <__swbuf_r+0x84>
f010103c:	47a9                	li	a5,10
f010103e:	00f91663          	bne	s2,a5,f010104a <__swbuf_r+0x84>
f0101042:	85a2                	mv	a1,s0
f0101044:	8526                	mv	a0,s1
f0101046:	26f5                	jal	f0101432 <_fflush_r>
f0101048:	ed0d                	bnez	a0,f0101082 <__swbuf_r+0xbc>
f010104a:	40f2                	lw	ra,28(sp)
f010104c:	4462                	lw	s0,24(sp)
f010104e:	44d2                	lw	s1,20(sp)
f0101050:	49b2                	lw	s3,12(sp)
f0101052:	854a                	mv	a0,s2
f0101054:	4942                	lw	s2,16(sp)
f0101056:	6105                	addi	sp,sp,32
f0101058:	8082                	ret
f010105a:	f01087b7          	lui	a5,0xf0108
f010105e:	27878793          	addi	a5,a5,632 # f0108278 <_sp+0xffffed28>
f0101062:	00f41463          	bne	s0,a5,f010106a <__swbuf_r+0xa4>
f0101066:	4480                	lw	s0,8(s1)
f0101068:	b759                	j	f0100fee <__swbuf_r+0x28>
f010106a:	f01087b7          	lui	a5,0xf0108
f010106e:	23878793          	addi	a5,a5,568 # f0108238 <_sp+0xffffece8>
f0101072:	f6f41ee3          	bne	s0,a5,f0100fee <__swbuf_r+0x28>
f0101076:	44c0                	lw	s0,12(s1)
f0101078:	bf9d                	j	f0100fee <__swbuf_r+0x28>
f010107a:	85a2                	mv	a1,s0
f010107c:	8526                	mv	a0,s1
f010107e:	2819                	jal	f0101094 <__swsetup_r>
f0101080:	dd3d                	beqz	a0,f0100ffe <__swbuf_r+0x38>
f0101082:	597d                	li	s2,-1
f0101084:	b7d9                	j	f010104a <__swbuf_r+0x84>

f0101086 <__swbuf>:
f0101086:	f01087b7          	lui	a5,0xf0108
f010108a:	862e                	mv	a2,a1
f010108c:	85aa                	mv	a1,a0
f010108e:	4947a503          	lw	a0,1172(a5) # f0108494 <_sp+0xffffef44>
f0101092:	bf15                	j	f0100fc6 <__swbuf_r>

f0101094 <__swsetup_r>:
f0101094:	1141                	addi	sp,sp,-16
f0101096:	f01087b7          	lui	a5,0xf0108
f010109a:	c226                	sw	s1,4(sp)
f010109c:	4947a483          	lw	s1,1172(a5) # f0108494 <_sp+0xffffef44>
f01010a0:	c422                	sw	s0,8(sp)
f01010a2:	c04a                	sw	s2,0(sp)
f01010a4:	c606                	sw	ra,12(sp)
f01010a6:	892a                	mv	s2,a0
f01010a8:	842e                	mv	s0,a1
f01010aa:	c489                	beqz	s1,f01010b4 <__swsetup_r+0x20>
f01010ac:	4c9c                	lw	a5,24(s1)
f01010ae:	e399                	bnez	a5,f01010b4 <__swsetup_r+0x20>
f01010b0:	8526                	mv	a0,s1
f01010b2:	29c1                	jal	f0101582 <__sinit>
f01010b4:	f01087b7          	lui	a5,0xf0108
f01010b8:	25878793          	addi	a5,a5,600 # f0108258 <_sp+0xffffed08>
f01010bc:	02f41763          	bne	s0,a5,f01010ea <__swsetup_r+0x56>
f01010c0:	40c0                	lw	s0,4(s1)
f01010c2:	00c41783          	lh	a5,12(s0)
f01010c6:	01079713          	slli	a4,a5,0x10
f01010ca:	0087f693          	andi	a3,a5,8
f01010ce:	8341                	srli	a4,a4,0x10
f01010d0:	eab5                	bnez	a3,f0101144 <__swsetup_r+0xb0>
f01010d2:	01077693          	andi	a3,a4,16
f01010d6:	ea95                	bnez	a3,f010110a <__swsetup_r+0x76>
f01010d8:	4725                	li	a4,9
f01010da:	00e92023          	sw	a4,0(s2)
f01010de:	0407e793          	ori	a5,a5,64
f01010e2:	00f41623          	sh	a5,12(s0)
f01010e6:	557d                	li	a0,-1
f01010e8:	a879                	j	f0101186 <__swsetup_r+0xf2>
f01010ea:	f01087b7          	lui	a5,0xf0108
f01010ee:	27878793          	addi	a5,a5,632 # f0108278 <_sp+0xffffed28>
f01010f2:	00f41463          	bne	s0,a5,f01010fa <__swsetup_r+0x66>
f01010f6:	4480                	lw	s0,8(s1)
f01010f8:	b7e9                	j	f01010c2 <__swsetup_r+0x2e>
f01010fa:	f01087b7          	lui	a5,0xf0108
f01010fe:	23878793          	addi	a5,a5,568 # f0108238 <_sp+0xffffece8>
f0101102:	fcf410e3          	bne	s0,a5,f01010c2 <__swsetup_r+0x2e>
f0101106:	44c0                	lw	s0,12(s1)
f0101108:	bf6d                	j	f01010c2 <__swsetup_r+0x2e>
f010110a:	8b11                	andi	a4,a4,4
f010110c:	c715                	beqz	a4,f0101138 <__swsetup_r+0xa4>
f010110e:	584c                	lw	a1,52(s0)
f0101110:	c991                	beqz	a1,f0101124 <__swsetup_r+0x90>
f0101112:	04440793          	addi	a5,s0,68
f0101116:	00f58563          	beq	a1,a5,f0101120 <__swsetup_r+0x8c>
f010111a:	854a                	mv	a0,s2
f010111c:	75e000ef          	jal	ra,f010187a <_free_r>
f0101120:	02042a23          	sw	zero,52(s0)
f0101124:	00c45783          	lhu	a5,12(s0)
f0101128:	00042223          	sw	zero,4(s0)
f010112c:	fdb7f793          	andi	a5,a5,-37
f0101130:	00f41623          	sh	a5,12(s0)
f0101134:	481c                	lw	a5,16(s0)
f0101136:	c01c                	sw	a5,0(s0)
f0101138:	00c45783          	lhu	a5,12(s0)
f010113c:	0087e793          	ori	a5,a5,8
f0101140:	00f41623          	sh	a5,12(s0)
f0101144:	481c                	lw	a5,16(s0)
f0101146:	ef81                	bnez	a5,f010115e <__swsetup_r+0xca>
f0101148:	00c45783          	lhu	a5,12(s0)
f010114c:	20000713          	li	a4,512
f0101150:	2807f793          	andi	a5,a5,640
f0101154:	00e78563          	beq	a5,a4,f010115e <__swsetup_r+0xca>
f0101158:	85a2                	mv	a1,s0
f010115a:	854a                	mv	a0,s2
f010115c:	2549                	jal	f01017de <__smakebuf_r>
f010115e:	00c41783          	lh	a5,12(s0)
f0101162:	01079713          	slli	a4,a5,0x10
f0101166:	0017f693          	andi	a3,a5,1
f010116a:	8341                	srli	a4,a4,0x10
f010116c:	c29d                	beqz	a3,f0101192 <__swsetup_r+0xfe>
f010116e:	4854                	lw	a3,20(s0)
f0101170:	00042423          	sw	zero,8(s0)
f0101174:	40d006b3          	neg	a3,a3
f0101178:	cc14                	sw	a3,24(s0)
f010117a:	4814                	lw	a3,16(s0)
f010117c:	4501                	li	a0,0
f010117e:	e681                	bnez	a3,f0101186 <__swsetup_r+0xf2>
f0101180:	08077713          	andi	a4,a4,128
f0101184:	ff29                	bnez	a4,f01010de <__swsetup_r+0x4a>
f0101186:	40b2                	lw	ra,12(sp)
f0101188:	4422                	lw	s0,8(sp)
f010118a:	4492                	lw	s1,4(sp)
f010118c:	4902                	lw	s2,0(sp)
f010118e:	0141                	addi	sp,sp,16
f0101190:	8082                	ret
f0101192:	00277693          	andi	a3,a4,2
f0101196:	4601                	li	a2,0
f0101198:	e291                	bnez	a3,f010119c <__swsetup_r+0x108>
f010119a:	4850                	lw	a2,20(s0)
f010119c:	c410                	sw	a2,8(s0)
f010119e:	bff1                	j	f010117a <__swsetup_r+0xe6>

f01011a0 <__register_exitproc>:
f01011a0:	f0108837          	lui	a6,0xf0108
f01011a4:	4a082783          	lw	a5,1184(a6) # f01084a0 <_sp+0xffffef50>
f01011a8:	88aa                	mv	a7,a0
f01011aa:	e39d                	bnez	a5,f01011d0 <__register_exitproc+0x30>
f01011ac:	f0108737          	lui	a4,0xf0108
f01011b0:	4b870513          	addi	a0,a4,1208 # f01084b8 <_sp+0xffffef68>
f01011b4:	4aa82023          	sw	a0,1184(a6)
f01011b8:	00000313          	li	t1,0
f01011bc:	4b870793          	addi	a5,a4,1208
f01011c0:	00030863          	beqz	t1,f01011d0 <__register_exitproc+0x30>
f01011c4:	00002783          	lw	a5,0(zero) # 0 <_lma_vma_data_offset>
f01011c8:	08f52423          	sw	a5,136(a0) # 80000088 <_sp+0x8fef6b38>
f01011cc:	4b870793          	addi	a5,a4,1208
f01011d0:	43d8                	lw	a4,4(a5)
f01011d2:	487d                	li	a6,31
f01011d4:	557d                	li	a0,-1
f01011d6:	04e84663          	blt	a6,a4,f0101222 <__register_exitproc+0x82>
f01011da:	02088d63          	beqz	a7,f0101214 <__register_exitproc+0x74>
f01011de:	0887a803          	lw	a6,136(a5)
f01011e2:	04080063          	beqz	a6,f0101222 <__register_exitproc+0x82>
f01011e6:	00271513          	slli	a0,a4,0x2
f01011ea:	9542                	add	a0,a0,a6
f01011ec:	c110                	sw	a2,0(a0)
f01011ee:	10082303          	lw	t1,256(a6)
f01011f2:	4605                	li	a2,1
f01011f4:	00e61633          	sll	a2,a2,a4
f01011f8:	00c36333          	or	t1,t1,a2
f01011fc:	10682023          	sw	t1,256(a6)
f0101200:	08d52023          	sw	a3,128(a0)
f0101204:	4689                	li	a3,2
f0101206:	00d89763          	bne	a7,a3,f0101214 <__register_exitproc+0x74>
f010120a:	10482683          	lw	a3,260(a6)
f010120e:	8ed1                	or	a3,a3,a2
f0101210:	10d82223          	sw	a3,260(a6)
f0101214:	00170693          	addi	a3,a4,1
f0101218:	070a                	slli	a4,a4,0x2
f010121a:	c3d4                	sw	a3,4(a5)
f010121c:	97ba                	add	a5,a5,a4
f010121e:	c78c                	sw	a1,8(a5)
f0101220:	4501                	li	a0,0
f0101222:	8082                	ret

f0101224 <__call_exitprocs>:
f0101224:	7179                	addi	sp,sp,-48
f0101226:	c85a                	sw	s6,16(sp)
f0101228:	f0108b37          	lui	s6,0xf0108
f010122c:	ca56                	sw	s5,20(sp)
f010122e:	c65e                	sw	s7,12(sp)
f0101230:	c462                	sw	s8,8(sp)
f0101232:	d606                	sw	ra,44(sp)
f0101234:	d422                	sw	s0,40(sp)
f0101236:	d226                	sw	s1,36(sp)
f0101238:	d04a                	sw	s2,32(sp)
f010123a:	ce4e                	sw	s3,28(sp)
f010123c:	cc52                	sw	s4,24(sp)
f010123e:	c266                	sw	s9,4(sp)
f0101240:	8baa                	mv	s7,a0
f0101242:	8aae                	mv	s5,a1
f0101244:	4a0b0b13          	addi	s6,s6,1184 # f01084a0 <_sp+0xffffef50>
f0101248:	4c05                	li	s8,1
f010124a:	000b2483          	lw	s1,0(s6)
f010124e:	cc81                	beqz	s1,f0101266 <__call_exitprocs+0x42>
f0101250:	40c0                	lw	s0,4(s1)
f0101252:	0884a983          	lw	s3,136(s1)
f0101256:	fff40913          	addi	s2,s0,-1
f010125a:	040a                	slli	s0,s0,0x2
f010125c:	00898a33          	add	s4,s3,s0
f0101260:	9426                	add	s0,s0,s1
f0101262:	00095f63          	bgez	s2,f0101280 <__call_exitprocs+0x5c>
f0101266:	50b2                	lw	ra,44(sp)
f0101268:	5422                	lw	s0,40(sp)
f010126a:	5492                	lw	s1,36(sp)
f010126c:	5902                	lw	s2,32(sp)
f010126e:	49f2                	lw	s3,28(sp)
f0101270:	4a62                	lw	s4,24(sp)
f0101272:	4ad2                	lw	s5,20(sp)
f0101274:	4b42                	lw	s6,16(sp)
f0101276:	4bb2                	lw	s7,12(sp)
f0101278:	4c22                	lw	s8,8(sp)
f010127a:	4c92                	lw	s9,4(sp)
f010127c:	6145                	addi	sp,sp,48
f010127e:	8082                	ret
f0101280:	000a8c63          	beqz	s5,f0101298 <__call_exitprocs+0x74>
f0101284:	00099663          	bnez	s3,f0101290 <__call_exitprocs+0x6c>
f0101288:	197d                	addi	s2,s2,-1
f010128a:	1a71                	addi	s4,s4,-4
f010128c:	1471                	addi	s0,s0,-4
f010128e:	bfd1                	j	f0101262 <__call_exitprocs+0x3e>
f0101290:	07ca2783          	lw	a5,124(s4)
f0101294:	ff579ae3          	bne	a5,s5,f0101288 <__call_exitprocs+0x64>
f0101298:	40d8                	lw	a4,4(s1)
f010129a:	405c                	lw	a5,4(s0)
f010129c:	177d                	addi	a4,a4,-1
f010129e:	03271863          	bne	a4,s2,f01012ce <__call_exitprocs+0xaa>
f01012a2:	0124a223          	sw	s2,4(s1)
f01012a6:	d3ed                	beqz	a5,f0101288 <__call_exitprocs+0x64>
f01012a8:	0044ac83          	lw	s9,4(s1)
f01012ac:	00098863          	beqz	s3,f01012bc <__call_exitprocs+0x98>
f01012b0:	1009a683          	lw	a3,256(s3)
f01012b4:	012c1733          	sll	a4,s8,s2
f01012b8:	8ef9                	and	a3,a3,a4
f01012ba:	ee89                	bnez	a3,f01012d4 <__call_exitprocs+0xb0>
f01012bc:	9782                	jalr	a5
f01012be:	40d8                	lw	a4,4(s1)
f01012c0:	000b2783          	lw	a5,0(s6)
f01012c4:	f99713e3          	bne	a4,s9,f010124a <__call_exitprocs+0x26>
f01012c8:	fcf480e3          	beq	s1,a5,f0101288 <__call_exitprocs+0x64>
f01012cc:	bfbd                	j	f010124a <__call_exitprocs+0x26>
f01012ce:	00042223          	sw	zero,4(s0)
f01012d2:	bfd1                	j	f01012a6 <__call_exitprocs+0x82>
f01012d4:	1049a683          	lw	a3,260(s3)
f01012d8:	ffca2583          	lw	a1,-4(s4)
f01012dc:	8f75                	and	a4,a4,a3
f01012de:	e701                	bnez	a4,f01012e6 <__call_exitprocs+0xc2>
f01012e0:	855e                	mv	a0,s7
f01012e2:	9782                	jalr	a5
f01012e4:	bfe9                	j	f01012be <__call_exitprocs+0x9a>
f01012e6:	852e                	mv	a0,a1
f01012e8:	9782                	jalr	a5
f01012ea:	bfd1                	j	f01012be <__call_exitprocs+0x9a>

f01012ec <__sflush_r>:
f01012ec:	00c5d783          	lhu	a5,12(a1)
f01012f0:	1101                	addi	sp,sp,-32
f01012f2:	cc22                	sw	s0,24(sp)
f01012f4:	ca26                	sw	s1,20(sp)
f01012f6:	ce06                	sw	ra,28(sp)
f01012f8:	c84a                	sw	s2,16(sp)
f01012fa:	c64e                	sw	s3,12(sp)
f01012fc:	0087f713          	andi	a4,a5,8
f0101300:	84aa                	mv	s1,a0
f0101302:	842e                	mv	s0,a1
f0101304:	e375                	bnez	a4,f01013e8 <__sflush_r+0xfc>
f0101306:	41d8                	lw	a4,4(a1)
f0101308:	00e04763          	bgtz	a4,f0101316 <__sflush_r+0x2a>
f010130c:	41b8                	lw	a4,64(a1)
f010130e:	00e04463          	bgtz	a4,f0101316 <__sflush_r+0x2a>
f0101312:	4501                	li	a0,0
f0101314:	a875                	j	f01013d0 <__sflush_r+0xe4>
f0101316:	5458                	lw	a4,44(s0)
f0101318:	df6d                	beqz	a4,f0101312 <__sflush_r+0x26>
f010131a:	6685                	lui	a3,0x1
f010131c:	0004a903          	lw	s2,0(s1)
f0101320:	8ff5                	and	a5,a5,a3
f0101322:	0004a023          	sw	zero,0(s1)
f0101326:	500c                	lw	a1,32(s0)
f0101328:	cfa5                	beqz	a5,f01013a0 <__sflush_r+0xb4>
f010132a:	4868                	lw	a0,84(s0)
f010132c:	00c45783          	lhu	a5,12(s0)
f0101330:	8b91                	andi	a5,a5,4
f0101332:	c799                	beqz	a5,f0101340 <__sflush_r+0x54>
f0101334:	405c                	lw	a5,4(s0)
f0101336:	8d1d                	sub	a0,a0,a5
f0101338:	585c                	lw	a5,52(s0)
f010133a:	c399                	beqz	a5,f0101340 <__sflush_r+0x54>
f010133c:	403c                	lw	a5,64(s0)
f010133e:	8d1d                	sub	a0,a0,a5
f0101340:	545c                	lw	a5,44(s0)
f0101342:	500c                	lw	a1,32(s0)
f0101344:	862a                	mv	a2,a0
f0101346:	4681                	li	a3,0
f0101348:	8526                	mv	a0,s1
f010134a:	9782                	jalr	a5
f010134c:	57fd                	li	a5,-1
f010134e:	00c45703          	lhu	a4,12(s0)
f0101352:	00f51d63          	bne	a0,a5,f010136c <__sflush_r+0x80>
f0101356:	4094                	lw	a3,0(s1)
f0101358:	47f5                	li	a5,29
f010135a:	08d7e263          	bltu	a5,a3,f01013de <__sflush_r+0xf2>
f010135e:	dfc007b7          	lui	a5,0xdfc00
f0101362:	17f9                	addi	a5,a5,-2
f0101364:	40d7d7b3          	sra	a5,a5,a3
f0101368:	8b85                	andi	a5,a5,1
f010136a:	ebb5                	bnez	a5,f01013de <__sflush_r+0xf2>
f010136c:	481c                	lw	a5,16(s0)
f010136e:	00042223          	sw	zero,4(s0)
f0101372:	c01c                	sw	a5,0(s0)
f0101374:	6785                	lui	a5,0x1
f0101376:	8f7d                	and	a4,a4,a5
f0101378:	c719                	beqz	a4,f0101386 <__sflush_r+0x9a>
f010137a:	57fd                	li	a5,-1
f010137c:	00f51463          	bne	a0,a5,f0101384 <__sflush_r+0x98>
f0101380:	409c                	lw	a5,0(s1)
f0101382:	e391                	bnez	a5,f0101386 <__sflush_r+0x9a>
f0101384:	c868                	sw	a0,84(s0)
f0101386:	584c                	lw	a1,52(s0)
f0101388:	0124a023          	sw	s2,0(s1)
f010138c:	d1d9                	beqz	a1,f0101312 <__sflush_r+0x26>
f010138e:	04440793          	addi	a5,s0,68
f0101392:	00f58463          	beq	a1,a5,f010139a <__sflush_r+0xae>
f0101396:	8526                	mv	a0,s1
f0101398:	21cd                	jal	f010187a <_free_r>
f010139a:	02042a23          	sw	zero,52(s0)
f010139e:	bf95                	j	f0101312 <__sflush_r+0x26>
f01013a0:	4685                	li	a3,1
f01013a2:	4601                	li	a2,0
f01013a4:	8526                	mv	a0,s1
f01013a6:	9702                	jalr	a4
f01013a8:	57fd                	li	a5,-1
f01013aa:	f8f511e3          	bne	a0,a5,f010132c <__sflush_r+0x40>
f01013ae:	409c                	lw	a5,0(s1)
f01013b0:	dfb5                	beqz	a5,f010132c <__sflush_r+0x40>
f01013b2:	4775                	li	a4,29
f01013b4:	00e78563          	beq	a5,a4,f01013be <__sflush_r+0xd2>
f01013b8:	4759                	li	a4,22
f01013ba:	00e79563          	bne	a5,a4,f01013c4 <__sflush_r+0xd8>
f01013be:	0124a023          	sw	s2,0(s1)
f01013c2:	bf81                	j	f0101312 <__sflush_r+0x26>
f01013c4:	00c45783          	lhu	a5,12(s0)
f01013c8:	0407e793          	ori	a5,a5,64
f01013cc:	00f41623          	sh	a5,12(s0)
f01013d0:	40f2                	lw	ra,28(sp)
f01013d2:	4462                	lw	s0,24(sp)
f01013d4:	44d2                	lw	s1,20(sp)
f01013d6:	4942                	lw	s2,16(sp)
f01013d8:	49b2                	lw	s3,12(sp)
f01013da:	6105                	addi	sp,sp,32
f01013dc:	8082                	ret
f01013de:	04076713          	ori	a4,a4,64
f01013e2:	00e41623          	sh	a4,12(s0)
f01013e6:	b7ed                	j	f01013d0 <__sflush_r+0xe4>
f01013e8:	0105a983          	lw	s3,16(a1)
f01013ec:	f20983e3          	beqz	s3,f0101312 <__sflush_r+0x26>
f01013f0:	0005a903          	lw	s2,0(a1)
f01013f4:	8b8d                	andi	a5,a5,3
f01013f6:	0135a023          	sw	s3,0(a1)
f01013fa:	41390933          	sub	s2,s2,s3
f01013fe:	4701                	li	a4,0
f0101400:	e391                	bnez	a5,f0101404 <__sflush_r+0x118>
f0101402:	49d8                	lw	a4,20(a1)
f0101404:	c418                	sw	a4,8(s0)
f0101406:	f12056e3          	blez	s2,f0101312 <__sflush_r+0x26>
f010140a:	541c                	lw	a5,40(s0)
f010140c:	500c                	lw	a1,32(s0)
f010140e:	86ca                	mv	a3,s2
f0101410:	864e                	mv	a2,s3
f0101412:	8526                	mv	a0,s1
f0101414:	9782                	jalr	a5
f0101416:	00a04a63          	bgtz	a0,f010142a <__sflush_r+0x13e>
f010141a:	00c45783          	lhu	a5,12(s0)
f010141e:	557d                	li	a0,-1
f0101420:	0407e793          	ori	a5,a5,64
f0101424:	00f41623          	sh	a5,12(s0)
f0101428:	b765                	j	f01013d0 <__sflush_r+0xe4>
f010142a:	99aa                	add	s3,s3,a0
f010142c:	40a90933          	sub	s2,s2,a0
f0101430:	bfd9                	j	f0101406 <__sflush_r+0x11a>

f0101432 <_fflush_r>:
f0101432:	499c                	lw	a5,16(a1)
f0101434:	cfb9                	beqz	a5,f0101492 <_fflush_r+0x60>
f0101436:	1101                	addi	sp,sp,-32
f0101438:	cc22                	sw	s0,24(sp)
f010143a:	ce06                	sw	ra,28(sp)
f010143c:	842a                	mv	s0,a0
f010143e:	c511                	beqz	a0,f010144a <_fflush_r+0x18>
f0101440:	4d1c                	lw	a5,24(a0)
f0101442:	e781                	bnez	a5,f010144a <_fflush_r+0x18>
f0101444:	c62e                	sw	a1,12(sp)
f0101446:	2a35                	jal	f0101582 <__sinit>
f0101448:	45b2                	lw	a1,12(sp)
f010144a:	f01087b7          	lui	a5,0xf0108
f010144e:	25878793          	addi	a5,a5,600 # f0108258 <_sp+0xffffed08>
f0101452:	00f59b63          	bne	a1,a5,f0101468 <_fflush_r+0x36>
f0101456:	404c                	lw	a1,4(s0)
f0101458:	00c59783          	lh	a5,12(a1)
f010145c:	c795                	beqz	a5,f0101488 <_fflush_r+0x56>
f010145e:	8522                	mv	a0,s0
f0101460:	4462                	lw	s0,24(sp)
f0101462:	40f2                	lw	ra,28(sp)
f0101464:	6105                	addi	sp,sp,32
f0101466:	b559                	j	f01012ec <__sflush_r>
f0101468:	f01087b7          	lui	a5,0xf0108
f010146c:	27878793          	addi	a5,a5,632 # f0108278 <_sp+0xffffed28>
f0101470:	00f59463          	bne	a1,a5,f0101478 <_fflush_r+0x46>
f0101474:	440c                	lw	a1,8(s0)
f0101476:	b7cd                	j	f0101458 <_fflush_r+0x26>
f0101478:	f01087b7          	lui	a5,0xf0108
f010147c:	23878793          	addi	a5,a5,568 # f0108238 <_sp+0xffffece8>
f0101480:	fcf59ce3          	bne	a1,a5,f0101458 <_fflush_r+0x26>
f0101484:	444c                	lw	a1,12(s0)
f0101486:	bfc9                	j	f0101458 <_fflush_r+0x26>
f0101488:	40f2                	lw	ra,28(sp)
f010148a:	4462                	lw	s0,24(sp)
f010148c:	4501                	li	a0,0
f010148e:	6105                	addi	sp,sp,32
f0101490:	8082                	ret
f0101492:	4501                	li	a0,0
f0101494:	8082                	ret

f0101496 <fflush>:
f0101496:	85aa                	mv	a1,a0
f0101498:	e911                	bnez	a0,f01014ac <fflush+0x16>
f010149a:	f01087b7          	lui	a5,0xf0108
f010149e:	48c7a503          	lw	a0,1164(a5) # f010848c <_sp+0xffffef3c>
f01014a2:	f01015b7          	lui	a1,0xf0101
f01014a6:	43258593          	addi	a1,a1,1074 # f0101432 <_sp+0xffff7ee2>
f01014aa:	a4bd                	j	f0101718 <_fwalk_reent>
f01014ac:	f01087b7          	lui	a5,0xf0108
f01014b0:	4947a503          	lw	a0,1172(a5) # f0108494 <_sp+0xffffef44>
f01014b4:	bfbd                	j	f0101432 <_fflush_r>

f01014b6 <__fp_lock>:
f01014b6:	4501                	li	a0,0
f01014b8:	8082                	ret

f01014ba <std>:
f01014ba:	1141                	addi	sp,sp,-16
f01014bc:	c422                	sw	s0,8(sp)
f01014be:	c606                	sw	ra,12(sp)
f01014c0:	842a                	mv	s0,a0
f01014c2:	00b51623          	sh	a1,12(a0)
f01014c6:	00c51723          	sh	a2,14(a0)
f01014ca:	00052023          	sw	zero,0(a0)
f01014ce:	00052223          	sw	zero,4(a0)
f01014d2:	00052423          	sw	zero,8(a0)
f01014d6:	06052223          	sw	zero,100(a0)
f01014da:	00052823          	sw	zero,16(a0)
f01014de:	00052a23          	sw	zero,20(a0)
f01014e2:	00052c23          	sw	zero,24(a0)
f01014e6:	4621                	li	a2,8
f01014e8:	4581                	li	a1,0
f01014ea:	05c50513          	addi	a0,a0,92
f01014ee:	8e5ff0ef          	jal	ra,f0100dd2 <memset>
f01014f2:	f01027b7          	lui	a5,0xf0102
f01014f6:	a2878793          	addi	a5,a5,-1496 # f0101a28 <_sp+0xffff84d8>
f01014fa:	d05c                	sw	a5,36(s0)
f01014fc:	f01027b7          	lui	a5,0xf0102
f0101500:	a5c78793          	addi	a5,a5,-1444 # f0101a5c <_sp+0xffff850c>
f0101504:	d41c                	sw	a5,40(s0)
f0101506:	f01027b7          	lui	a5,0xf0102
f010150a:	aaa78793          	addi	a5,a5,-1366 # f0101aaa <_sp+0xffff855a>
f010150e:	d45c                	sw	a5,44(s0)
f0101510:	f01027b7          	lui	a5,0xf0102
f0101514:	ae078793          	addi	a5,a5,-1312 # f0101ae0 <_sp+0xffff8590>
f0101518:	40b2                	lw	ra,12(sp)
f010151a:	d000                	sw	s0,32(s0)
f010151c:	d81c                	sw	a5,48(s0)
f010151e:	4422                	lw	s0,8(sp)
f0101520:	0141                	addi	sp,sp,16
f0101522:	8082                	ret

f0101524 <_cleanup_r>:
f0101524:	f01015b7          	lui	a1,0xf0101
f0101528:	43258593          	addi	a1,a1,1074 # f0101432 <_sp+0xffff7ee2>
f010152c:	a2f5                	j	f0101718 <_fwalk_reent>

f010152e <__fp_unlock>:
f010152e:	4501                	li	a0,0
f0101530:	8082                	ret

f0101532 <__sfmoreglue>:
f0101532:	1141                	addi	sp,sp,-16
f0101534:	c226                	sw	s1,4(sp)
f0101536:	06800793          	li	a5,104
f010153a:	fff58493          	addi	s1,a1,-1
f010153e:	02f484b3          	mul	s1,s1,a5
f0101542:	c04a                	sw	s2,0(sp)
f0101544:	892e                	mv	s2,a1
f0101546:	c422                	sw	s0,8(sp)
f0101548:	c606                	sw	ra,12(sp)
f010154a:	07448593          	addi	a1,s1,116
f010154e:	26f9                	jal	f010191c <_malloc_r>
f0101550:	842a                	mv	s0,a0
f0101552:	cd01                	beqz	a0,f010156a <__sfmoreglue+0x38>
f0101554:	00052023          	sw	zero,0(a0)
f0101558:	01252223          	sw	s2,4(a0)
f010155c:	0531                	addi	a0,a0,12
f010155e:	c408                	sw	a0,8(s0)
f0101560:	06848613          	addi	a2,s1,104
f0101564:	4581                	li	a1,0
f0101566:	86dff0ef          	jal	ra,f0100dd2 <memset>
f010156a:	40b2                	lw	ra,12(sp)
f010156c:	8522                	mv	a0,s0
f010156e:	4422                	lw	s0,8(sp)
f0101570:	4492                	lw	s1,4(sp)
f0101572:	4902                	lw	s2,0(sp)
f0101574:	0141                	addi	sp,sp,16
f0101576:	8082                	ret

f0101578 <_cleanup>:
f0101578:	f01087b7          	lui	a5,0xf0108
f010157c:	48c7a503          	lw	a0,1164(a5) # f010848c <_sp+0xffffef3c>
f0101580:	b755                	j	f0101524 <_cleanup_r>

f0101582 <__sinit>:
f0101582:	4d1c                	lw	a5,24(a0)
f0101584:	e3bd                	bnez	a5,f01015ea <__sinit+0x68>
f0101586:	1141                	addi	sp,sp,-16
f0101588:	f01017b7          	lui	a5,0xf0101
f010158c:	c422                	sw	s0,8(sp)
f010158e:	c606                	sw	ra,12(sp)
f0101590:	52478793          	addi	a5,a5,1316 # f0101524 <_sp+0xffff7fd4>
f0101594:	d51c                	sw	a5,40(a0)
f0101596:	f01087b7          	lui	a5,0xf0108
f010159a:	48c7a783          	lw	a5,1164(a5) # f010848c <_sp+0xffffef3c>
f010159e:	04052423          	sw	zero,72(a0)
f01015a2:	04052623          	sw	zero,76(a0)
f01015a6:	04052823          	sw	zero,80(a0)
f01015aa:	842a                	mv	s0,a0
f01015ac:	00f51463          	bne	a0,a5,f01015b4 <__sinit+0x32>
f01015b0:	4785                	li	a5,1
f01015b2:	cd1c                	sw	a5,24(a0)
f01015b4:	8522                	mv	a0,s0
f01015b6:	281d                	jal	f01015ec <__sfp>
f01015b8:	c048                	sw	a0,4(s0)
f01015ba:	8522                	mv	a0,s0
f01015bc:	2805                	jal	f01015ec <__sfp>
f01015be:	c408                	sw	a0,8(s0)
f01015c0:	8522                	mv	a0,s0
f01015c2:	202d                	jal	f01015ec <__sfp>
f01015c4:	c448                	sw	a0,12(s0)
f01015c6:	4048                	lw	a0,4(s0)
f01015c8:	4601                	li	a2,0
f01015ca:	4591                	li	a1,4
f01015cc:	35fd                	jal	f01014ba <std>
f01015ce:	4408                	lw	a0,8(s0)
f01015d0:	4605                	li	a2,1
f01015d2:	45a5                	li	a1,9
f01015d4:	35dd                	jal	f01014ba <std>
f01015d6:	4448                	lw	a0,12(s0)
f01015d8:	4609                	li	a2,2
f01015da:	45c9                	li	a1,18
f01015dc:	3df9                	jal	f01014ba <std>
f01015de:	4785                	li	a5,1
f01015e0:	40b2                	lw	ra,12(sp)
f01015e2:	cc1c                	sw	a5,24(s0)
f01015e4:	4422                	lw	s0,8(sp)
f01015e6:	0141                	addi	sp,sp,16
f01015e8:	8082                	ret
f01015ea:	8082                	ret

f01015ec <__sfp>:
f01015ec:	1141                	addi	sp,sp,-16
f01015ee:	f01087b7          	lui	a5,0xf0108
f01015f2:	c226                	sw	s1,4(sp)
f01015f4:	48c7a483          	lw	s1,1164(a5) # f010848c <_sp+0xffffef3c>
f01015f8:	c04a                	sw	s2,0(sp)
f01015fa:	c606                	sw	ra,12(sp)
f01015fc:	4c9c                	lw	a5,24(s1)
f01015fe:	c422                	sw	s0,8(sp)
f0101600:	892a                	mv	s2,a0
f0101602:	e399                	bnez	a5,f0101608 <__sfp+0x1c>
f0101604:	8526                	mv	a0,s1
f0101606:	3fb5                	jal	f0101582 <__sinit>
f0101608:	04848493          	addi	s1,s1,72
f010160c:	4480                	lw	s0,8(s1)
f010160e:	40dc                	lw	a5,4(s1)
f0101610:	17fd                	addi	a5,a5,-1
f0101612:	0007d663          	bgez	a5,f010161e <__sfp+0x32>
f0101616:	409c                	lw	a5,0(s1)
f0101618:	cfb9                	beqz	a5,f0101676 <__sfp+0x8a>
f010161a:	4084                	lw	s1,0(s1)
f010161c:	bfc5                	j	f010160c <__sfp+0x20>
f010161e:	00c41703          	lh	a4,12(s0)
f0101622:	e739                	bnez	a4,f0101670 <__sfp+0x84>
f0101624:	77c1                	lui	a5,0xffff0
f0101626:	0785                	addi	a5,a5,1
f0101628:	06042223          	sw	zero,100(s0)
f010162c:	00042023          	sw	zero,0(s0)
f0101630:	00042223          	sw	zero,4(s0)
f0101634:	00042423          	sw	zero,8(s0)
f0101638:	c45c                	sw	a5,12(s0)
f010163a:	00042823          	sw	zero,16(s0)
f010163e:	00042a23          	sw	zero,20(s0)
f0101642:	00042c23          	sw	zero,24(s0)
f0101646:	4621                	li	a2,8
f0101648:	4581                	li	a1,0
f010164a:	05c40513          	addi	a0,s0,92
f010164e:	f84ff0ef          	jal	ra,f0100dd2 <memset>
f0101652:	02042a23          	sw	zero,52(s0)
f0101656:	02042c23          	sw	zero,56(s0)
f010165a:	04042423          	sw	zero,72(s0)
f010165e:	04042623          	sw	zero,76(s0)
f0101662:	40b2                	lw	ra,12(sp)
f0101664:	8522                	mv	a0,s0
f0101666:	4422                	lw	s0,8(sp)
f0101668:	4492                	lw	s1,4(sp)
f010166a:	4902                	lw	s2,0(sp)
f010166c:	0141                	addi	sp,sp,16
f010166e:	8082                	ret
f0101670:	06840413          	addi	s0,s0,104
f0101674:	bf71                	j	f0101610 <__sfp+0x24>
f0101676:	4591                	li	a1,4
f0101678:	854a                	mv	a0,s2
f010167a:	3d65                	jal	f0101532 <__sfmoreglue>
f010167c:	c088                	sw	a0,0(s1)
f010167e:	842a                	mv	s0,a0
f0101680:	fd49                	bnez	a0,f010161a <__sfp+0x2e>
f0101682:	47b1                	li	a5,12
f0101684:	00f92023          	sw	a5,0(s2)
f0101688:	bfe9                	j	f0101662 <__sfp+0x76>

f010168a <__sfp_lock_acquire>:
f010168a:	8082                	ret

f010168c <__sfp_lock_release>:
f010168c:	8082                	ret

f010168e <__sinit_lock_acquire>:
f010168e:	8082                	ret

f0101690 <__sinit_lock_release>:
f0101690:	8082                	ret

f0101692 <__fp_lock_all>:
f0101692:	f01087b7          	lui	a5,0xf0108
f0101696:	4947a503          	lw	a0,1172(a5) # f0108494 <_sp+0xffffef44>
f010169a:	f01015b7          	lui	a1,0xf0101
f010169e:	4b658593          	addi	a1,a1,1206 # f01014b6 <_sp+0xffff7f66>
f01016a2:	a811                	j	f01016b6 <_fwalk>

f01016a4 <__fp_unlock_all>:
f01016a4:	f01087b7          	lui	a5,0xf0108
f01016a8:	4947a503          	lw	a0,1172(a5) # f0108494 <_sp+0xffffef44>
f01016ac:	f01015b7          	lui	a1,0xf0101
f01016b0:	52e58593          	addi	a1,a1,1326 # f010152e <_sp+0xffff7fde>
f01016b4:	a009                	j	f01016b6 <_fwalk>

f01016b6 <_fwalk>:
f01016b6:	1101                	addi	sp,sp,-32
f01016b8:	cc22                	sw	s0,24(sp)
f01016ba:	c84a                	sw	s2,16(sp)
f01016bc:	c64e                	sw	s3,12(sp)
f01016be:	c256                	sw	s5,4(sp)
f01016c0:	c05a                	sw	s6,0(sp)
f01016c2:	ce06                	sw	ra,28(sp)
f01016c4:	ca26                	sw	s1,20(sp)
f01016c6:	c452                	sw	s4,8(sp)
f01016c8:	89ae                	mv	s3,a1
f01016ca:	04850413          	addi	s0,a0,72
f01016ce:	4901                	li	s2,0
f01016d0:	4a85                	li	s5,1
f01016d2:	5b7d                	li	s6,-1
f01016d4:	4404                	lw	s1,8(s0)
f01016d6:	00442a03          	lw	s4,4(s0)
f01016da:	1a7d                	addi	s4,s4,-1
f01016dc:	000a5f63          	bgez	s4,f01016fa <_fwalk+0x44>
f01016e0:	4000                	lw	s0,0(s0)
f01016e2:	f86d                	bnez	s0,f01016d4 <_fwalk+0x1e>
f01016e4:	40f2                	lw	ra,28(sp)
f01016e6:	4462                	lw	s0,24(sp)
f01016e8:	44d2                	lw	s1,20(sp)
f01016ea:	49b2                	lw	s3,12(sp)
f01016ec:	4a22                	lw	s4,8(sp)
f01016ee:	4a92                	lw	s5,4(sp)
f01016f0:	4b02                	lw	s6,0(sp)
f01016f2:	854a                	mv	a0,s2
f01016f4:	4942                	lw	s2,16(sp)
f01016f6:	6105                	addi	sp,sp,32
f01016f8:	8082                	ret
f01016fa:	00c4d783          	lhu	a5,12(s1)
f01016fe:	00fafa63          	bgeu	s5,a5,f0101712 <_fwalk+0x5c>
f0101702:	00e49783          	lh	a5,14(s1)
f0101706:	01678663          	beq	a5,s6,f0101712 <_fwalk+0x5c>
f010170a:	8526                	mv	a0,s1
f010170c:	9982                	jalr	s3
f010170e:	00a96933          	or	s2,s2,a0
f0101712:	06848493          	addi	s1,s1,104
f0101716:	b7d1                	j	f01016da <_fwalk+0x24>

f0101718 <_fwalk_reent>:
f0101718:	7179                	addi	sp,sp,-48
f010171a:	d422                	sw	s0,40(sp)
f010171c:	d04a                	sw	s2,32(sp)
f010171e:	ce4e                	sw	s3,28(sp)
f0101720:	cc52                	sw	s4,24(sp)
f0101722:	c85a                	sw	s6,16(sp)
f0101724:	c65e                	sw	s7,12(sp)
f0101726:	d606                	sw	ra,44(sp)
f0101728:	d226                	sw	s1,36(sp)
f010172a:	ca56                	sw	s5,20(sp)
f010172c:	892a                	mv	s2,a0
f010172e:	8a2e                	mv	s4,a1
f0101730:	04850413          	addi	s0,a0,72
f0101734:	4981                	li	s3,0
f0101736:	4b05                	li	s6,1
f0101738:	5bfd                	li	s7,-1
f010173a:	4404                	lw	s1,8(s0)
f010173c:	00442a83          	lw	s5,4(s0)
f0101740:	1afd                	addi	s5,s5,-1
f0101742:	020ad063          	bgez	s5,f0101762 <_fwalk_reent+0x4a>
f0101746:	4000                	lw	s0,0(s0)
f0101748:	f86d                	bnez	s0,f010173a <_fwalk_reent+0x22>
f010174a:	50b2                	lw	ra,44(sp)
f010174c:	5422                	lw	s0,40(sp)
f010174e:	5492                	lw	s1,36(sp)
f0101750:	5902                	lw	s2,32(sp)
f0101752:	4a62                	lw	s4,24(sp)
f0101754:	4ad2                	lw	s5,20(sp)
f0101756:	4b42                	lw	s6,16(sp)
f0101758:	4bb2                	lw	s7,12(sp)
f010175a:	854e                	mv	a0,s3
f010175c:	49f2                	lw	s3,28(sp)
f010175e:	6145                	addi	sp,sp,48
f0101760:	8082                	ret
f0101762:	00c4d783          	lhu	a5,12(s1)
f0101766:	00fb7b63          	bgeu	s6,a5,f010177c <_fwalk_reent+0x64>
f010176a:	00e49783          	lh	a5,14(s1)
f010176e:	01778763          	beq	a5,s7,f010177c <_fwalk_reent+0x64>
f0101772:	85a6                	mv	a1,s1
f0101774:	854a                	mv	a0,s2
f0101776:	9a02                	jalr	s4
f0101778:	00a9e9b3          	or	s3,s3,a0
f010177c:	06848493          	addi	s1,s1,104
f0101780:	b7c1                	j	f0101740 <_fwalk_reent+0x28>

f0101782 <__swhatbuf_r>:
f0101782:	7159                	addi	sp,sp,-112
f0101784:	d4a2                	sw	s0,104(sp)
f0101786:	842e                	mv	s0,a1
f0101788:	00e59583          	lh	a1,14(a1)
f010178c:	d2a6                	sw	s1,100(sp)
f010178e:	d0ca                	sw	s2,96(sp)
f0101790:	d686                	sw	ra,108(sp)
f0101792:	84b2                	mv	s1,a2
f0101794:	8936                	mv	s2,a3
f0101796:	0205d463          	bgez	a1,f01017be <__swhatbuf_r+0x3c>
f010179a:	00c45783          	lhu	a5,12(s0)
f010179e:	0807f793          	andi	a5,a5,128
f01017a2:	cf85                	beqz	a5,f01017da <__swhatbuf_r+0x58>
f01017a4:	4781                	li	a5,0
f01017a6:	04000713          	li	a4,64
f01017aa:	50b6                	lw	ra,108(sp)
f01017ac:	5426                	lw	s0,104(sp)
f01017ae:	00f92023          	sw	a5,0(s2)
f01017b2:	c098                	sw	a4,0(s1)
f01017b4:	5906                	lw	s2,96(sp)
f01017b6:	5496                	lw	s1,100(sp)
f01017b8:	4501                	li	a0,0
f01017ba:	6165                	addi	sp,sp,112
f01017bc:	8082                	ret
f01017be:	0030                	addi	a2,sp,8
f01017c0:	2669                	jal	f0101b4a <_fstat_r>
f01017c2:	fc054ce3          	bltz	a0,f010179a <__swhatbuf_r+0x18>
f01017c6:	4732                	lw	a4,12(sp)
f01017c8:	67bd                	lui	a5,0xf
f01017ca:	8ff9                	and	a5,a5,a4
f01017cc:	7779                	lui	a4,0xffffe
f01017ce:	97ba                	add	a5,a5,a4
f01017d0:	0017b793          	seqz	a5,a5
f01017d4:	40000713          	li	a4,1024
f01017d8:	bfc9                	j	f01017aa <__swhatbuf_r+0x28>
f01017da:	4781                	li	a5,0
f01017dc:	bfe5                	j	f01017d4 <__swhatbuf_r+0x52>

f01017de <__smakebuf_r>:
f01017de:	00c5d783          	lhu	a5,12(a1)
f01017e2:	1101                	addi	sp,sp,-32
f01017e4:	cc22                	sw	s0,24(sp)
f01017e6:	ce06                	sw	ra,28(sp)
f01017e8:	ca26                	sw	s1,20(sp)
f01017ea:	c84a                	sw	s2,16(sp)
f01017ec:	8b89                	andi	a5,a5,2
f01017ee:	842e                	mv	s0,a1
f01017f0:	cf89                	beqz	a5,f010180a <__smakebuf_r+0x2c>
f01017f2:	04740793          	addi	a5,s0,71
f01017f6:	c01c                	sw	a5,0(s0)
f01017f8:	c81c                	sw	a5,16(s0)
f01017fa:	4785                	li	a5,1
f01017fc:	c85c                	sw	a5,20(s0)
f01017fe:	40f2                	lw	ra,28(sp)
f0101800:	4462                	lw	s0,24(sp)
f0101802:	44d2                	lw	s1,20(sp)
f0101804:	4942                	lw	s2,16(sp)
f0101806:	6105                	addi	sp,sp,32
f0101808:	8082                	ret
f010180a:	0074                	addi	a3,sp,12
f010180c:	0030                	addi	a2,sp,8
f010180e:	84aa                	mv	s1,a0
f0101810:	3f8d                	jal	f0101782 <__swhatbuf_r>
f0101812:	45a2                	lw	a1,8(sp)
f0101814:	892a                	mv	s2,a0
f0101816:	8526                	mv	a0,s1
f0101818:	2211                	jal	f010191c <_malloc_r>
f010181a:	ed01                	bnez	a0,f0101832 <__smakebuf_r+0x54>
f010181c:	00c41783          	lh	a5,12(s0)
f0101820:	2007f713          	andi	a4,a5,512
f0101824:	ff69                	bnez	a4,f01017fe <__smakebuf_r+0x20>
f0101826:	9bf1                	andi	a5,a5,-4
f0101828:	0027e793          	ori	a5,a5,2
f010182c:	00f41623          	sh	a5,12(s0)
f0101830:	b7c9                	j	f01017f2 <__smakebuf_r+0x14>
f0101832:	f01017b7          	lui	a5,0xf0101
f0101836:	52478793          	addi	a5,a5,1316 # f0101524 <_sp+0xffff7fd4>
f010183a:	d49c                	sw	a5,40(s1)
f010183c:	00c45783          	lhu	a5,12(s0)
f0101840:	c008                	sw	a0,0(s0)
f0101842:	c808                	sw	a0,16(s0)
f0101844:	0807e793          	ori	a5,a5,128
f0101848:	00f41623          	sh	a5,12(s0)
f010184c:	47a2                	lw	a5,8(sp)
f010184e:	c85c                	sw	a5,20(s0)
f0101850:	47b2                	lw	a5,12(sp)
f0101852:	cf89                	beqz	a5,f010186c <__smakebuf_r+0x8e>
f0101854:	00e41583          	lh	a1,14(s0)
f0101858:	8526                	mv	a0,s1
f010185a:	260d                	jal	f0101b7c <_isatty_r>
f010185c:	c901                	beqz	a0,f010186c <__smakebuf_r+0x8e>
f010185e:	00c45783          	lhu	a5,12(s0)
f0101862:	9bf1                	andi	a5,a5,-4
f0101864:	0017e793          	ori	a5,a5,1
f0101868:	00f41623          	sh	a5,12(s0)
f010186c:	00c45783          	lhu	a5,12(s0)
f0101870:	0127e533          	or	a0,a5,s2
f0101874:	00a41623          	sh	a0,12(s0)
f0101878:	b759                	j	f01017fe <__smakebuf_r+0x20>

f010187a <_free_r>:
f010187a:	c1c5                	beqz	a1,f010191a <_free_r+0xa0>
f010187c:	ffc5a783          	lw	a5,-4(a1)
f0101880:	1101                	addi	sp,sp,-32
f0101882:	cc22                	sw	s0,24(sp)
f0101884:	ce06                	sw	ra,28(sp)
f0101886:	ffc58413          	addi	s0,a1,-4
f010188a:	0007d363          	bgez	a5,f0101890 <_free_r+0x16>
f010188e:	943e                	add	s0,s0,a5
f0101890:	c62a                	sw	a0,12(sp)
f0101892:	26b9                	jal	f0101be0 <__malloc_lock>
f0101894:	f0108737          	lui	a4,0xf0108
f0101898:	4a472783          	lw	a5,1188(a4) # f01084a4 <_sp+0xffffef54>
f010189c:	4532                	lw	a0,12(sp)
f010189e:	eb89                	bnez	a5,f01018b0 <_free_r+0x36>
f01018a0:	00042223          	sw	zero,4(s0)
f01018a4:	4a872223          	sw	s0,1188(a4)
f01018a8:	4462                	lw	s0,24(sp)
f01018aa:	40f2                	lw	ra,28(sp)
f01018ac:	6105                	addi	sp,sp,32
f01018ae:	ae15                	j	f0101be2 <__malloc_unlock>
f01018b0:	00f47d63          	bgeu	s0,a5,f01018ca <_free_r+0x50>
f01018b4:	4010                	lw	a2,0(s0)
f01018b6:	00c406b3          	add	a3,s0,a2
f01018ba:	00d79663          	bne	a5,a3,f01018c6 <_free_r+0x4c>
f01018be:	4394                	lw	a3,0(a5)
f01018c0:	43dc                	lw	a5,4(a5)
f01018c2:	96b2                	add	a3,a3,a2
f01018c4:	c014                	sw	a3,0(s0)
f01018c6:	c05c                	sw	a5,4(s0)
f01018c8:	bff1                	j	f01018a4 <_free_r+0x2a>
f01018ca:	873e                	mv	a4,a5
f01018cc:	43dc                	lw	a5,4(a5)
f01018ce:	c399                	beqz	a5,f01018d4 <_free_r+0x5a>
f01018d0:	fef47de3          	bgeu	s0,a5,f01018ca <_free_r+0x50>
f01018d4:	4314                	lw	a3,0(a4)
f01018d6:	00d70633          	add	a2,a4,a3
f01018da:	00861f63          	bne	a2,s0,f01018f8 <_free_r+0x7e>
f01018de:	4010                	lw	a2,0(s0)
f01018e0:	96b2                	add	a3,a3,a2
f01018e2:	c314                	sw	a3,0(a4)
f01018e4:	00d70633          	add	a2,a4,a3
f01018e8:	fcc790e3          	bne	a5,a2,f01018a8 <_free_r+0x2e>
f01018ec:	4390                	lw	a2,0(a5)
f01018ee:	43dc                	lw	a5,4(a5)
f01018f0:	96b2                	add	a3,a3,a2
f01018f2:	c314                	sw	a3,0(a4)
f01018f4:	c35c                	sw	a5,4(a4)
f01018f6:	bf4d                	j	f01018a8 <_free_r+0x2e>
f01018f8:	00c47563          	bgeu	s0,a2,f0101902 <_free_r+0x88>
f01018fc:	47b1                	li	a5,12
f01018fe:	c11c                	sw	a5,0(a0)
f0101900:	b765                	j	f01018a8 <_free_r+0x2e>
f0101902:	4010                	lw	a2,0(s0)
f0101904:	00c406b3          	add	a3,s0,a2
f0101908:	00d79663          	bne	a5,a3,f0101914 <_free_r+0x9a>
f010190c:	4394                	lw	a3,0(a5)
f010190e:	43dc                	lw	a5,4(a5)
f0101910:	96b2                	add	a3,a3,a2
f0101912:	c014                	sw	a3,0(s0)
f0101914:	c05c                	sw	a5,4(s0)
f0101916:	c340                	sw	s0,4(a4)
f0101918:	bf41                	j	f01018a8 <_free_r+0x2e>
f010191a:	8082                	ret

f010191c <_malloc_r>:
f010191c:	1101                	addi	sp,sp,-32
f010191e:	ca26                	sw	s1,20(sp)
f0101920:	00358493          	addi	s1,a1,3
f0101924:	98f1                	andi	s1,s1,-4
f0101926:	c84a                	sw	s2,16(sp)
f0101928:	ce06                	sw	ra,28(sp)
f010192a:	cc22                	sw	s0,24(sp)
f010192c:	c64e                	sw	s3,12(sp)
f010192e:	04a1                	addi	s1,s1,8
f0101930:	47b1                	li	a5,12
f0101932:	892a                	mv	s2,a0
f0101934:	04f4f663          	bgeu	s1,a5,f0101980 <_malloc_r+0x64>
f0101938:	44b1                	li	s1,12
f010193a:	04b4e563          	bltu	s1,a1,f0101984 <_malloc_r+0x68>
f010193e:	854a                	mv	a0,s2
f0101940:	2445                	jal	f0101be0 <__malloc_lock>
f0101942:	f01087b7          	lui	a5,0xf0108
f0101946:	4a478713          	addi	a4,a5,1188 # f01084a4 <_sp+0xffffef54>
f010194a:	4318                	lw	a4,0(a4)
f010194c:	4a478693          	addi	a3,a5,1188
f0101950:	843a                	mv	s0,a4
f0101952:	e421                	bnez	s0,f010199a <_malloc_r+0x7e>
f0101954:	f0108437          	lui	s0,0xf0108
f0101958:	4a840413          	addi	s0,s0,1192 # f01084a8 <_sp+0xffffef58>
f010195c:	401c                	lw	a5,0(s0)
f010195e:	e789                	bnez	a5,f0101968 <_malloc_r+0x4c>
f0101960:	4581                	li	a1,0
f0101962:	854a                	mv	a0,s2
f0101964:	2851                	jal	f01019f8 <_sbrk_r>
f0101966:	c008                	sw	a0,0(s0)
f0101968:	85a6                	mv	a1,s1
f010196a:	854a                	mv	a0,s2
f010196c:	2071                	jal	f01019f8 <_sbrk_r>
f010196e:	59fd                	li	s3,-1
f0101970:	07351863          	bne	a0,s3,f01019e0 <_malloc_r+0xc4>
f0101974:	47b1                	li	a5,12
f0101976:	00f92023          	sw	a5,0(s2)
f010197a:	854a                	mv	a0,s2
f010197c:	249d                	jal	f0101be2 <__malloc_unlock>
f010197e:	a031                	j	f010198a <_malloc_r+0x6e>
f0101980:	fa04dde3          	bgez	s1,f010193a <_malloc_r+0x1e>
f0101984:	47b1                	li	a5,12
f0101986:	00f92023          	sw	a5,0(s2)
f010198a:	4501                	li	a0,0
f010198c:	40f2                	lw	ra,28(sp)
f010198e:	4462                	lw	s0,24(sp)
f0101990:	44d2                	lw	s1,20(sp)
f0101992:	4942                	lw	s2,16(sp)
f0101994:	49b2                	lw	s3,12(sp)
f0101996:	6105                	addi	sp,sp,32
f0101998:	8082                	ret
f010199a:	401c                	lw	a5,0(s0)
f010199c:	8f85                	sub	a5,a5,s1
f010199e:	0207ce63          	bltz	a5,f01019da <_malloc_r+0xbe>
f01019a2:	462d                	li	a2,11
f01019a4:	00f67663          	bgeu	a2,a5,f01019b0 <_malloc_r+0x94>
f01019a8:	c01c                	sw	a5,0(s0)
f01019aa:	943e                	add	s0,s0,a5
f01019ac:	c004                	sw	s1,0(s0)
f01019ae:	a029                	j	f01019b8 <_malloc_r+0x9c>
f01019b0:	405c                	lw	a5,4(s0)
f01019b2:	02871263          	bne	a4,s0,f01019d6 <_malloc_r+0xba>
f01019b6:	c29c                	sw	a5,0(a3)
f01019b8:	854a                	mv	a0,s2
f01019ba:	2425                	jal	f0101be2 <__malloc_unlock>
f01019bc:	00b40513          	addi	a0,s0,11
f01019c0:	00440793          	addi	a5,s0,4
f01019c4:	9961                	andi	a0,a0,-8
f01019c6:	40f50733          	sub	a4,a0,a5
f01019ca:	fcf501e3          	beq	a0,a5,f010198c <_malloc_r+0x70>
f01019ce:	943a                	add	s0,s0,a4
f01019d0:	8f89                	sub	a5,a5,a0
f01019d2:	c01c                	sw	a5,0(s0)
f01019d4:	bf65                	j	f010198c <_malloc_r+0x70>
f01019d6:	c35c                	sw	a5,4(a4)
f01019d8:	b7c5                	j	f01019b8 <_malloc_r+0x9c>
f01019da:	8722                	mv	a4,s0
f01019dc:	4040                	lw	s0,4(s0)
f01019de:	bf95                	j	f0101952 <_malloc_r+0x36>
f01019e0:	00350413          	addi	s0,a0,3
f01019e4:	9871                	andi	s0,s0,-4
f01019e6:	fc8503e3          	beq	a0,s0,f01019ac <_malloc_r+0x90>
f01019ea:	40a405b3          	sub	a1,s0,a0
f01019ee:	854a                	mv	a0,s2
f01019f0:	2021                	jal	f01019f8 <_sbrk_r>
f01019f2:	fb351de3          	bne	a0,s3,f01019ac <_malloc_r+0x90>
f01019f6:	bfbd                	j	f0101974 <_malloc_r+0x58>

f01019f8 <_sbrk_r>:
f01019f8:	1141                	addi	sp,sp,-16
f01019fa:	c422                	sw	s0,8(sp)
f01019fc:	c226                	sw	s1,4(sp)
f01019fe:	842a                	mv	s0,a0
f0101a00:	f01084b7          	lui	s1,0xf0108
f0101a04:	852e                	mv	a0,a1
f0101a06:	c606                	sw	ra,12(sp)
f0101a08:	4804ae23          	sw	zero,1180(s1) # f010849c <_sp+0xffffef4c>
f0101a0c:	ae6ff0ef          	jal	ra,f0100cf2 <_sbrk>
f0101a10:	57fd                	li	a5,-1
f0101a12:	00f51663          	bne	a0,a5,f0101a1e <_sbrk_r+0x26>
f0101a16:	49c4a783          	lw	a5,1180(s1)
f0101a1a:	c391                	beqz	a5,f0101a1e <_sbrk_r+0x26>
f0101a1c:	c01c                	sw	a5,0(s0)
f0101a1e:	40b2                	lw	ra,12(sp)
f0101a20:	4422                	lw	s0,8(sp)
f0101a22:	4492                	lw	s1,4(sp)
f0101a24:	0141                	addi	sp,sp,16
f0101a26:	8082                	ret

f0101a28 <__sread>:
f0101a28:	1141                	addi	sp,sp,-16
f0101a2a:	c422                	sw	s0,8(sp)
f0101a2c:	842e                	mv	s0,a1
f0101a2e:	00e59583          	lh	a1,14(a1)
f0101a32:	c606                	sw	ra,12(sp)
f0101a34:	2a45                	jal	f0101be4 <_read_r>
f0101a36:	00054963          	bltz	a0,f0101a48 <__sread+0x20>
f0101a3a:	487c                	lw	a5,84(s0)
f0101a3c:	97aa                	add	a5,a5,a0
f0101a3e:	c87c                	sw	a5,84(s0)
f0101a40:	40b2                	lw	ra,12(sp)
f0101a42:	4422                	lw	s0,8(sp)
f0101a44:	0141                	addi	sp,sp,16
f0101a46:	8082                	ret
f0101a48:	00c45783          	lhu	a5,12(s0)
f0101a4c:	777d                	lui	a4,0xfffff
f0101a4e:	177d                	addi	a4,a4,-1
f0101a50:	8ff9                	and	a5,a5,a4
f0101a52:	00f41623          	sh	a5,12(s0)
f0101a56:	b7ed                	j	f0101a40 <__sread+0x18>

f0101a58 <__seofread>:
f0101a58:	4501                	li	a0,0
f0101a5a:	8082                	ret

f0101a5c <__swrite>:
f0101a5c:	00c5d783          	lhu	a5,12(a1)
f0101a60:	1101                	addi	sp,sp,-32
f0101a62:	cc22                	sw	s0,24(sp)
f0101a64:	ca26                	sw	s1,20(sp)
f0101a66:	c84a                	sw	s2,16(sp)
f0101a68:	c64e                	sw	s3,12(sp)
f0101a6a:	ce06                	sw	ra,28(sp)
f0101a6c:	1007f793          	andi	a5,a5,256
f0101a70:	84aa                	mv	s1,a0
f0101a72:	842e                	mv	s0,a1
f0101a74:	8932                	mv	s2,a2
f0101a76:	89b6                	mv	s3,a3
f0101a78:	c791                	beqz	a5,f0101a84 <__swrite+0x28>
f0101a7a:	00e59583          	lh	a1,14(a1)
f0101a7e:	4689                	li	a3,2
f0101a80:	4601                	li	a2,0
f0101a82:	222d                	jal	f0101bac <_lseek_r>
f0101a84:	00c45783          	lhu	a5,12(s0)
f0101a88:	777d                	lui	a4,0xfffff
f0101a8a:	177d                	addi	a4,a4,-1
f0101a8c:	8ff9                	and	a5,a5,a4
f0101a8e:	00e41583          	lh	a1,14(s0)
f0101a92:	00f41623          	sh	a5,12(s0)
f0101a96:	4462                	lw	s0,24(sp)
f0101a98:	40f2                	lw	ra,28(sp)
f0101a9a:	86ce                	mv	a3,s3
f0101a9c:	864a                	mv	a2,s2
f0101a9e:	49b2                	lw	s3,12(sp)
f0101aa0:	4942                	lw	s2,16(sp)
f0101aa2:	8526                	mv	a0,s1
f0101aa4:	44d2                	lw	s1,20(sp)
f0101aa6:	6105                	addi	sp,sp,32
f0101aa8:	a83d                	j	f0101ae6 <_write_r>

f0101aaa <__sseek>:
f0101aaa:	1141                	addi	sp,sp,-16
f0101aac:	c422                	sw	s0,8(sp)
f0101aae:	842e                	mv	s0,a1
f0101ab0:	00e59583          	lh	a1,14(a1)
f0101ab4:	c606                	sw	ra,12(sp)
f0101ab6:	28dd                	jal	f0101bac <_lseek_r>
f0101ab8:	577d                	li	a4,-1
f0101aba:	00c45783          	lhu	a5,12(s0)
f0101abe:	00e51b63          	bne	a0,a4,f0101ad4 <__sseek+0x2a>
f0101ac2:	777d                	lui	a4,0xfffff
f0101ac4:	177d                	addi	a4,a4,-1
f0101ac6:	8ff9                	and	a5,a5,a4
f0101ac8:	00f41623          	sh	a5,12(s0)
f0101acc:	40b2                	lw	ra,12(sp)
f0101ace:	4422                	lw	s0,8(sp)
f0101ad0:	0141                	addi	sp,sp,16
f0101ad2:	8082                	ret
f0101ad4:	6705                	lui	a4,0x1
f0101ad6:	8fd9                	or	a5,a5,a4
f0101ad8:	00f41623          	sh	a5,12(s0)
f0101adc:	c868                	sw	a0,84(s0)
f0101ade:	b7fd                	j	f0101acc <__sseek+0x22>

f0101ae0 <__sclose>:
f0101ae0:	00e59583          	lh	a1,14(a1)
f0101ae4:	a81d                	j	f0101b1a <_close_r>

f0101ae6 <_write_r>:
f0101ae6:	1141                	addi	sp,sp,-16
f0101ae8:	c422                	sw	s0,8(sp)
f0101aea:	c226                	sw	s1,4(sp)
f0101aec:	842a                	mv	s0,a0
f0101aee:	f01084b7          	lui	s1,0xf0108
f0101af2:	852e                	mv	a0,a1
f0101af4:	85b2                	mv	a1,a2
f0101af6:	8636                	mv	a2,a3
f0101af8:	c606                	sw	ra,12(sp)
f0101afa:	4804ae23          	sw	zero,1180(s1) # f010849c <_sp+0xffffef4c>
f0101afe:	94aff0ef          	jal	ra,f0100c48 <_write>
f0101b02:	57fd                	li	a5,-1
f0101b04:	00f51663          	bne	a0,a5,f0101b10 <_write_r+0x2a>
f0101b08:	49c4a783          	lw	a5,1180(s1)
f0101b0c:	c391                	beqz	a5,f0101b10 <_write_r+0x2a>
f0101b0e:	c01c                	sw	a5,0(s0)
f0101b10:	40b2                	lw	ra,12(sp)
f0101b12:	4422                	lw	s0,8(sp)
f0101b14:	4492                	lw	s1,4(sp)
f0101b16:	0141                	addi	sp,sp,16
f0101b18:	8082                	ret

f0101b1a <_close_r>:
f0101b1a:	1141                	addi	sp,sp,-16
f0101b1c:	c422                	sw	s0,8(sp)
f0101b1e:	c226                	sw	s1,4(sp)
f0101b20:	842a                	mv	s0,a0
f0101b22:	f01084b7          	lui	s1,0xf0108
f0101b26:	852e                	mv	a0,a1
f0101b28:	c606                	sw	ra,12(sp)
f0101b2a:	4804ae23          	sw	zero,1180(s1) # f010849c <_sp+0xffffef4c>
f0101b2e:	8eeff0ef          	jal	ra,f0100c1c <_close>
f0101b32:	57fd                	li	a5,-1
f0101b34:	00f51663          	bne	a0,a5,f0101b40 <_close_r+0x26>
f0101b38:	49c4a783          	lw	a5,1180(s1)
f0101b3c:	c391                	beqz	a5,f0101b40 <_close_r+0x26>
f0101b3e:	c01c                	sw	a5,0(s0)
f0101b40:	40b2                	lw	ra,12(sp)
f0101b42:	4422                	lw	s0,8(sp)
f0101b44:	4492                	lw	s1,4(sp)
f0101b46:	0141                	addi	sp,sp,16
f0101b48:	8082                	ret

f0101b4a <_fstat_r>:
f0101b4a:	1141                	addi	sp,sp,-16
f0101b4c:	c422                	sw	s0,8(sp)
f0101b4e:	c226                	sw	s1,4(sp)
f0101b50:	842a                	mv	s0,a0
f0101b52:	f01084b7          	lui	s1,0xf0108
f0101b56:	852e                	mv	a0,a1
f0101b58:	85b2                	mv	a1,a2
f0101b5a:	c606                	sw	ra,12(sp)
f0101b5c:	4804ae23          	sw	zero,1180(s1) # f010849c <_sp+0xffffef4c>
f0101b60:	8d0ff0ef          	jal	ra,f0100c30 <_fstat>
f0101b64:	57fd                	li	a5,-1
f0101b66:	00f51663          	bne	a0,a5,f0101b72 <_fstat_r+0x28>
f0101b6a:	49c4a783          	lw	a5,1180(s1)
f0101b6e:	c391                	beqz	a5,f0101b72 <_fstat_r+0x28>
f0101b70:	c01c                	sw	a5,0(s0)
f0101b72:	40b2                	lw	ra,12(sp)
f0101b74:	4422                	lw	s0,8(sp)
f0101b76:	4492                	lw	s1,4(sp)
f0101b78:	0141                	addi	sp,sp,16
f0101b7a:	8082                	ret

f0101b7c <_isatty_r>:
f0101b7c:	1141                	addi	sp,sp,-16
f0101b7e:	c422                	sw	s0,8(sp)
f0101b80:	c226                	sw	s1,4(sp)
f0101b82:	842a                	mv	s0,a0
f0101b84:	f01084b7          	lui	s1,0xf0108
f0101b88:	852e                	mv	a0,a1
f0101b8a:	c606                	sw	ra,12(sp)
f0101b8c:	4804ae23          	sw	zero,1180(s1) # f010849c <_sp+0xffffef4c>
f0101b90:	8a8ff0ef          	jal	ra,f0100c38 <_isatty>
f0101b94:	57fd                	li	a5,-1
f0101b96:	00f51663          	bne	a0,a5,f0101ba2 <_isatty_r+0x26>
f0101b9a:	49c4a783          	lw	a5,1180(s1)
f0101b9e:	c391                	beqz	a5,f0101ba2 <_isatty_r+0x26>
f0101ba0:	c01c                	sw	a5,0(s0)
f0101ba2:	40b2                	lw	ra,12(sp)
f0101ba4:	4422                	lw	s0,8(sp)
f0101ba6:	4492                	lw	s1,4(sp)
f0101ba8:	0141                	addi	sp,sp,16
f0101baa:	8082                	ret

f0101bac <_lseek_r>:
f0101bac:	1141                	addi	sp,sp,-16
f0101bae:	c422                	sw	s0,8(sp)
f0101bb0:	c226                	sw	s1,4(sp)
f0101bb2:	842a                	mv	s0,a0
f0101bb4:	f01084b7          	lui	s1,0xf0108
f0101bb8:	852e                	mv	a0,a1
f0101bba:	85b2                	mv	a1,a2
f0101bbc:	8636                	mv	a2,a3
f0101bbe:	c606                	sw	ra,12(sp)
f0101bc0:	4804ae23          	sw	zero,1180(s1) # f010849c <_sp+0xffffef4c>
f0101bc4:	87cff0ef          	jal	ra,f0100c40 <_lseek>
f0101bc8:	57fd                	li	a5,-1
f0101bca:	00f51663          	bne	a0,a5,f0101bd6 <_lseek_r+0x2a>
f0101bce:	49c4a783          	lw	a5,1180(s1)
f0101bd2:	c391                	beqz	a5,f0101bd6 <_lseek_r+0x2a>
f0101bd4:	c01c                	sw	a5,0(s0)
f0101bd6:	40b2                	lw	ra,12(sp)
f0101bd8:	4422                	lw	s0,8(sp)
f0101bda:	4492                	lw	s1,4(sp)
f0101bdc:	0141                	addi	sp,sp,16
f0101bde:	8082                	ret

f0101be0 <__malloc_lock>:
f0101be0:	8082                	ret

f0101be2 <__malloc_unlock>:
f0101be2:	8082                	ret

f0101be4 <_read_r>:
f0101be4:	1141                	addi	sp,sp,-16
f0101be6:	c422                	sw	s0,8(sp)
f0101be8:	c226                	sw	s1,4(sp)
f0101bea:	842a                	mv	s0,a0
f0101bec:	f01084b7          	lui	s1,0xf0108
f0101bf0:	852e                	mv	a0,a1
f0101bf2:	85b2                	mv	a1,a2
f0101bf4:	8636                	mv	a2,a3
f0101bf6:	c606                	sw	ra,12(sp)
f0101bf8:	4804ae23          	sw	zero,1180(s1) # f010849c <_sp+0xffffef4c>
f0101bfc:	848ff0ef          	jal	ra,f0100c44 <_read>
f0101c00:	57fd                	li	a5,-1
f0101c02:	00f51663          	bne	a0,a5,f0101c0e <_read_r+0x2a>
f0101c06:	49c4a783          	lw	a5,1180(s1)
f0101c0a:	c391                	beqz	a5,f0101c0e <_read_r+0x2a>
f0101c0c:	c01c                	sw	a5,0(s0)
f0101c0e:	40b2                	lw	ra,12(sp)
f0101c10:	4422                	lw	s0,8(sp)
f0101c12:	4492                	lw	s1,4(sp)
f0101c14:	0141                	addi	sp,sp,16
f0101c16:	8082                	ret

f0101c18 <memcpy>:
f0101c18:	832a                	mv	t1,a0
f0101c1a:	ca09                	beqz	a2,f0101c2c <memcpy+0x14>
f0101c1c:	00058383          	lb	t2,0(a1)
f0101c20:	00730023          	sb	t2,0(t1)
f0101c24:	167d                	addi	a2,a2,-1
f0101c26:	0305                	addi	t1,t1,1
f0101c28:	0585                	addi	a1,a1,1
f0101c2a:	fa6d                	bnez	a2,f0101c1c <memcpy+0x4>
f0101c2c:	8082                	ret

f0101c2e <_iprintf_r>:
f0101c2e:	7139                	addi	sp,sp,-64
f0101c30:	cc22                	sw	s0,24(sp)
f0101c32:	ca26                	sw	s1,20(sp)
f0101c34:	ce06                	sw	ra,28(sp)
f0101c36:	d432                	sw	a2,40(sp)
f0101c38:	d636                	sw	a3,44(sp)
f0101c3a:	d83a                	sw	a4,48(sp)
f0101c3c:	da3e                	sw	a5,52(sp)
f0101c3e:	dc42                	sw	a6,56(sp)
f0101c40:	de46                	sw	a7,60(sp)
f0101c42:	842a                	mv	s0,a0
f0101c44:	84ae                	mv	s1,a1
f0101c46:	c509                	beqz	a0,f0101c50 <_iprintf_r+0x22>
f0101c48:	4d1c                	lw	a5,24(a0)
f0101c4a:	e399                	bnez	a5,f0101c50 <_iprintf_r+0x22>
f0101c4c:	937ff0ef          	jal	ra,f0101582 <__sinit>
f0101c50:	440c                	lw	a1,8(s0)
f0101c52:	1034                	addi	a3,sp,40
f0101c54:	8626                	mv	a2,s1
f0101c56:	8522                	mv	a0,s0
f0101c58:	c636                	sw	a3,12(sp)
f0101c5a:	28e1                	jal	f0101d32 <_vfiprintf_r>
f0101c5c:	40f2                	lw	ra,28(sp)
f0101c5e:	4462                	lw	s0,24(sp)
f0101c60:	44d2                	lw	s1,20(sp)
f0101c62:	6121                	addi	sp,sp,64
f0101c64:	8082                	ret

f0101c66 <iprintf>:
f0101c66:	715d                	addi	sp,sp,-80
f0101c68:	c2be                	sw	a5,68(sp)
f0101c6a:	f01087b7          	lui	a5,0xf0108
f0101c6e:	d422                	sw	s0,40(sp)
f0101c70:	842a                	mv	s0,a0
f0101c72:	4947a503          	lw	a0,1172(a5) # f0108494 <_sp+0xffffef44>
f0101c76:	d606                	sw	ra,44(sp)
f0101c78:	da2e                	sw	a1,52(sp)
f0101c7a:	dc32                	sw	a2,56(sp)
f0101c7c:	de36                	sw	a3,60(sp)
f0101c7e:	c0ba                	sw	a4,64(sp)
f0101c80:	c4c2                	sw	a6,72(sp)
f0101c82:	c6c6                	sw	a7,76(sp)
f0101c84:	c519                	beqz	a0,f0101c92 <iprintf+0x2c>
f0101c86:	4d1c                	lw	a5,24(a0)
f0101c88:	e789                	bnez	a5,f0101c92 <iprintf+0x2c>
f0101c8a:	c62a                	sw	a0,12(sp)
f0101c8c:	8f7ff0ef          	jal	ra,f0101582 <__sinit>
f0101c90:	4532                	lw	a0,12(sp)
f0101c92:	450c                	lw	a1,8(a0)
f0101c94:	1854                	addi	a3,sp,52
f0101c96:	8622                	mv	a2,s0
f0101c98:	ce36                	sw	a3,28(sp)
f0101c9a:	2861                	jal	f0101d32 <_vfiprintf_r>
f0101c9c:	50b2                	lw	ra,44(sp)
f0101c9e:	5422                	lw	s0,40(sp)
f0101ca0:	6161                	addi	sp,sp,80
f0101ca2:	8082                	ret

f0101ca4 <__sfputc_r>:
f0101ca4:	461c                	lw	a5,8(a2)
f0101ca6:	17fd                	addi	a5,a5,-1
f0101ca8:	c61c                	sw	a5,8(a2)
f0101caa:	0007da63          	bgez	a5,f0101cbe <__sfputc_r+0x1a>
f0101cae:	4e18                	lw	a4,24(a2)
f0101cb0:	00e7c563          	blt	a5,a4,f0101cba <__sfputc_r+0x16>
f0101cb4:	47a9                	li	a5,10
f0101cb6:	00f59463          	bne	a1,a5,f0101cbe <__sfputc_r+0x1a>
f0101cba:	b0cff06f          	j	f0100fc6 <__swbuf_r>
f0101cbe:	421c                	lw	a5,0(a2)
f0101cc0:	852e                	mv	a0,a1
f0101cc2:	00178713          	addi	a4,a5,1
f0101cc6:	c218                	sw	a4,0(a2)
f0101cc8:	00b78023          	sb	a1,0(a5)
f0101ccc:	8082                	ret

f0101cce <__sfputs_r>:
f0101cce:	1101                	addi	sp,sp,-32
f0101cd0:	cc22                	sw	s0,24(sp)
f0101cd2:	ca26                	sw	s1,20(sp)
f0101cd4:	c84a                	sw	s2,16(sp)
f0101cd6:	c64e                	sw	s3,12(sp)
f0101cd8:	c452                	sw	s4,8(sp)
f0101cda:	ce06                	sw	ra,28(sp)
f0101cdc:	892a                	mv	s2,a0
f0101cde:	89ae                	mv	s3,a1
f0101ce0:	8432                	mv	s0,a2
f0101ce2:	00d604b3          	add	s1,a2,a3
f0101ce6:	5a7d                	li	s4,-1
f0101ce8:	00941463          	bne	s0,s1,f0101cf0 <__sfputs_r+0x22>
f0101cec:	4501                	li	a0,0
f0101cee:	a809                	j	f0101d00 <__sfputs_r+0x32>
f0101cf0:	00044583          	lbu	a1,0(s0)
f0101cf4:	864e                	mv	a2,s3
f0101cf6:	854a                	mv	a0,s2
f0101cf8:	3775                	jal	f0101ca4 <__sfputc_r>
f0101cfa:	0405                	addi	s0,s0,1
f0101cfc:	ff4516e3          	bne	a0,s4,f0101ce8 <__sfputs_r+0x1a>
f0101d00:	40f2                	lw	ra,28(sp)
f0101d02:	4462                	lw	s0,24(sp)
f0101d04:	44d2                	lw	s1,20(sp)
f0101d06:	4942                	lw	s2,16(sp)
f0101d08:	49b2                	lw	s3,12(sp)
f0101d0a:	4a22                	lw	s4,8(sp)
f0101d0c:	6105                	addi	sp,sp,32
f0101d0e:	8082                	ret

f0101d10 <__sprint_r>:
f0101d10:	461c                	lw	a5,8(a2)
f0101d12:	1141                	addi	sp,sp,-16
f0101d14:	c422                	sw	s0,8(sp)
f0101d16:	c606                	sw	ra,12(sp)
f0101d18:	8432                	mv	s0,a2
f0101d1a:	cb91                	beqz	a5,f0101d2e <__sprint_r+0x1e>
f0101d1c:	24d9                	jal	f0101fe2 <__sfvwrite_r>
f0101d1e:	00042423          	sw	zero,8(s0)
f0101d22:	40b2                	lw	ra,12(sp)
f0101d24:	00042223          	sw	zero,4(s0)
f0101d28:	4422                	lw	s0,8(sp)
f0101d2a:	0141                	addi	sp,sp,16
f0101d2c:	8082                	ret
f0101d2e:	4501                	li	a0,0
f0101d30:	bfcd                	j	f0101d22 <__sprint_r+0x12>

f0101d32 <_vfiprintf_r>:
f0101d32:	7171                	addi	sp,sp,-176
f0101d34:	d522                	sw	s0,168(sp)
f0101d36:	d326                	sw	s1,164(sp)
f0101d38:	d14a                	sw	s2,160(sp)
f0101d3a:	cf4e                	sw	s3,156(sp)
f0101d3c:	d706                	sw	ra,172(sp)
f0101d3e:	cd52                	sw	s4,152(sp)
f0101d40:	cb56                	sw	s5,148(sp)
f0101d42:	c95a                	sw	s6,144(sp)
f0101d44:	c75e                	sw	s7,140(sp)
f0101d46:	c562                	sw	s8,136(sp)
f0101d48:	c366                	sw	s9,132(sp)
f0101d4a:	c16a                	sw	s10,128(sp)
f0101d4c:	deee                	sw	s11,124(sp)
f0101d4e:	89aa                	mv	s3,a0
f0101d50:	84ae                	mv	s1,a1
f0101d52:	8932                	mv	s2,a2
f0101d54:	8436                	mv	s0,a3
f0101d56:	c509                	beqz	a0,f0101d60 <_vfiprintf_r+0x2e>
f0101d58:	4d1c                	lw	a5,24(a0)
f0101d5a:	e399                	bnez	a5,f0101d60 <_vfiprintf_r+0x2e>
f0101d5c:	827ff0ef          	jal	ra,f0101582 <__sinit>
f0101d60:	f01087b7          	lui	a5,0xf0108
f0101d64:	25878793          	addi	a5,a5,600 # f0108258 <_sp+0xffffed08>
f0101d68:	0ef49463          	bne	s1,a5,f0101e50 <_vfiprintf_r+0x11e>
f0101d6c:	0049a483          	lw	s1,4(s3)
f0101d70:	00c4d783          	lhu	a5,12(s1)
f0101d74:	8ba1                	andi	a5,a5,8
f0101d76:	0e078f63          	beqz	a5,f0101e74 <_vfiprintf_r+0x142>
f0101d7a:	489c                	lw	a5,16(s1)
f0101d7c:	0e078c63          	beqz	a5,f0101e74 <_vfiprintf_r+0x142>
f0101d80:	02000793          	li	a5,32
f0101d84:	02f104a3          	sb	a5,41(sp)
f0101d88:	03000793          	li	a5,48
f0101d8c:	d202                	sw	zero,36(sp)
f0101d8e:	02f10523          	sb	a5,42(sp)
f0101d92:	c622                	sw	s0,12(sp)
f0101d94:	02500c93          	li	s9,37
f0101d98:	f0108b37          	lui	s6,0xf0108
f0101d9c:	f0108bb7          	lui	s7,0xf0108
f0101da0:	f0108d37          	lui	s10,0xf0108
f0101da4:	f0102c37          	lui	s8,0xf0102
f0101da8:	00000a93          	li	s5,0
f0101dac:	844a                	mv	s0,s2
f0101dae:	00044783          	lbu	a5,0(s0)
f0101db2:	c399                	beqz	a5,f0101db8 <_vfiprintf_r+0x86>
f0101db4:	0f979663          	bne	a5,s9,f0101ea0 <_vfiprintf_r+0x16e>
f0101db8:	41240db3          	sub	s11,s0,s2
f0101dbc:	01240d63          	beq	s0,s2,f0101dd6 <_vfiprintf_r+0xa4>
f0101dc0:	86ee                	mv	a3,s11
f0101dc2:	864a                	mv	a2,s2
f0101dc4:	85a6                	mv	a1,s1
f0101dc6:	854e                	mv	a0,s3
f0101dc8:	3719                	jal	f0101cce <__sfputs_r>
f0101dca:	57fd                	li	a5,-1
f0101dcc:	1ef50363          	beq	a0,a5,f0101fb2 <_vfiprintf_r+0x280>
f0101dd0:	5792                	lw	a5,36(sp)
f0101dd2:	97ee                	add	a5,a5,s11
f0101dd4:	d23e                	sw	a5,36(sp)
f0101dd6:	00044783          	lbu	a5,0(s0)
f0101dda:	1c078c63          	beqz	a5,f0101fb2 <_vfiprintf_r+0x280>
f0101dde:	57fd                	li	a5,-1
f0101de0:	00140913          	addi	s2,s0,1
f0101de4:	c802                	sw	zero,16(sp)
f0101de6:	ce02                	sw	zero,28(sp)
f0101de8:	ca3e                	sw	a5,20(sp)
f0101dea:	cc02                	sw	zero,24(sp)
f0101dec:	040109a3          	sb	zero,83(sp)
f0101df0:	d482                	sw	zero,104(sp)
f0101df2:	4d85                	li	s11,1
f0101df4:	00094583          	lbu	a1,0(s2)
f0101df8:	4615                	li	a2,5
f0101dfa:	298b0513          	addi	a0,s6,664 # f0108298 <_sp+0xffffed48>
f0101dfe:	2945                	jal	f01022ae <memchr>
f0101e00:	47c2                	lw	a5,16(sp)
f0101e02:	00190413          	addi	s0,s2,1
f0101e06:	ed59                	bnez	a0,f0101ea4 <_vfiprintf_r+0x172>
f0101e08:	0107f713          	andi	a4,a5,16
f0101e0c:	c709                	beqz	a4,f0101e16 <_vfiprintf_r+0xe4>
f0101e0e:	02000713          	li	a4,32
f0101e12:	04e109a3          	sb	a4,83(sp)
f0101e16:	0087f713          	andi	a4,a5,8
f0101e1a:	c709                	beqz	a4,f0101e24 <_vfiprintf_r+0xf2>
f0101e1c:	02b00713          	li	a4,43
f0101e20:	04e109a3          	sb	a4,83(sp)
f0101e24:	00094683          	lbu	a3,0(s2)
f0101e28:	02a00713          	li	a4,42
f0101e2c:	08e68563          	beq	a3,a4,f0101eb6 <_vfiprintf_r+0x184>
f0101e30:	47f2                	lw	a5,28(sp)
f0101e32:	844a                	mv	s0,s2
f0101e34:	4681                	li	a3,0
f0101e36:	4625                	li	a2,9
f0101e38:	4529                	li	a0,10
f0101e3a:	00044703          	lbu	a4,0(s0)
f0101e3e:	00140593          	addi	a1,s0,1
f0101e42:	fd070713          	addi	a4,a4,-48 # fd0 <w25q.c.bd19d8c2+0x42e>
f0101e46:	0ae67d63          	bgeu	a2,a4,f0101f00 <_vfiprintf_r+0x1ce>
f0101e4a:	ceb5                	beqz	a3,f0101ec6 <_vfiprintf_r+0x194>
f0101e4c:	ce3e                	sw	a5,28(sp)
f0101e4e:	a8a5                	j	f0101ec6 <_vfiprintf_r+0x194>
f0101e50:	f01087b7          	lui	a5,0xf0108
f0101e54:	27878793          	addi	a5,a5,632 # f0108278 <_sp+0xffffed28>
f0101e58:	00f49563          	bne	s1,a5,f0101e62 <_vfiprintf_r+0x130>
f0101e5c:	0089a483          	lw	s1,8(s3)
f0101e60:	bf01                	j	f0101d70 <_vfiprintf_r+0x3e>
f0101e62:	f01087b7          	lui	a5,0xf0108
f0101e66:	23878793          	addi	a5,a5,568 # f0108238 <_sp+0xffffece8>
f0101e6a:	f0f493e3          	bne	s1,a5,f0101d70 <_vfiprintf_r+0x3e>
f0101e6e:	00c9a483          	lw	s1,12(s3)
f0101e72:	bdfd                	j	f0101d70 <_vfiprintf_r+0x3e>
f0101e74:	85a6                	mv	a1,s1
f0101e76:	854e                	mv	a0,s3
f0101e78:	a1cff0ef          	jal	ra,f0101094 <__swsetup_r>
f0101e7c:	f00502e3          	beqz	a0,f0101d80 <_vfiprintf_r+0x4e>
f0101e80:	557d                	li	a0,-1
f0101e82:	50ba                	lw	ra,172(sp)
f0101e84:	542a                	lw	s0,168(sp)
f0101e86:	549a                	lw	s1,164(sp)
f0101e88:	590a                	lw	s2,160(sp)
f0101e8a:	49fa                	lw	s3,156(sp)
f0101e8c:	4a6a                	lw	s4,152(sp)
f0101e8e:	4ada                	lw	s5,148(sp)
f0101e90:	4b4a                	lw	s6,144(sp)
f0101e92:	4bba                	lw	s7,140(sp)
f0101e94:	4c2a                	lw	s8,136(sp)
f0101e96:	4c9a                	lw	s9,132(sp)
f0101e98:	4d0a                	lw	s10,128(sp)
f0101e9a:	5df6                	lw	s11,124(sp)
f0101e9c:	614d                	addi	sp,sp,176
f0101e9e:	8082                	ret
f0101ea0:	0405                	addi	s0,s0,1
f0101ea2:	b731                	j	f0101dae <_vfiprintf_r+0x7c>
f0101ea4:	298b0713          	addi	a4,s6,664
f0101ea8:	8d19                	sub	a0,a0,a4
f0101eaa:	00ad9533          	sll	a0,s11,a0
f0101eae:	8fc9                	or	a5,a5,a0
f0101eb0:	c83e                	sw	a5,16(sp)
f0101eb2:	8922                	mv	s2,s0
f0101eb4:	b781                	j	f0101df4 <_vfiprintf_r+0xc2>
f0101eb6:	4732                	lw	a4,12(sp)
f0101eb8:	00470693          	addi	a3,a4,4
f0101ebc:	4318                	lw	a4,0(a4)
f0101ebe:	c636                	sw	a3,12(sp)
f0101ec0:	02074963          	bltz	a4,f0101ef2 <_vfiprintf_r+0x1c0>
f0101ec4:	ce3a                	sw	a4,28(sp)
f0101ec6:	00044703          	lbu	a4,0(s0)
f0101eca:	02e00793          	li	a5,46
f0101ece:	06f71063          	bne	a4,a5,f0101f2e <_vfiprintf_r+0x1fc>
f0101ed2:	00144703          	lbu	a4,1(s0)
f0101ed6:	02a00793          	li	a5,42
f0101eda:	02f71b63          	bne	a4,a5,f0101f10 <_vfiprintf_r+0x1de>
f0101ede:	47b2                	lw	a5,12(sp)
f0101ee0:	0409                	addi	s0,s0,2
f0101ee2:	00478713          	addi	a4,a5,4
f0101ee6:	439c                	lw	a5,0(a5)
f0101ee8:	c63a                	sw	a4,12(sp)
f0101eea:	0207c163          	bltz	a5,f0101f0c <_vfiprintf_r+0x1da>
f0101eee:	ca3e                	sw	a5,20(sp)
f0101ef0:	a83d                	j	f0101f2e <_vfiprintf_r+0x1fc>
f0101ef2:	40e00733          	neg	a4,a4
f0101ef6:	0027e793          	ori	a5,a5,2
f0101efa:	ce3a                	sw	a4,28(sp)
f0101efc:	c83e                	sw	a5,16(sp)
f0101efe:	b7e1                	j	f0101ec6 <_vfiprintf_r+0x194>
f0101f00:	02a787b3          	mul	a5,a5,a0
f0101f04:	842e                	mv	s0,a1
f0101f06:	4685                	li	a3,1
f0101f08:	97ba                	add	a5,a5,a4
f0101f0a:	bf05                	j	f0101e3a <_vfiprintf_r+0x108>
f0101f0c:	57fd                	li	a5,-1
f0101f0e:	b7c5                	j	f0101eee <_vfiprintf_r+0x1bc>
f0101f10:	0405                	addi	s0,s0,1
f0101f12:	ca02                	sw	zero,20(sp)
f0101f14:	4681                	li	a3,0
f0101f16:	4781                	li	a5,0
f0101f18:	4625                	li	a2,9
f0101f1a:	4529                	li	a0,10
f0101f1c:	00044703          	lbu	a4,0(s0)
f0101f20:	00140593          	addi	a1,s0,1
f0101f24:	fd070713          	addi	a4,a4,-48
f0101f28:	04e67d63          	bgeu	a2,a4,f0101f82 <_vfiprintf_r+0x250>
f0101f2c:	f2e9                	bnez	a3,f0101eee <_vfiprintf_r+0x1bc>
f0101f2e:	00044583          	lbu	a1,0(s0)
f0101f32:	460d                	li	a2,3
f0101f34:	2a0b8513          	addi	a0,s7,672 # f01082a0 <_sp+0xffffed50>
f0101f38:	2e9d                	jal	f01022ae <memchr>
f0101f3a:	cd01                	beqz	a0,f0101f52 <_vfiprintf_r+0x220>
f0101f3c:	2a0b8793          	addi	a5,s7,672
f0101f40:	8d1d                	sub	a0,a0,a5
f0101f42:	47c2                	lw	a5,16(sp)
f0101f44:	04000713          	li	a4,64
f0101f48:	00a71733          	sll	a4,a4,a0
f0101f4c:	8fd9                	or	a5,a5,a4
f0101f4e:	0405                	addi	s0,s0,1
f0101f50:	c83e                	sw	a5,16(sp)
f0101f52:	00044583          	lbu	a1,0(s0)
f0101f56:	4619                	li	a2,6
f0101f58:	2a4d0513          	addi	a0,s10,676 # f01082a4 <_sp+0xffffed54>
f0101f5c:	00140913          	addi	s2,s0,1
f0101f60:	02b10423          	sb	a1,40(sp)
f0101f64:	26a9                	jal	f01022ae <memchr>
f0101f66:	cd31                	beqz	a0,f0101fc2 <_vfiprintf_r+0x290>
f0101f68:	020a9763          	bnez	s5,f0101f96 <_vfiprintf_r+0x264>
f0101f6c:	4742                	lw	a4,16(sp)
f0101f6e:	47b2                	lw	a5,12(sp)
f0101f70:	10077713          	andi	a4,a4,256
f0101f74:	cf09                	beqz	a4,f0101f8e <_vfiprintf_r+0x25c>
f0101f76:	0791                	addi	a5,a5,4
f0101f78:	c63e                	sw	a5,12(sp)
f0101f7a:	5792                	lw	a5,36(sp)
f0101f7c:	97d2                	add	a5,a5,s4
f0101f7e:	d23e                	sw	a5,36(sp)
f0101f80:	b535                	j	f0101dac <_vfiprintf_r+0x7a>
f0101f82:	02a787b3          	mul	a5,a5,a0
f0101f86:	842e                	mv	s0,a1
f0101f88:	4685                	li	a3,1
f0101f8a:	97ba                	add	a5,a5,a4
f0101f8c:	bf41                	j	f0101f1c <_vfiprintf_r+0x1ea>
f0101f8e:	079d                	addi	a5,a5,7
f0101f90:	9be1                	andi	a5,a5,-8
f0101f92:	07a1                	addi	a5,a5,8
f0101f94:	b7d5                	j	f0101f78 <_vfiprintf_r+0x246>
f0101f96:	0078                	addi	a4,sp,12
f0101f98:	ccec0693          	addi	a3,s8,-818 # f0101cce <_sp+0xffff877e>
f0101f9c:	8626                	mv	a2,s1
f0101f9e:	080c                	addi	a1,sp,16
f0101fa0:	854e                	mv	a0,s3
f0101fa2:	00000097          	auipc	ra,0x0
f0101fa6:	000000e7          	jalr	zero # 0 <_lma_vma_data_offset>
f0101faa:	57fd                	li	a5,-1
f0101fac:	8a2a                	mv	s4,a0
f0101fae:	fcf516e3          	bne	a0,a5,f0101f7a <_vfiprintf_r+0x248>
f0101fb2:	00c4d783          	lhu	a5,12(s1)
f0101fb6:	0407f793          	andi	a5,a5,64
f0101fba:	ec0793e3          	bnez	a5,f0101e80 <_vfiprintf_r+0x14e>
f0101fbe:	5512                	lw	a0,36(sp)
f0101fc0:	b5c9                	j	f0101e82 <_vfiprintf_r+0x150>
f0101fc2:	0078                	addi	a4,sp,12
f0101fc4:	ccec0693          	addi	a3,s8,-818
f0101fc8:	8626                	mv	a2,s1
f0101fca:	080c                	addi	a1,sp,16
f0101fcc:	854e                	mv	a0,s3
f0101fce:	2175                	jal	f010247a <_printf_i>
f0101fd0:	bfe9                	j	f0101faa <_vfiprintf_r+0x278>

f0101fd2 <vfiprintf>:
f0101fd2:	f01087b7          	lui	a5,0xf0108
f0101fd6:	86b2                	mv	a3,a2
f0101fd8:	862e                	mv	a2,a1
f0101fda:	85aa                	mv	a1,a0
f0101fdc:	4947a503          	lw	a0,1172(a5) # f0108494 <_sp+0xffffef44>
f0101fe0:	bb89                	j	f0101d32 <_vfiprintf_r>

f0101fe2 <__sfvwrite_r>:
f0101fe2:	461c                	lw	a5,8(a2)
f0101fe4:	e781                	bnez	a5,f0101fec <__sfvwrite_r+0xa>
f0101fe6:	4781                	li	a5,0
f0101fe8:	853e                	mv	a0,a5
f0101fea:	8082                	ret
f0101fec:	00c5d783          	lhu	a5,12(a1)
f0101ff0:	715d                	addi	sp,sp,-80
f0101ff2:	c4a2                	sw	s0,72(sp)
f0101ff4:	c0ca                	sw	s2,64(sp)
f0101ff6:	dc52                	sw	s4,56(sp)
f0101ff8:	c686                	sw	ra,76(sp)
f0101ffa:	c2a6                	sw	s1,68(sp)
f0101ffc:	de4e                	sw	s3,60(sp)
f0101ffe:	da56                	sw	s5,52(sp)
f0102000:	d85a                	sw	s6,48(sp)
f0102002:	d65e                	sw	s7,44(sp)
f0102004:	d462                	sw	s8,40(sp)
f0102006:	d266                	sw	s9,36(sp)
f0102008:	d06a                	sw	s10,32(sp)
f010200a:	ce6e                	sw	s11,28(sp)
f010200c:	8ba1                	andi	a5,a5,8
f010200e:	892a                	mv	s2,a0
f0102010:	842e                	mv	s0,a1
f0102012:	8a32                	mv	s4,a2
f0102014:	cbd9                	beqz	a5,f01020aa <__sfvwrite_r+0xc8>
f0102016:	499c                	lw	a5,16(a1)
f0102018:	cbc9                	beqz	a5,f01020aa <__sfvwrite_r+0xc8>
f010201a:	00c45783          	lhu	a5,12(s0)
f010201e:	000a2983          	lw	s3,0(s4)
f0102022:	0027f713          	andi	a4,a5,2
f0102026:	e37d                	bnez	a4,f010210c <__sfvwrite_r+0x12a>
f0102028:	8b85                	andi	a5,a5,1
f010202a:	14078f63          	beqz	a5,f0102188 <__sfvwrite_r+0x1a6>
f010202e:	4b81                	li	s7,0
f0102030:	4501                	li	a0,0
f0102032:	4b01                	li	s6,0
f0102034:	4a81                	li	s5,0
f0102036:	220a8e63          	beqz	s5,f0102272 <__sfvwrite_r+0x290>
f010203a:	e919                	bnez	a0,f0102050 <__sfvwrite_r+0x6e>
f010203c:	8656                	mv	a2,s5
f010203e:	45a9                	li	a1,10
f0102040:	855a                	mv	a0,s6
f0102042:	24b5                	jal	f01022ae <memchr>
f0102044:	001a8b93          	addi	s7,s5,1
f0102048:	c501                	beqz	a0,f0102050 <__sfvwrite_r+0x6e>
f010204a:	0505                	addi	a0,a0,1
f010204c:	41650bb3          	sub	s7,a0,s6
f0102050:	8c5e                	mv	s8,s7
f0102052:	017af363          	bgeu	s5,s7,f0102058 <__sfvwrite_r+0x76>
f0102056:	8c56                	mv	s8,s5
f0102058:	4008                	lw	a0,0(s0)
f010205a:	481c                	lw	a5,16(s0)
f010205c:	4404                	lw	s1,8(s0)
f010205e:	4854                	lw	a3,20(s0)
f0102060:	22a7f063          	bgeu	a5,a0,f0102280 <__sfvwrite_r+0x29e>
f0102064:	94b6                	add	s1,s1,a3
f0102066:	2184dd63          	bge	s1,s8,f0102280 <__sfvwrite_r+0x29e>
f010206a:	85da                	mv	a1,s6
f010206c:	8626                	mv	a2,s1
f010206e:	2ca9                	jal	f01022c8 <memmove>
f0102070:	401c                	lw	a5,0(s0)
f0102072:	85a2                	mv	a1,s0
f0102074:	854a                	mv	a0,s2
f0102076:	97a6                	add	a5,a5,s1
f0102078:	c01c                	sw	a5,0(s0)
f010207a:	bb8ff0ef          	jal	ra,f0101432 <_fflush_r>
f010207e:	0e051d63          	bnez	a0,f0102178 <__sfvwrite_r+0x196>
f0102082:	409b8bb3          	sub	s7,s7,s1
f0102086:	4505                	li	a0,1
f0102088:	000b9763          	bnez	s7,f0102096 <__sfvwrite_r+0xb4>
f010208c:	85a2                	mv	a1,s0
f010208e:	854a                	mv	a0,s2
f0102090:	ba2ff0ef          	jal	ra,f0101432 <_fflush_r>
f0102094:	e175                	bnez	a0,f0102178 <__sfvwrite_r+0x196>
f0102096:	008a2783          	lw	a5,8(s4)
f010209a:	9b26                	add	s6,s6,s1
f010209c:	409a8ab3          	sub	s5,s5,s1
f01020a0:	8f85                	sub	a5,a5,s1
f01020a2:	00fa2423          	sw	a5,8(s4)
f01020a6:	fbc1                	bnez	a5,f0102036 <__sfvwrite_r+0x54>
f01020a8:	a089                	j	f01020ea <__sfvwrite_r+0x108>
f01020aa:	85a2                	mv	a1,s0
f01020ac:	854a                	mv	a0,s2
f01020ae:	fe7fe0ef          	jal	ra,f0101094 <__swsetup_r>
f01020b2:	57fd                	li	a5,-1
f01020b4:	d13d                	beqz	a0,f010201a <__sfvwrite_r+0x38>
f01020b6:	a81d                	j	f01020ec <__sfvwrite_r+0x10a>
f01020b8:	0009aa83          	lw	s5,0(s3)
f01020bc:	0049a483          	lw	s1,4(s3)
f01020c0:	09a1                	addi	s3,s3,8
f01020c2:	541c                	lw	a5,40(s0)
f01020c4:	500c                	lw	a1,32(s0)
f01020c6:	d8ed                	beqz	s1,f01020b8 <__sfvwrite_r+0xd6>
f01020c8:	86a6                	mv	a3,s1
f01020ca:	009b7363          	bgeu	s6,s1,f01020d0 <__sfvwrite_r+0xee>
f01020ce:	86da                	mv	a3,s6
f01020d0:	8656                	mv	a2,s5
f01020d2:	854a                	mv	a0,s2
f01020d4:	9782                	jalr	a5
f01020d6:	0aa05163          	blez	a0,f0102178 <__sfvwrite_r+0x196>
f01020da:	008a2783          	lw	a5,8(s4)
f01020de:	9aaa                	add	s5,s5,a0
f01020e0:	8c89                	sub	s1,s1,a0
f01020e2:	8f89                	sub	a5,a5,a0
f01020e4:	00fa2423          	sw	a5,8(s4)
f01020e8:	ffe9                	bnez	a5,f01020c2 <__sfvwrite_r+0xe0>
f01020ea:	4781                	li	a5,0
f01020ec:	40b6                	lw	ra,76(sp)
f01020ee:	4426                	lw	s0,72(sp)
f01020f0:	4496                	lw	s1,68(sp)
f01020f2:	4906                	lw	s2,64(sp)
f01020f4:	59f2                	lw	s3,60(sp)
f01020f6:	5a62                	lw	s4,56(sp)
f01020f8:	5ad2                	lw	s5,52(sp)
f01020fa:	5b42                	lw	s6,48(sp)
f01020fc:	5bb2                	lw	s7,44(sp)
f01020fe:	5c22                	lw	s8,40(sp)
f0102100:	5c92                	lw	s9,36(sp)
f0102102:	5d02                	lw	s10,32(sp)
f0102104:	4df2                	lw	s11,28(sp)
f0102106:	853e                	mv	a0,a5
f0102108:	6161                	addi	sp,sp,80
f010210a:	8082                	ret
f010210c:	80000b37          	lui	s6,0x80000
f0102110:	4a81                	li	s5,0
f0102112:	4481                	li	s1,0
f0102114:	c00b4b13          	xori	s6,s6,-1024
f0102118:	b76d                	j	f01020c2 <__sfvwrite_r+0xe0>
f010211a:	0009aa83          	lw	s5,0(s3)
f010211e:	0049ad03          	lw	s10,4(s3)
f0102122:	09a1                	addi	s3,s3,8
f0102124:	00c41703          	lh	a4,12(s0)
f0102128:	4008                	lw	a0,0(s0)
f010212a:	4410                	lw	a2,8(s0)
f010212c:	fe0d07e3          	beqz	s10,f010211a <__sfvwrite_r+0x138>
f0102130:	01071793          	slli	a5,a4,0x10
f0102134:	20077713          	andi	a4,a4,512
f0102138:	83c1                	srli	a5,a5,0x10
f010213a:	c36d                	beqz	a4,f010221c <__sfvwrite_r+0x23a>
f010213c:	08cd6763          	bltu	s10,a2,f01021ca <__sfvwrite_r+0x1e8>
f0102140:	4807f713          	andi	a4,a5,1152
f0102144:	c359                	beqz	a4,f01021ca <__sfvwrite_r+0x1e8>
f0102146:	4844                	lw	s1,20(s0)
f0102148:	480c                	lw	a1,16(s0)
f010214a:	029c04b3          	mul	s1,s8,s1
f010214e:	40b50db3          	sub	s11,a0,a1
f0102152:	001d8713          	addi	a4,s11,1
f0102156:	976a                	add	a4,a4,s10
f0102158:	0394c4b3          	div	s1,s1,s9
f010215c:	00e4f363          	bgeu	s1,a4,f0102162 <__sfvwrite_r+0x180>
f0102160:	84ba                	mv	s1,a4
f0102162:	4007f793          	andi	a5,a5,1024
f0102166:	cbd9                	beqz	a5,f01021fc <__sfvwrite_r+0x21a>
f0102168:	85a6                	mv	a1,s1
f010216a:	854a                	mv	a0,s2
f010216c:	fb0ff0ef          	jal	ra,f010191c <_malloc_r>
f0102170:	e51d                	bnez	a0,f010219e <__sfvwrite_r+0x1bc>
f0102172:	47b1                	li	a5,12
f0102174:	00f92023          	sw	a5,0(s2)
f0102178:	00c45783          	lhu	a5,12(s0)
f010217c:	0407e793          	ori	a5,a5,64
f0102180:	00f41623          	sh	a5,12(s0)
f0102184:	57fd                	li	a5,-1
f0102186:	b79d                	j	f01020ec <__sfvwrite_r+0x10a>
f0102188:	80000b37          	lui	s6,0x80000
f010218c:	ffeb4b93          	xori	s7,s6,-2
f0102190:	4a81                	li	s5,0
f0102192:	4d01                	li	s10,0
f0102194:	fffb4b13          	not	s6,s6
f0102198:	4c0d                	li	s8,3
f010219a:	4c89                	li	s9,2
f010219c:	b761                	j	f0102124 <__sfvwrite_r+0x142>
f010219e:	480c                	lw	a1,16(s0)
f01021a0:	866e                	mv	a2,s11
f01021a2:	c62a                	sw	a0,12(sp)
f01021a4:	a75ff0ef          	jal	ra,f0101c18 <memcpy>
f01021a8:	00c45703          	lhu	a4,12(s0)
f01021ac:	47b2                	lw	a5,12(sp)
f01021ae:	b7f77713          	andi	a4,a4,-1153
f01021b2:	08076713          	ori	a4,a4,128
f01021b6:	00e41623          	sh	a4,12(s0)
f01021ba:	c81c                	sw	a5,16(s0)
f01021bc:	c844                	sw	s1,20(s0)
f01021be:	97ee                	add	a5,a5,s11
f01021c0:	41b484b3          	sub	s1,s1,s11
f01021c4:	c01c                	sw	a5,0(s0)
f01021c6:	866a                	mv	a2,s10
f01021c8:	c404                	sw	s1,8(s0)
f01021ca:	84ea                	mv	s1,s10
f01021cc:	00cd7363          	bgeu	s10,a2,f01021d2 <__sfvwrite_r+0x1f0>
f01021d0:	866a                	mv	a2,s10
f01021d2:	4008                	lw	a0,0(s0)
f01021d4:	85d6                	mv	a1,s5
f01021d6:	c632                	sw	a2,12(sp)
f01021d8:	28c5                	jal	f01022c8 <memmove>
f01021da:	441c                	lw	a5,8(s0)
f01021dc:	4632                	lw	a2,12(sp)
f01021de:	8f91                	sub	a5,a5,a2
f01021e0:	c41c                	sw	a5,8(s0)
f01021e2:	401c                	lw	a5,0(s0)
f01021e4:	97b2                	add	a5,a5,a2
f01021e6:	c01c                	sw	a5,0(s0)
f01021e8:	008a2783          	lw	a5,8(s4)
f01021ec:	9aa6                	add	s5,s5,s1
f01021ee:	409d0d33          	sub	s10,s10,s1
f01021f2:	8f85                	sub	a5,a5,s1
f01021f4:	00fa2423          	sw	a5,8(s4)
f01021f8:	f795                	bnez	a5,f0102124 <__sfvwrite_r+0x142>
f01021fa:	bdc5                	j	f01020ea <__sfvwrite_r+0x108>
f01021fc:	8626                	mv	a2,s1
f01021fe:	854a                	mv	a0,s2
f0102200:	20fd                	jal	f01022ee <_realloc_r>
f0102202:	87aa                	mv	a5,a0
f0102204:	f95d                	bnez	a0,f01021ba <__sfvwrite_r+0x1d8>
f0102206:	480c                	lw	a1,16(s0)
f0102208:	854a                	mv	a0,s2
f010220a:	e70ff0ef          	jal	ra,f010187a <_free_r>
f010220e:	00c45783          	lhu	a5,12(s0)
f0102212:	f7f7f793          	andi	a5,a5,-129
f0102216:	00f41623          	sh	a5,12(s0)
f010221a:	bfa1                	j	f0102172 <__sfvwrite_r+0x190>
f010221c:	481c                	lw	a5,16(s0)
f010221e:	00a7e563          	bltu	a5,a0,f0102228 <__sfvwrite_r+0x246>
f0102222:	4854                	lw	a3,20(s0)
f0102224:	02dd7663          	bgeu	s10,a3,f0102250 <__sfvwrite_r+0x26e>
f0102228:	84b2                	mv	s1,a2
f010222a:	00cd7363          	bgeu	s10,a2,f0102230 <__sfvwrite_r+0x24e>
f010222e:	84ea                	mv	s1,s10
f0102230:	8626                	mv	a2,s1
f0102232:	85d6                	mv	a1,s5
f0102234:	2851                	jal	f01022c8 <memmove>
f0102236:	441c                	lw	a5,8(s0)
f0102238:	4018                	lw	a4,0(s0)
f010223a:	8f85                	sub	a5,a5,s1
f010223c:	9726                	add	a4,a4,s1
f010223e:	c41c                	sw	a5,8(s0)
f0102240:	c018                	sw	a4,0(s0)
f0102242:	f3dd                	bnez	a5,f01021e8 <__sfvwrite_r+0x206>
f0102244:	85a2                	mv	a1,s0
f0102246:	854a                	mv	a0,s2
f0102248:	9eaff0ef          	jal	ra,f0101432 <_fflush_r>
f010224c:	dd51                	beqz	a0,f01021e8 <__sfvwrite_r+0x206>
f010224e:	b72d                	j	f0102178 <__sfvwrite_r+0x196>
f0102250:	87da                	mv	a5,s6
f0102252:	01abe363          	bltu	s7,s10,f0102258 <__sfvwrite_r+0x276>
f0102256:	87ea                	mv	a5,s10
f0102258:	02d7c7b3          	div	a5,a5,a3
f010225c:	5418                	lw	a4,40(s0)
f010225e:	500c                	lw	a1,32(s0)
f0102260:	8656                	mv	a2,s5
f0102262:	854a                	mv	a0,s2
f0102264:	02d786b3          	mul	a3,a5,a3
f0102268:	9702                	jalr	a4
f010226a:	84aa                	mv	s1,a0
f010226c:	f6a04ee3          	bgtz	a0,f01021e8 <__sfvwrite_r+0x206>
f0102270:	b721                	j	f0102178 <__sfvwrite_r+0x196>
f0102272:	0009ab03          	lw	s6,0(s3)
f0102276:	0049aa83          	lw	s5,4(s3)
f010227a:	4501                	li	a0,0
f010227c:	09a1                	addi	s3,s3,8
f010227e:	bb65                	j	f0102036 <__sfvwrite_r+0x54>
f0102280:	00dc4b63          	blt	s8,a3,f0102296 <__sfvwrite_r+0x2b4>
f0102284:	541c                	lw	a5,40(s0)
f0102286:	500c                	lw	a1,32(s0)
f0102288:	865a                	mv	a2,s6
f010228a:	854a                	mv	a0,s2
f010228c:	9782                	jalr	a5
f010228e:	84aa                	mv	s1,a0
f0102290:	dea049e3          	bgtz	a0,f0102082 <__sfvwrite_r+0xa0>
f0102294:	b5d5                	j	f0102178 <__sfvwrite_r+0x196>
f0102296:	8662                	mv	a2,s8
f0102298:	85da                	mv	a1,s6
f010229a:	203d                	jal	f01022c8 <memmove>
f010229c:	441c                	lw	a5,8(s0)
f010229e:	84e2                	mv	s1,s8
f01022a0:	418787b3          	sub	a5,a5,s8
f01022a4:	c41c                	sw	a5,8(s0)
f01022a6:	401c                	lw	a5,0(s0)
f01022a8:	97e2                	add	a5,a5,s8
f01022aa:	c01c                	sw	a5,0(s0)
f01022ac:	bbd9                	j	f0102082 <__sfvwrite_r+0xa0>

f01022ae <memchr>:
f01022ae:	0ff5f593          	zext.b	a1,a1
f01022b2:	962a                	add	a2,a2,a0
f01022b4:	00c51463          	bne	a0,a2,f01022bc <memchr+0xe>
f01022b8:	4501                	li	a0,0
f01022ba:	8082                	ret
f01022bc:	00054783          	lbu	a5,0(a0)
f01022c0:	feb78de3          	beq	a5,a1,f01022ba <memchr+0xc>
f01022c4:	0505                	addi	a0,a0,1
f01022c6:	b7fd                	j	f01022b4 <memchr+0x6>

f01022c8 <memmove>:
f01022c8:	c215                	beqz	a2,f01022ec <memmove+0x24>
f01022ca:	832a                	mv	t1,a0
f01022cc:	4685                	li	a3,1
f01022ce:	00b56763          	bltu	a0,a1,f01022dc <memmove+0x14>
f01022d2:	56fd                	li	a3,-1
f01022d4:	fff60713          	addi	a4,a2,-1
f01022d8:	933a                	add	t1,t1,a4
f01022da:	95ba                	add	a1,a1,a4
f01022dc:	00058383          	lb	t2,0(a1)
f01022e0:	00730023          	sb	t2,0(t1)
f01022e4:	167d                	addi	a2,a2,-1
f01022e6:	9336                	add	t1,t1,a3
f01022e8:	95b6                	add	a1,a1,a3
f01022ea:	fa6d                	bnez	a2,f01022dc <memmove+0x14>
f01022ec:	8082                	ret

f01022ee <_realloc_r>:
f01022ee:	1101                	addi	sp,sp,-32
f01022f0:	cc22                	sw	s0,24(sp)
f01022f2:	ce06                	sw	ra,28(sp)
f01022f4:	ca26                	sw	s1,20(sp)
f01022f6:	c84a                	sw	s2,16(sp)
f01022f8:	c64e                	sw	s3,12(sp)
f01022fa:	c452                	sw	s4,8(sp)
f01022fc:	8432                	mv	s0,a2
f01022fe:	e999                	bnez	a1,f0102314 <_realloc_r+0x26>
f0102300:	4462                	lw	s0,24(sp)
f0102302:	40f2                	lw	ra,28(sp)
f0102304:	44d2                	lw	s1,20(sp)
f0102306:	4942                	lw	s2,16(sp)
f0102308:	49b2                	lw	s3,12(sp)
f010230a:	4a22                	lw	s4,8(sp)
f010230c:	85b2                	mv	a1,a2
f010230e:	6105                	addi	sp,sp,32
f0102310:	e0cff06f          	j	f010191c <_malloc_r>
f0102314:	ee09                	bnez	a2,f010232e <_realloc_r+0x40>
f0102316:	d64ff0ef          	jal	ra,f010187a <_free_r>
f010231a:	4481                	li	s1,0
f010231c:	40f2                	lw	ra,28(sp)
f010231e:	4462                	lw	s0,24(sp)
f0102320:	4942                	lw	s2,16(sp)
f0102322:	49b2                	lw	s3,12(sp)
f0102324:	4a22                	lw	s4,8(sp)
f0102326:	8526                	mv	a0,s1
f0102328:	44d2                	lw	s1,20(sp)
f010232a:	6105                	addi	sp,sp,32
f010232c:	8082                	ret
f010232e:	8a2a                	mv	s4,a0
f0102330:	892e                	mv	s2,a1
f0102332:	266d                	jal	f01026dc <_malloc_usable_size_r>
f0102334:	89aa                	mv	s3,a0
f0102336:	00856763          	bltu	a0,s0,f0102344 <_realloc_r+0x56>
f010233a:	00155793          	srli	a5,a0,0x1
f010233e:	84ca                	mv	s1,s2
f0102340:	fc87eee3          	bltu	a5,s0,f010231c <_realloc_r+0x2e>
f0102344:	85a2                	mv	a1,s0
f0102346:	8552                	mv	a0,s4
f0102348:	dd4ff0ef          	jal	ra,f010191c <_malloc_r>
f010234c:	84aa                	mv	s1,a0
f010234e:	d579                	beqz	a0,f010231c <_realloc_r+0x2e>
f0102350:	8622                	mv	a2,s0
f0102352:	0089f363          	bgeu	s3,s0,f0102358 <_realloc_r+0x6a>
f0102356:	864e                	mv	a2,s3
f0102358:	85ca                	mv	a1,s2
f010235a:	8526                	mv	a0,s1
f010235c:	8bdff0ef          	jal	ra,f0101c18 <memcpy>
f0102360:	85ca                	mv	a1,s2
f0102362:	8552                	mv	a0,s4
f0102364:	d16ff0ef          	jal	ra,f010187a <_free_r>
f0102368:	bf55                	j	f010231c <_realloc_r+0x2e>

f010236a <_printf_common>:
f010236a:	7179                	addi	sp,sp,-48
f010236c:	cc52                	sw	s4,24(sp)
f010236e:	499c                	lw	a5,16(a1)
f0102370:	8a3a                	mv	s4,a4
f0102372:	4598                	lw	a4,8(a1)
f0102374:	d422                	sw	s0,40(sp)
f0102376:	d04a                	sw	s2,32(sp)
f0102378:	ce4e                	sw	s3,28(sp)
f010237a:	ca56                	sw	s5,20(sp)
f010237c:	d606                	sw	ra,44(sp)
f010237e:	d226                	sw	s1,36(sp)
f0102380:	c85a                	sw	s6,16(sp)
f0102382:	c65e                	sw	s7,12(sp)
f0102384:	89aa                	mv	s3,a0
f0102386:	842e                	mv	s0,a1
f0102388:	8932                	mv	s2,a2
f010238a:	8ab6                	mv	s5,a3
f010238c:	00e7d363          	bge	a5,a4,f0102392 <_printf_common+0x28>
f0102390:	87ba                	mv	a5,a4
f0102392:	00f92023          	sw	a5,0(s2)
f0102396:	04344703          	lbu	a4,67(s0)
f010239a:	c701                	beqz	a4,f01023a2 <_printf_common+0x38>
f010239c:	0785                	addi	a5,a5,1
f010239e:	00f92023          	sw	a5,0(s2)
f01023a2:	401c                	lw	a5,0(s0)
f01023a4:	0207f793          	andi	a5,a5,32
f01023a8:	c791                	beqz	a5,f01023b4 <_printf_common+0x4a>
f01023aa:	00092783          	lw	a5,0(s2)
f01023ae:	0789                	addi	a5,a5,2
f01023b0:	00f92023          	sw	a5,0(s2)
f01023b4:	4004                	lw	s1,0(s0)
f01023b6:	8899                	andi	s1,s1,6
f01023b8:	e891                	bnez	s1,f01023cc <_printf_common+0x62>
f01023ba:	01940b13          	addi	s6,s0,25
f01023be:	5bfd                	li	s7,-1
f01023c0:	445c                	lw	a5,12(s0)
f01023c2:	00092703          	lw	a4,0(s2)
f01023c6:	8f99                	sub	a5,a5,a4
f01023c8:	04f4cc63          	blt	s1,a5,f0102420 <_printf_common+0xb6>
f01023cc:	04344783          	lbu	a5,67(s0)
f01023d0:	00f036b3          	snez	a3,a5
f01023d4:	401c                	lw	a5,0(s0)
f01023d6:	0207f793          	andi	a5,a5,32
f01023da:	eba5                	bnez	a5,f010244a <_printf_common+0xe0>
f01023dc:	04340613          	addi	a2,s0,67
f01023e0:	85d6                	mv	a1,s5
f01023e2:	854e                	mv	a0,s3
f01023e4:	9a02                	jalr	s4
f01023e6:	57fd                	li	a5,-1
f01023e8:	04f50363          	beq	a0,a5,f010242e <_printf_common+0xc4>
f01023ec:	401c                	lw	a5,0(s0)
f01023ee:	4711                	li	a4,4
f01023f0:	4481                	li	s1,0
f01023f2:	8b99                	andi	a5,a5,6
f01023f4:	00e79963          	bne	a5,a4,f0102406 <_printf_common+0x9c>
f01023f8:	4444                	lw	s1,12(s0)
f01023fa:	00092783          	lw	a5,0(s2)
f01023fe:	8c9d                	sub	s1,s1,a5
f0102400:	0004d363          	bgez	s1,f0102406 <_printf_common+0x9c>
f0102404:	4481                	li	s1,0
f0102406:	441c                	lw	a5,8(s0)
f0102408:	4818                	lw	a4,16(s0)
f010240a:	00f75463          	bge	a4,a5,f0102412 <_printf_common+0xa8>
f010240e:	8f99                	sub	a5,a5,a4
f0102410:	94be                	add	s1,s1,a5
f0102412:	4901                	li	s2,0
f0102414:	0469                	addi	s0,s0,26
f0102416:	5b7d                	li	s6,-1
f0102418:	05249863          	bne	s1,s2,f0102468 <_printf_common+0xfe>
f010241c:	4501                	li	a0,0
f010241e:	a809                	j	f0102430 <_printf_common+0xc6>
f0102420:	4685                	li	a3,1
f0102422:	865a                	mv	a2,s6
f0102424:	85d6                	mv	a1,s5
f0102426:	854e                	mv	a0,s3
f0102428:	9a02                	jalr	s4
f010242a:	01751e63          	bne	a0,s7,f0102446 <_printf_common+0xdc>
f010242e:	557d                	li	a0,-1
f0102430:	50b2                	lw	ra,44(sp)
f0102432:	5422                	lw	s0,40(sp)
f0102434:	5492                	lw	s1,36(sp)
f0102436:	5902                	lw	s2,32(sp)
f0102438:	49f2                	lw	s3,28(sp)
f010243a:	4a62                	lw	s4,24(sp)
f010243c:	4ad2                	lw	s5,20(sp)
f010243e:	4b42                	lw	s6,16(sp)
f0102440:	4bb2                	lw	s7,12(sp)
f0102442:	6145                	addi	sp,sp,48
f0102444:	8082                	ret
f0102446:	0485                	addi	s1,s1,1
f0102448:	bfa5                	j	f01023c0 <_printf_common+0x56>
f010244a:	00d40733          	add	a4,s0,a3
f010244e:	03000613          	li	a2,48
f0102452:	04c701a3          	sb	a2,67(a4)
f0102456:	04544703          	lbu	a4,69(s0)
f010245a:	00168793          	addi	a5,a3,1 # 1001 <w25q.c.bd19d8c2+0x45f>
f010245e:	97a2                	add	a5,a5,s0
f0102460:	0689                	addi	a3,a3,2
f0102462:	04e781a3          	sb	a4,67(a5)
f0102466:	bf9d                	j	f01023dc <_printf_common+0x72>
f0102468:	4685                	li	a3,1
f010246a:	8622                	mv	a2,s0
f010246c:	85d6                	mv	a1,s5
f010246e:	854e                	mv	a0,s3
f0102470:	9a02                	jalr	s4
f0102472:	fb650ee3          	beq	a0,s6,f010242e <_printf_common+0xc4>
f0102476:	0905                	addi	s2,s2,1
f0102478:	b745                	j	f0102418 <_printf_common+0xae>

f010247a <_printf_i>:
f010247a:	7179                	addi	sp,sp,-48
f010247c:	d422                	sw	s0,40(sp)
f010247e:	d226                	sw	s1,36(sp)
f0102480:	d04a                	sw	s2,32(sp)
f0102482:	ce4e                	sw	s3,28(sp)
f0102484:	d606                	sw	ra,44(sp)
f0102486:	cc52                	sw	s4,24(sp)
f0102488:	ca56                	sw	s5,20(sp)
f010248a:	c85a                	sw	s6,16(sp)
f010248c:	0185c883          	lbu	a7,24(a1)
f0102490:	07800793          	li	a5,120
f0102494:	84aa                	mv	s1,a0
f0102496:	842e                	mv	s0,a1
f0102498:	8932                	mv	s2,a2
f010249a:	89b6                	mv	s3,a3
f010249c:	0117ee63          	bltu	a5,a7,f01024b8 <_printf_i+0x3e>
f01024a0:	06200793          	li	a5,98
f01024a4:	04358693          	addi	a3,a1,67
f01024a8:	0117ed63          	bltu	a5,a7,f01024c2 <_printf_i+0x48>
f01024ac:	1a088e63          	beqz	a7,f0102668 <_printf_i+0x1ee>
f01024b0:	05800793          	li	a5,88
f01024b4:	16f88f63          	beq	a7,a5,f0102632 <_printf_i+0x1b8>
f01024b8:	04240a93          	addi	s5,s0,66
f01024bc:	05140123          	sb	a7,66(s0)
f01024c0:	a80d                	j	f01024f2 <_printf_i+0x78>
f01024c2:	f9d88793          	addi	a5,a7,-99
f01024c6:	0ff7f793          	zext.b	a5,a5
f01024ca:	4655                	li	a2,21
f01024cc:	fef666e3          	bltu	a2,a5,f01024b8 <_printf_i+0x3e>
f01024d0:	f0108637          	lui	a2,0xf0108
f01024d4:	078a                	slli	a5,a5,0x2
f01024d6:	2d460613          	addi	a2,a2,724 # f01082d4 <_sp+0xffffed84>
f01024da:	97b2                	add	a5,a5,a2
f01024dc:	439c                	lw	a5,0(a5)
f01024de:	8782                	jr	a5
f01024e0:	431c                	lw	a5,0(a4)
f01024e2:	04258a93          	addi	s5,a1,66
f01024e6:	00478693          	addi	a3,a5,4
f01024ea:	439c                	lw	a5,0(a5)
f01024ec:	c314                	sw	a3,0(a4)
f01024ee:	04f58123          	sb	a5,66(a1)
f01024f2:	4785                	li	a5,1
f01024f4:	aa69                	j	f010268e <_printf_i+0x214>
f01024f6:	419c                	lw	a5,0(a1)
f01024f8:	4308                	lw	a0,0(a4)
f01024fa:	0807f613          	andi	a2,a5,128
f01024fe:	00450593          	addi	a1,a0,4
f0102502:	c20d                	beqz	a2,f0102524 <_printf_i+0xaa>
f0102504:	411c                	lw	a5,0(a0)
f0102506:	c30c                	sw	a1,0(a4)
f0102508:	f0108837          	lui	a6,0xf0108
f010250c:	0007d863          	bgez	a5,f010251c <_printf_i+0xa2>
f0102510:	02d00713          	li	a4,45
f0102514:	40f007b3          	neg	a5,a5
f0102518:	04e401a3          	sb	a4,67(s0)
f010251c:	2ac80813          	addi	a6,a6,684 # f01082ac <_sp+0xffffed5c>
f0102520:	4729                	li	a4,10
f0102522:	a0a1                	j	f010256a <_printf_i+0xf0>
f0102524:	0407f613          	andi	a2,a5,64
f0102528:	411c                	lw	a5,0(a0)
f010252a:	c30c                	sw	a1,0(a4)
f010252c:	de71                	beqz	a2,f0102508 <_printf_i+0x8e>
f010252e:	07c2                	slli	a5,a5,0x10
f0102530:	87c1                	srai	a5,a5,0x10
f0102532:	bfd9                	j	f0102508 <_printf_i+0x8e>
f0102534:	4190                	lw	a2,0(a1)
f0102536:	431c                	lw	a5,0(a4)
f0102538:	08067513          	andi	a0,a2,128
f010253c:	00478593          	addi	a1,a5,4
f0102540:	c501                	beqz	a0,f0102548 <_printf_i+0xce>
f0102542:	c30c                	sw	a1,0(a4)
f0102544:	439c                	lw	a5,0(a5)
f0102546:	a039                	j	f0102554 <_printf_i+0xda>
f0102548:	04067613          	andi	a2,a2,64
f010254c:	c30c                	sw	a1,0(a4)
f010254e:	da7d                	beqz	a2,f0102544 <_printf_i+0xca>
f0102550:	0007d783          	lhu	a5,0(a5)
f0102554:	f0108837          	lui	a6,0xf0108
f0102558:	06f00713          	li	a4,111
f010255c:	2ac80813          	addi	a6,a6,684 # f01082ac <_sp+0xffffed5c>
f0102560:	0ce88e63          	beq	a7,a4,f010263c <_printf_i+0x1c2>
f0102564:	4729                	li	a4,10
f0102566:	040401a3          	sb	zero,67(s0)
f010256a:	4050                	lw	a2,4(s0)
f010256c:	c410                	sw	a2,8(s0)
f010256e:	00064563          	bltz	a2,f0102578 <_printf_i+0xfe>
f0102572:	400c                	lw	a1,0(s0)
f0102574:	99ed                	andi	a1,a1,-5
f0102576:	c00c                	sw	a1,0(s0)
f0102578:	e399                	bnez	a5,f010257e <_printf_i+0x104>
f010257a:	8ab6                	mv	s5,a3
f010257c:	ce19                	beqz	a2,f010259a <_printf_i+0x120>
f010257e:	8ab6                	mv	s5,a3
f0102580:	02e7f633          	remu	a2,a5,a4
f0102584:	1afd                	addi	s5,s5,-1
f0102586:	9642                	add	a2,a2,a6
f0102588:	00064603          	lbu	a2,0(a2)
f010258c:	00ca8023          	sb	a2,0(s5)
f0102590:	863e                	mv	a2,a5
f0102592:	02e7d7b3          	divu	a5,a5,a4
f0102596:	fee675e3          	bgeu	a2,a4,f0102580 <_printf_i+0x106>
f010259a:	47a1                	li	a5,8
f010259c:	00f71e63          	bne	a4,a5,f01025b8 <_printf_i+0x13e>
f01025a0:	401c                	lw	a5,0(s0)
f01025a2:	8b85                	andi	a5,a5,1
f01025a4:	cb91                	beqz	a5,f01025b8 <_printf_i+0x13e>
f01025a6:	4058                	lw	a4,4(s0)
f01025a8:	481c                	lw	a5,16(s0)
f01025aa:	00e7c763          	blt	a5,a4,f01025b8 <_printf_i+0x13e>
f01025ae:	03000793          	li	a5,48
f01025b2:	fefa8fa3          	sb	a5,-1(s5)
f01025b6:	1afd                	addi	s5,s5,-1
f01025b8:	415686b3          	sub	a3,a3,s5
f01025bc:	c814                	sw	a3,16(s0)
f01025be:	874e                	mv	a4,s3
f01025c0:	86ca                	mv	a3,s2
f01025c2:	0070                	addi	a2,sp,12
f01025c4:	85a2                	mv	a1,s0
f01025c6:	8526                	mv	a0,s1
f01025c8:	334d                	jal	f010236a <_printf_common>
f01025ca:	5a7d                	li	s4,-1
f01025cc:	0d451563          	bne	a0,s4,f0102696 <_printf_i+0x21c>
f01025d0:	557d                	li	a0,-1
f01025d2:	50b2                	lw	ra,44(sp)
f01025d4:	5422                	lw	s0,40(sp)
f01025d6:	5492                	lw	s1,36(sp)
f01025d8:	5902                	lw	s2,32(sp)
f01025da:	49f2                	lw	s3,28(sp)
f01025dc:	4a62                	lw	s4,24(sp)
f01025de:	4ad2                	lw	s5,20(sp)
f01025e0:	4b42                	lw	s6,16(sp)
f01025e2:	6145                	addi	sp,sp,48
f01025e4:	8082                	ret
f01025e6:	419c                	lw	a5,0(a1)
f01025e8:	0207e793          	ori	a5,a5,32
f01025ec:	c19c                	sw	a5,0(a1)
f01025ee:	f0108837          	lui	a6,0xf0108
f01025f2:	07800893          	li	a7,120
f01025f6:	2c080813          	addi	a6,a6,704 # f01082c0 <_sp+0xffffed70>
f01025fa:	051402a3          	sb	a7,69(s0)
f01025fe:	4010                	lw	a2,0(s0)
f0102600:	430c                	lw	a1,0(a4)
f0102602:	08067513          	andi	a0,a2,128
f0102606:	419c                	lw	a5,0(a1)
f0102608:	0591                	addi	a1,a1,4
f010260a:	e511                	bnez	a0,f0102616 <_printf_i+0x19c>
f010260c:	04067513          	andi	a0,a2,64
f0102610:	c119                	beqz	a0,f0102616 <_printf_i+0x19c>
f0102612:	07c2                	slli	a5,a5,0x10
f0102614:	83c1                	srli	a5,a5,0x10
f0102616:	c30c                	sw	a1,0(a4)
f0102618:	00167713          	andi	a4,a2,1
f010261c:	c701                	beqz	a4,f0102624 <_printf_i+0x1aa>
f010261e:	02066613          	ori	a2,a2,32
f0102622:	c010                	sw	a2,0(s0)
f0102624:	4741                	li	a4,16
f0102626:	f3a1                	bnez	a5,f0102566 <_printf_i+0xec>
f0102628:	4010                	lw	a2,0(s0)
f010262a:	fdf67613          	andi	a2,a2,-33
f010262e:	c010                	sw	a2,0(s0)
f0102630:	bf1d                	j	f0102566 <_printf_i+0xec>
f0102632:	f0108837          	lui	a6,0xf0108
f0102636:	2ac80813          	addi	a6,a6,684 # f01082ac <_sp+0xffffed5c>
f010263a:	b7c1                	j	f01025fa <_printf_i+0x180>
f010263c:	4721                	li	a4,8
f010263e:	b725                	j	f0102566 <_printf_i+0xec>
f0102640:	4190                	lw	a2,0(a1)
f0102642:	431c                	lw	a5,0(a4)
f0102644:	49cc                	lw	a1,20(a1)
f0102646:	08067813          	andi	a6,a2,128
f010264a:	00478513          	addi	a0,a5,4
f010264e:	00080663          	beqz	a6,f010265a <_printf_i+0x1e0>
f0102652:	c308                	sw	a0,0(a4)
f0102654:	439c                	lw	a5,0(a5)
f0102656:	c38c                	sw	a1,0(a5)
f0102658:	a801                	j	f0102668 <_printf_i+0x1ee>
f010265a:	c308                	sw	a0,0(a4)
f010265c:	04067613          	andi	a2,a2,64
f0102660:	439c                	lw	a5,0(a5)
f0102662:	da75                	beqz	a2,f0102656 <_printf_i+0x1dc>
f0102664:	00b79023          	sh	a1,0(a5)
f0102668:	00042823          	sw	zero,16(s0)
f010266c:	8ab6                	mv	s5,a3
f010266e:	bf81                	j	f01025be <_printf_i+0x144>
f0102670:	431c                	lw	a5,0(a4)
f0102672:	41d0                	lw	a2,4(a1)
f0102674:	4581                	li	a1,0
f0102676:	00478693          	addi	a3,a5,4
f010267a:	c314                	sw	a3,0(a4)
f010267c:	0007aa83          	lw	s5,0(a5)
f0102680:	8556                	mv	a0,s5
f0102682:	3135                	jal	f01022ae <memchr>
f0102684:	c501                	beqz	a0,f010268c <_printf_i+0x212>
f0102686:	41550533          	sub	a0,a0,s5
f010268a:	c048                	sw	a0,4(s0)
f010268c:	405c                	lw	a5,4(s0)
f010268e:	c81c                	sw	a5,16(s0)
f0102690:	040401a3          	sb	zero,67(s0)
f0102694:	b72d                	j	f01025be <_printf_i+0x144>
f0102696:	4814                	lw	a3,16(s0)
f0102698:	8656                	mv	a2,s5
f010269a:	85ca                	mv	a1,s2
f010269c:	8526                	mv	a0,s1
f010269e:	9982                	jalr	s3
f01026a0:	f34508e3          	beq	a0,s4,f01025d0 <_printf_i+0x156>
f01026a4:	401c                	lw	a5,0(s0)
f01026a6:	8b89                	andi	a5,a5,2
f01026a8:	e78d                	bnez	a5,f01026d2 <_printf_i+0x258>
f01026aa:	47b2                	lw	a5,12(sp)
f01026ac:	4448                	lw	a0,12(s0)
f01026ae:	f2f552e3          	bge	a0,a5,f01025d2 <_printf_i+0x158>
f01026b2:	853e                	mv	a0,a5
f01026b4:	bf39                	j	f01025d2 <_printf_i+0x158>
f01026b6:	4685                	li	a3,1
f01026b8:	8656                	mv	a2,s5
f01026ba:	85ca                	mv	a1,s2
f01026bc:	8526                	mv	a0,s1
f01026be:	9982                	jalr	s3
f01026c0:	f16508e3          	beq	a0,s6,f01025d0 <_printf_i+0x156>
f01026c4:	0a05                	addi	s4,s4,1
f01026c6:	445c                	lw	a5,12(s0)
f01026c8:	4732                	lw	a4,12(sp)
f01026ca:	8f99                	sub	a5,a5,a4
f01026cc:	fefa45e3          	blt	s4,a5,f01026b6 <_printf_i+0x23c>
f01026d0:	bfe9                	j	f01026aa <_printf_i+0x230>
f01026d2:	4a01                	li	s4,0
f01026d4:	01940a93          	addi	s5,s0,25
f01026d8:	5b7d                	li	s6,-1
f01026da:	b7f5                	j	f01026c6 <_printf_i+0x24c>

f01026dc <_malloc_usable_size_r>:
f01026dc:	ffc5a783          	lw	a5,-4(a1)
f01026e0:	ffc78513          	addi	a0,a5,-4
f01026e4:	0007d563          	bgez	a5,f01026ee <_malloc_usable_size_r+0x12>
f01026e8:	95aa                	add	a1,a1,a0
f01026ea:	419c                	lw	a5,0(a1)
f01026ec:	953e                	add	a0,a0,a5
f01026ee:	8082                	ret

f01026f0 <__divdi3>:
#endif

#ifdef L_divdi3
DWtype
__divdi3 (DWtype u, DWtype v)
{
f01026f0:	832a                	mv	t1,a0
f01026f2:	8e2e                	mv	t3,a1
  Wtype c = 0;
f01026f4:	4881                	li	a7,0
  DWunion uu = {.ll = u};
  DWunion vv = {.ll = v};
  DWtype w;

  if (uu.s.high < 0)
f01026f6:	0005db63          	bgez	a1,f010270c <__divdi3+0x1c>
    c = ~c,
    uu.ll = -uu.ll;
f01026fa:	00a037b3          	snez	a5,a0
f01026fe:	40b00e33          	neg	t3,a1
f0102702:	40fe0e33          	sub	t3,t3,a5
f0102706:	40a00333          	neg	t1,a0
    c = ~c,
f010270a:	58fd                	li	a7,-1
  if (vv.s.high < 0)
f010270c:	0006db63          	bgez	a3,f0102722 <__divdi3+0x32>
    c = ~c,
    vv.ll = -vv.ll;
f0102710:	00c037b3          	snez	a5,a2
f0102714:	40d006b3          	neg	a3,a3
    c = ~c,
f0102718:	fff8c893          	not	a7,a7
    vv.ll = -vv.ll;
f010271c:	8e9d                	sub	a3,a3,a5
f010271e:	40c00633          	neg	a2,a2
  d0 = dd.s.low;
f0102722:	8732                	mv	a4,a2
  n0 = nn.s.low;
f0102724:	881a                	mv	a6,t1
  n1 = nn.s.high;
f0102726:	87f2                	mv	a5,t3
  if (d1 == 0)
f0102728:	20069f63          	bnez	a3,f0102946 <__divdi3+0x256>
      if (d0 > n1)
f010272c:	f01085b7          	lui	a1,0xf0108
f0102730:	32c58593          	addi	a1,a1,812 # f010832c <_sp+0xffffeddc>
f0102734:	0cce7163          	bgeu	t3,a2,f01027f6 <__divdi3+0x106>
	  count_leading_zeros (bm, d0);
f0102738:	66c1                	lui	a3,0x10
f010273a:	0ad67763          	bgeu	a2,a3,f01027e8 <__divdi3+0xf8>
f010273e:	10063693          	sltiu	a3,a2,256
f0102742:	0016c693          	xori	a3,a3,1
f0102746:	068e                	slli	a3,a3,0x3
f0102748:	00d65533          	srl	a0,a2,a3
f010274c:	95aa                	add	a1,a1,a0
f010274e:	0005c583          	lbu	a1,0(a1)
f0102752:	02000513          	li	a0,32
f0102756:	96ae                	add	a3,a3,a1
f0102758:	40d505b3          	sub	a1,a0,a3
	  if (bm != 0)
f010275c:	00d50b63          	beq	a0,a3,f0102772 <__divdi3+0x82>
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
f0102760:	00be17b3          	sll	a5,t3,a1
f0102764:	00d356b3          	srl	a3,t1,a3
	      d0 = d0 << bm;
f0102768:	00b61733          	sll	a4,a2,a1
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
f010276c:	8fd5                	or	a5,a5,a3
	      n0 = n0 << bm;
f010276e:	00b31833          	sll	a6,t1,a1
	  udiv_qrnnd (q0, n0, n1, n0, d0);
f0102772:	01075593          	srli	a1,a4,0x10
f0102776:	02b7de33          	divu	t3,a5,a1
f010277a:	01071613          	slli	a2,a4,0x10
f010277e:	8241                	srli	a2,a2,0x10
f0102780:	02b7f7b3          	remu	a5,a5,a1
f0102784:	8572                	mv	a0,t3
f0102786:	03c60333          	mul	t1,a2,t3
f010278a:	01079693          	slli	a3,a5,0x10
f010278e:	01085793          	srli	a5,a6,0x10
f0102792:	8fd5                	or	a5,a5,a3
f0102794:	0067fc63          	bgeu	a5,t1,f01027ac <__divdi3+0xbc>
f0102798:	97ba                	add	a5,a5,a4
f010279a:	fffe0513          	addi	a0,t3,-1
f010279e:	00e7e763          	bltu	a5,a4,f01027ac <__divdi3+0xbc>
f01027a2:	0067f563          	bgeu	a5,t1,f01027ac <__divdi3+0xbc>
f01027a6:	ffee0513          	addi	a0,t3,-2
f01027aa:	97ba                	add	a5,a5,a4
f01027ac:	406787b3          	sub	a5,a5,t1
f01027b0:	02b7d333          	divu	t1,a5,a1
f01027b4:	0842                	slli	a6,a6,0x10
f01027b6:	01085813          	srli	a6,a6,0x10
f01027ba:	02b7f7b3          	remu	a5,a5,a1
f01027be:	026606b3          	mul	a3,a2,t1
f01027c2:	07c2                	slli	a5,a5,0x10
f01027c4:	00f86833          	or	a6,a6,a5
f01027c8:	879a                	mv	a5,t1
f01027ca:	00d87b63          	bgeu	a6,a3,f01027e0 <__divdi3+0xf0>
f01027ce:	983a                	add	a6,a6,a4
f01027d0:	fff30793          	addi	a5,t1,-1
f01027d4:	00e86663          	bltu	a6,a4,f01027e0 <__divdi3+0xf0>
f01027d8:	00d87463          	bgeu	a6,a3,f01027e0 <__divdi3+0xf0>
f01027dc:	ffe30793          	addi	a5,t1,-2
f01027e0:	0542                	slli	a0,a0,0x10
f01027e2:	8d5d                	or	a0,a0,a5
	      q1 = 0;
f01027e4:	4581                	li	a1,0
f01027e6:	a84d                	j	f0102898 <__divdi3+0x1a8>
	  count_leading_zeros (bm, d0);
f01027e8:	01000537          	lui	a0,0x1000
f01027ec:	46c1                	li	a3,16
f01027ee:	f4a66de3          	bltu	a2,a0,f0102748 <__divdi3+0x58>
f01027f2:	46e1                	li	a3,24
f01027f4:	bf91                	j	f0102748 <__divdi3+0x58>
	  if (d0 == 0)
f01027f6:	e211                	bnez	a2,f01027fa <__divdi3+0x10a>
	    d0 = 1 / d0;	/* Divide intentionally by zero.  */
f01027f8:	9002                	ebreak
	  count_leading_zeros (bm, d0);
f01027fa:	67c1                	lui	a5,0x10
f01027fc:	0af67863          	bgeu	a2,a5,f01028ac <__divdi3+0x1bc>
f0102800:	10063693          	sltiu	a3,a2,256
f0102804:	0016c693          	xori	a3,a3,1
f0102808:	068e                	slli	a3,a3,0x3
f010280a:	00d657b3          	srl	a5,a2,a3
f010280e:	95be                	add	a1,a1,a5
f0102810:	0005c783          	lbu	a5,0(a1)
f0102814:	97b6                	add	a5,a5,a3
f0102816:	02000693          	li	a3,32
f010281a:	40f685b3          	sub	a1,a3,a5
	  if (bm == 0)
f010281e:	08f69e63          	bne	a3,a5,f01028ba <__divdi3+0x1ca>
	      n1 -= d0;
f0102822:	40ce07b3          	sub	a5,t3,a2
	      q1 = 1;
f0102826:	4585                	li	a1,1
	  udiv_qrnnd (q0, n0, n1, n0, d0);
f0102828:	01075313          	srli	t1,a4,0x10
f010282c:	0267deb3          	divu	t4,a5,t1
f0102830:	01071613          	slli	a2,a4,0x10
f0102834:	8241                	srli	a2,a2,0x10
f0102836:	01085693          	srli	a3,a6,0x10
f010283a:	0267f7b3          	remu	a5,a5,t1
f010283e:	8576                	mv	a0,t4
f0102840:	03d60e33          	mul	t3,a2,t4
f0102844:	07c2                	slli	a5,a5,0x10
f0102846:	8fd5                	or	a5,a5,a3
f0102848:	01c7fc63          	bgeu	a5,t3,f0102860 <__divdi3+0x170>
f010284c:	97ba                	add	a5,a5,a4
f010284e:	fffe8513          	addi	a0,t4,-1
f0102852:	00e7e763          	bltu	a5,a4,f0102860 <__divdi3+0x170>
f0102856:	01c7f563          	bgeu	a5,t3,f0102860 <__divdi3+0x170>
f010285a:	ffee8513          	addi	a0,t4,-2
f010285e:	97ba                	add	a5,a5,a4
f0102860:	41c787b3          	sub	a5,a5,t3
f0102864:	0267de33          	divu	t3,a5,t1
f0102868:	0842                	slli	a6,a6,0x10
f010286a:	01085813          	srli	a6,a6,0x10
f010286e:	0267f7b3          	remu	a5,a5,t1
f0102872:	03c606b3          	mul	a3,a2,t3
f0102876:	07c2                	slli	a5,a5,0x10
f0102878:	00f86833          	or	a6,a6,a5
f010287c:	87f2                	mv	a5,t3
f010287e:	00d87b63          	bgeu	a6,a3,f0102894 <__divdi3+0x1a4>
f0102882:	983a                	add	a6,a6,a4
f0102884:	fffe0793          	addi	a5,t3,-1
f0102888:	00e86663          	bltu	a6,a4,f0102894 <__divdi3+0x1a4>
f010288c:	00d87463          	bgeu	a6,a3,f0102894 <__divdi3+0x1a4>
f0102890:	ffee0793          	addi	a5,t3,-2
f0102894:	0542                	slli	a0,a0,0x10
f0102896:	8d5d                	or	a0,a0,a5

  w = __udivmoddi4 (uu.ll, vv.ll, (UDWtype *) 0);
  if (c)
f0102898:	00088963          	beqz	a7,f01028aa <__divdi3+0x1ba>
    w = -w;
f010289c:	00a037b3          	snez	a5,a0
f01028a0:	40b005b3          	neg	a1,a1
f01028a4:	8d9d                	sub	a1,a1,a5
f01028a6:	40a00533          	neg	a0,a0

  return w;
}
f01028aa:	8082                	ret
	  count_leading_zeros (bm, d0);
f01028ac:	010007b7          	lui	a5,0x1000
f01028b0:	46c1                	li	a3,16
f01028b2:	f4f66ce3          	bltu	a2,a5,f010280a <__divdi3+0x11a>
f01028b6:	46e1                	li	a3,24
f01028b8:	bf89                	j	f010280a <__divdi3+0x11a>
	      d0 = d0 << bm;
f01028ba:	00b61733          	sll	a4,a2,a1
	      n2 = n1 >> b;
f01028be:	00fe56b3          	srl	a3,t3,a5
	      udiv_qrnnd (q1, n1, n2, n1, d0);
f01028c2:	01075513          	srli	a0,a4,0x10
	      n1 = (n1 << bm) | (n0 >> b);
f01028c6:	00be1e33          	sll	t3,t3,a1
f01028ca:	00f357b3          	srl	a5,t1,a5
f01028ce:	01c7e7b3          	or	a5,a5,t3
	      udiv_qrnnd (q1, n1, n2, n1, d0);
f01028d2:	02a6de33          	divu	t3,a3,a0
f01028d6:	01071613          	slli	a2,a4,0x10
f01028da:	8241                	srli	a2,a2,0x10
	      n0 = n0 << bm;
f01028dc:	00b31833          	sll	a6,t1,a1
	      udiv_qrnnd (q1, n1, n2, n1, d0);
f01028e0:	02a6f6b3          	remu	a3,a3,a0
f01028e4:	03c60333          	mul	t1,a2,t3
f01028e8:	01069593          	slli	a1,a3,0x10
f01028ec:	0107d693          	srli	a3,a5,0x10
f01028f0:	8ecd                	or	a3,a3,a1
f01028f2:	85f2                	mv	a1,t3
f01028f4:	0066fc63          	bgeu	a3,t1,f010290c <__divdi3+0x21c>
f01028f8:	96ba                	add	a3,a3,a4
f01028fa:	fffe0593          	addi	a1,t3,-1
f01028fe:	00e6e763          	bltu	a3,a4,f010290c <__divdi3+0x21c>
f0102902:	0066f563          	bgeu	a3,t1,f010290c <__divdi3+0x21c>
f0102906:	ffee0593          	addi	a1,t3,-2
f010290a:	96ba                	add	a3,a3,a4
f010290c:	406686b3          	sub	a3,a3,t1
f0102910:	02a6d333          	divu	t1,a3,a0
f0102914:	07c2                	slli	a5,a5,0x10
f0102916:	83c1                	srli	a5,a5,0x10
f0102918:	02a6f6b3          	remu	a3,a3,a0
f010291c:	02660633          	mul	a2,a2,t1
f0102920:	06c2                	slli	a3,a3,0x10
f0102922:	8fd5                	or	a5,a5,a3
f0102924:	869a                	mv	a3,t1
f0102926:	00c7fc63          	bgeu	a5,a2,f010293e <__divdi3+0x24e>
f010292a:	97ba                	add	a5,a5,a4
f010292c:	fff30693          	addi	a3,t1,-1
f0102930:	00e7e763          	bltu	a5,a4,f010293e <__divdi3+0x24e>
f0102934:	00c7f563          	bgeu	a5,a2,f010293e <__divdi3+0x24e>
f0102938:	ffe30693          	addi	a3,t1,-2
f010293c:	97ba                	add	a5,a5,a4
f010293e:	05c2                	slli	a1,a1,0x10
f0102940:	8f91                	sub	a5,a5,a2
f0102942:	8dd5                	or	a1,a1,a3
f0102944:	b5d5                	j	f0102828 <__divdi3+0x138>
      if (d1 > n1)
f0102946:	14de6163          	bltu	t3,a3,f0102a88 <__divdi3+0x398>
	  count_leading_zeros (bm, d1);
f010294a:	67c1                	lui	a5,0x10
f010294c:	02f6ff63          	bgeu	a3,a5,f010298a <__divdi3+0x29a>
f0102950:	1006b713          	sltiu	a4,a3,256
f0102954:	00174713          	xori	a4,a4,1
f0102958:	070e                	slli	a4,a4,0x3
f010295a:	f01087b7          	lui	a5,0xf0108
f010295e:	00e6d5b3          	srl	a1,a3,a4
f0102962:	32c78793          	addi	a5,a5,812 # f010832c <_sp+0xffffeddc>
f0102966:	97ae                	add	a5,a5,a1
f0102968:	0007c783          	lbu	a5,0(a5)
f010296c:	97ba                	add	a5,a5,a4
f010296e:	02000713          	li	a4,32
f0102972:	40f705b3          	sub	a1,a4,a5
	  if (bm == 0)
f0102976:	02f71163          	bne	a4,a5,f0102998 <__divdi3+0x2a8>
		  q0 = 1;
f010297a:	4505                	li	a0,1
	      if (n1 > d1 || n0 >= d0)
f010297c:	f1c6eee3          	bltu	a3,t3,f0102898 <__divdi3+0x1a8>
f0102980:	00c33533          	sltu	a0,t1,a2
f0102984:	00154513          	xori	a0,a0,1
f0102988:	bf01                	j	f0102898 <__divdi3+0x1a8>
	  count_leading_zeros (bm, d1);
f010298a:	010007b7          	lui	a5,0x1000
f010298e:	4741                	li	a4,16
f0102990:	fcf6e5e3          	bltu	a3,a5,f010295a <__divdi3+0x26a>
f0102994:	4761                	li	a4,24
f0102996:	b7d1                	j	f010295a <__divdi3+0x26a>
	      d1 = (d1 << bm) | (d0 >> b);
f0102998:	00f65733          	srl	a4,a2,a5
f010299c:	00b696b3          	sll	a3,a3,a1
f01029a0:	8ed9                	or	a3,a3,a4
	      n2 = n1 >> b;
f01029a2:	00fe5733          	srl	a4,t3,a5
	      n1 = (n1 << bm) | (n0 >> b);
f01029a6:	00be1e33          	sll	t3,t3,a1
f01029aa:	00f357b3          	srl	a5,t1,a5
f01029ae:	01c7e7b3          	or	a5,a5,t3
	      udiv_qrnnd (q0, n1, n2, n1, d1);
f01029b2:	0106de13          	srli	t3,a3,0x10
f01029b6:	03c75f33          	divu	t5,a4,t3
f01029ba:	01069813          	slli	a6,a3,0x10
f01029be:	01085813          	srli	a6,a6,0x10
	      d0 = d0 << bm;
f01029c2:	00b61633          	sll	a2,a2,a1
	      udiv_qrnnd (q0, n1, n2, n1, d1);
f01029c6:	03c77733          	remu	a4,a4,t3
f01029ca:	03e80eb3          	mul	t4,a6,t5
f01029ce:	01071513          	slli	a0,a4,0x10
f01029d2:	0107d713          	srli	a4,a5,0x10
f01029d6:	8f49                	or	a4,a4,a0
f01029d8:	857a                	mv	a0,t5
f01029da:	01d77c63          	bgeu	a4,t4,f01029f2 <__divdi3+0x302>
f01029de:	9736                	add	a4,a4,a3
f01029e0:	ffff0513          	addi	a0,t5,-1
f01029e4:	00d76763          	bltu	a4,a3,f01029f2 <__divdi3+0x302>
f01029e8:	01d77563          	bgeu	a4,t4,f01029f2 <__divdi3+0x302>
f01029ec:	ffef0513          	addi	a0,t5,-2
f01029f0:	9736                	add	a4,a4,a3
f01029f2:	41d70733          	sub	a4,a4,t4
f01029f6:	03c75eb3          	divu	t4,a4,t3
f01029fa:	07c2                	slli	a5,a5,0x10
f01029fc:	83c1                	srli	a5,a5,0x10
f01029fe:	03c77733          	remu	a4,a4,t3
f0102a02:	03d80833          	mul	a6,a6,t4
f0102a06:	0742                	slli	a4,a4,0x10
f0102a08:	8fd9                	or	a5,a5,a4
f0102a0a:	8776                	mv	a4,t4
f0102a0c:	0107fc63          	bgeu	a5,a6,f0102a24 <__divdi3+0x334>
f0102a10:	97b6                	add	a5,a5,a3
f0102a12:	fffe8713          	addi	a4,t4,-1
f0102a16:	00d7e763          	bltu	a5,a3,f0102a24 <__divdi3+0x334>
f0102a1a:	0107f563          	bgeu	a5,a6,f0102a24 <__divdi3+0x334>
f0102a1e:	ffee8713          	addi	a4,t4,-2
f0102a22:	97b6                	add	a5,a5,a3
f0102a24:	0542                	slli	a0,a0,0x10
	      umul_ppmm (m1, m0, q0, d0);
f0102a26:	6ec1                	lui	t4,0x10
	      udiv_qrnnd (q0, n1, n2, n1, d1);
f0102a28:	8d59                	or	a0,a0,a4
	      umul_ppmm (m1, m0, q0, d0);
f0102a2a:	fffe8693          	addi	a3,t4,-1 # ffff <syscalls.c.1b5c30a8+0x837b>
f0102a2e:	00d57733          	and	a4,a0,a3
	      udiv_qrnnd (q0, n1, n2, n1, d1);
f0102a32:	410787b3          	sub	a5,a5,a6
	      umul_ppmm (m1, m0, q0, d0);
f0102a36:	8ef1                	and	a3,a3,a2
f0102a38:	01055813          	srli	a6,a0,0x10
f0102a3c:	8241                	srli	a2,a2,0x10
f0102a3e:	02d70e33          	mul	t3,a4,a3
f0102a42:	02d806b3          	mul	a3,a6,a3
f0102a46:	02c70733          	mul	a4,a4,a2
f0102a4a:	02c80833          	mul	a6,a6,a2
f0102a4e:	00d70633          	add	a2,a4,a3
f0102a52:	010e5713          	srli	a4,t3,0x10
f0102a56:	9732                	add	a4,a4,a2
f0102a58:	00d77363          	bgeu	a4,a3,f0102a5e <__divdi3+0x36e>
f0102a5c:	9876                	add	a6,a6,t4
f0102a5e:	01075693          	srli	a3,a4,0x10
f0102a62:	96c2                	add	a3,a3,a6
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
f0102a64:	02d7e063          	bltu	a5,a3,f0102a84 <__divdi3+0x394>
f0102a68:	d6d79ee3          	bne	a5,a3,f01027e4 <__divdi3+0xf4>
	      umul_ppmm (m1, m0, q0, d0);
f0102a6c:	67c1                	lui	a5,0x10
f0102a6e:	17fd                	addi	a5,a5,-1
f0102a70:	8f7d                	and	a4,a4,a5
f0102a72:	0742                	slli	a4,a4,0x10
f0102a74:	00fe7e33          	and	t3,t3,a5
	      n0 = n0 << bm;
f0102a78:	00b31333          	sll	t1,t1,a1
	      umul_ppmm (m1, m0, q0, d0);
f0102a7c:	9772                	add	a4,a4,t3
	      q1 = 0;
f0102a7e:	4581                	li	a1,0
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
f0102a80:	e0e37ce3          	bgeu	t1,a4,f0102898 <__divdi3+0x1a8>
		  q0--;
f0102a84:	157d                	addi	a0,a0,-1
		  sub_ddmmss (m1, m0, m1, m0, d1, d0);
f0102a86:	bbb9                	j	f01027e4 <__divdi3+0xf4>
	  q1 = 0;
f0102a88:	4581                	li	a1,0
	  q0 = 0;
f0102a8a:	4501                	li	a0,0
f0102a8c:	b531                	j	f0102898 <__divdi3+0x1a8>

f0102a8e <__udivdi3>:
#endif

#ifdef L_udivdi3
UDWtype
__udivdi3 (UDWtype n, UDWtype d)
{
f0102a8e:	832a                	mv	t1,a0
f0102a90:	88ae                	mv	a7,a1
  d0 = dd.s.low;
f0102a92:	8732                	mv	a4,a2
  n0 = nn.s.low;
f0102a94:	882a                	mv	a6,a0
  n1 = nn.s.high;
f0102a96:	87ae                	mv	a5,a1
  if (d1 == 0)
f0102a98:	20069663          	bnez	a3,f0102ca4 <__udivdi3+0x216>
      if (d0 > n1)
f0102a9c:	f01085b7          	lui	a1,0xf0108
f0102aa0:	32c58593          	addi	a1,a1,812 # f010832c <_sp+0xffffeddc>
f0102aa4:	0cc8f163          	bgeu	a7,a2,f0102b66 <__udivdi3+0xd8>
	  count_leading_zeros (bm, d0);
f0102aa8:	66c1                	lui	a3,0x10
f0102aaa:	0ad67763          	bgeu	a2,a3,f0102b58 <__udivdi3+0xca>
f0102aae:	10063693          	sltiu	a3,a2,256
f0102ab2:	0016c693          	xori	a3,a3,1
f0102ab6:	068e                	slli	a3,a3,0x3
f0102ab8:	00d65533          	srl	a0,a2,a3
f0102abc:	95aa                	add	a1,a1,a0
f0102abe:	0005c583          	lbu	a1,0(a1)
f0102ac2:	02000513          	li	a0,32
f0102ac6:	96ae                	add	a3,a3,a1
f0102ac8:	40d505b3          	sub	a1,a0,a3
	  if (bm != 0)
f0102acc:	00d50b63          	beq	a0,a3,f0102ae2 <__udivdi3+0x54>
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
f0102ad0:	00b897b3          	sll	a5,a7,a1
f0102ad4:	00d356b3          	srl	a3,t1,a3
	      d0 = d0 << bm;
f0102ad8:	00b61733          	sll	a4,a2,a1
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
f0102adc:	8fd5                	or	a5,a5,a3
	      n0 = n0 << bm;
f0102ade:	00b31833          	sll	a6,t1,a1
	  udiv_qrnnd (q0, n0, n1, n0, d0);
f0102ae2:	01075593          	srli	a1,a4,0x10
f0102ae6:	02b7d333          	divu	t1,a5,a1
f0102aea:	01071613          	slli	a2,a4,0x10
f0102aee:	8241                	srli	a2,a2,0x10
f0102af0:	02b7f7b3          	remu	a5,a5,a1
f0102af4:	851a                	mv	a0,t1
f0102af6:	026608b3          	mul	a7,a2,t1
f0102afa:	01079693          	slli	a3,a5,0x10
f0102afe:	01085793          	srli	a5,a6,0x10
f0102b02:	8fd5                	or	a5,a5,a3
f0102b04:	0117fc63          	bgeu	a5,a7,f0102b1c <__udivdi3+0x8e>
f0102b08:	97ba                	add	a5,a5,a4
f0102b0a:	fff30513          	addi	a0,t1,-1
f0102b0e:	00e7e763          	bltu	a5,a4,f0102b1c <__udivdi3+0x8e>
f0102b12:	0117f563          	bgeu	a5,a7,f0102b1c <__udivdi3+0x8e>
f0102b16:	ffe30513          	addi	a0,t1,-2
f0102b1a:	97ba                	add	a5,a5,a4
f0102b1c:	411787b3          	sub	a5,a5,a7
f0102b20:	02b7d8b3          	divu	a7,a5,a1
f0102b24:	0842                	slli	a6,a6,0x10
f0102b26:	01085813          	srli	a6,a6,0x10
f0102b2a:	02b7f7b3          	remu	a5,a5,a1
f0102b2e:	031606b3          	mul	a3,a2,a7
f0102b32:	07c2                	slli	a5,a5,0x10
f0102b34:	00f86833          	or	a6,a6,a5
f0102b38:	87c6                	mv	a5,a7
f0102b3a:	00d87b63          	bgeu	a6,a3,f0102b50 <__udivdi3+0xc2>
f0102b3e:	983a                	add	a6,a6,a4
f0102b40:	fff88793          	addi	a5,a7,-1
f0102b44:	00e86663          	bltu	a6,a4,f0102b50 <__udivdi3+0xc2>
f0102b48:	00d87463          	bgeu	a6,a3,f0102b50 <__udivdi3+0xc2>
f0102b4c:	ffe88793          	addi	a5,a7,-2
f0102b50:	0542                	slli	a0,a0,0x10
f0102b52:	8d5d                	or	a0,a0,a5
	      q1 = 0;
f0102b54:	4581                	li	a1,0
  return __udivmoddi4 (n, d, (UDWtype *) 0);
}
f0102b56:	8082                	ret
	  count_leading_zeros (bm, d0);
f0102b58:	01000537          	lui	a0,0x1000
f0102b5c:	46c1                	li	a3,16
f0102b5e:	f4a66de3          	bltu	a2,a0,f0102ab8 <__udivdi3+0x2a>
f0102b62:	46e1                	li	a3,24
f0102b64:	bf91                	j	f0102ab8 <__udivdi3+0x2a>
	  if (d0 == 0)
f0102b66:	e211                	bnez	a2,f0102b6a <__udivdi3+0xdc>
	    d0 = 1 / d0;	/* Divide intentionally by zero.  */
f0102b68:	9002                	ebreak
	  count_leading_zeros (bm, d0);
f0102b6a:	67c1                	lui	a5,0x10
f0102b6c:	08f67f63          	bgeu	a2,a5,f0102c0a <__udivdi3+0x17c>
f0102b70:	10063693          	sltiu	a3,a2,256
f0102b74:	0016c693          	xori	a3,a3,1
f0102b78:	068e                	slli	a3,a3,0x3
f0102b7a:	00d657b3          	srl	a5,a2,a3
f0102b7e:	95be                	add	a1,a1,a5
f0102b80:	0005c783          	lbu	a5,0(a1)
f0102b84:	97b6                	add	a5,a5,a3
f0102b86:	02000693          	li	a3,32
f0102b8a:	40f685b3          	sub	a1,a3,a5
	  if (bm == 0)
f0102b8e:	08f69563          	bne	a3,a5,f0102c18 <__udivdi3+0x18a>
	      n1 -= d0;
f0102b92:	40c887b3          	sub	a5,a7,a2
	      q1 = 1;
f0102b96:	4585                	li	a1,1
	  udiv_qrnnd (q0, n0, n1, n0, d0);
f0102b98:	01075893          	srli	a7,a4,0x10
f0102b9c:	0317de33          	divu	t3,a5,a7
f0102ba0:	01071613          	slli	a2,a4,0x10
f0102ba4:	8241                	srli	a2,a2,0x10
f0102ba6:	01085693          	srli	a3,a6,0x10
f0102baa:	0317f7b3          	remu	a5,a5,a7
f0102bae:	8572                	mv	a0,t3
f0102bb0:	03c60333          	mul	t1,a2,t3
f0102bb4:	07c2                	slli	a5,a5,0x10
f0102bb6:	8fd5                	or	a5,a5,a3
f0102bb8:	0067fc63          	bgeu	a5,t1,f0102bd0 <__udivdi3+0x142>
f0102bbc:	97ba                	add	a5,a5,a4
f0102bbe:	fffe0513          	addi	a0,t3,-1
f0102bc2:	00e7e763          	bltu	a5,a4,f0102bd0 <__udivdi3+0x142>
f0102bc6:	0067f563          	bgeu	a5,t1,f0102bd0 <__udivdi3+0x142>
f0102bca:	ffee0513          	addi	a0,t3,-2
f0102bce:	97ba                	add	a5,a5,a4
f0102bd0:	406787b3          	sub	a5,a5,t1
f0102bd4:	0317d333          	divu	t1,a5,a7
f0102bd8:	0842                	slli	a6,a6,0x10
f0102bda:	01085813          	srli	a6,a6,0x10
f0102bde:	0317f7b3          	remu	a5,a5,a7
f0102be2:	026606b3          	mul	a3,a2,t1
f0102be6:	07c2                	slli	a5,a5,0x10
f0102be8:	00f86833          	or	a6,a6,a5
f0102bec:	879a                	mv	a5,t1
f0102bee:	00d87b63          	bgeu	a6,a3,f0102c04 <__udivdi3+0x176>
f0102bf2:	983a                	add	a6,a6,a4
f0102bf4:	fff30793          	addi	a5,t1,-1
f0102bf8:	00e86663          	bltu	a6,a4,f0102c04 <__udivdi3+0x176>
f0102bfc:	00d87463          	bgeu	a6,a3,f0102c04 <__udivdi3+0x176>
f0102c00:	ffe30793          	addi	a5,t1,-2
f0102c04:	0542                	slli	a0,a0,0x10
f0102c06:	8d5d                	or	a0,a0,a5
f0102c08:	8082                	ret
	  count_leading_zeros (bm, d0);
f0102c0a:	010007b7          	lui	a5,0x1000
f0102c0e:	46c1                	li	a3,16
f0102c10:	f6f665e3          	bltu	a2,a5,f0102b7a <__udivdi3+0xec>
f0102c14:	46e1                	li	a3,24
f0102c16:	b795                	j	f0102b7a <__udivdi3+0xec>
	      d0 = d0 << bm;
f0102c18:	00b61733          	sll	a4,a2,a1
	      n2 = n1 >> b;
f0102c1c:	00f8d6b3          	srl	a3,a7,a5
	      udiv_qrnnd (q1, n1, n2, n1, d0);
f0102c20:	01075513          	srli	a0,a4,0x10
	      n1 = (n1 << bm) | (n0 >> b);
f0102c24:	00f357b3          	srl	a5,t1,a5
	      n0 = n0 << bm;
f0102c28:	00b31833          	sll	a6,t1,a1
	      udiv_qrnnd (q1, n1, n2, n1, d0);
f0102c2c:	02a6d333          	divu	t1,a3,a0
f0102c30:	01071613          	slli	a2,a4,0x10
	      n1 = (n1 << bm) | (n0 >> b);
f0102c34:	00b898b3          	sll	a7,a7,a1
	      udiv_qrnnd (q1, n1, n2, n1, d0);
f0102c38:	8241                	srli	a2,a2,0x10
	      n1 = (n1 << bm) | (n0 >> b);
f0102c3a:	0117e7b3          	or	a5,a5,a7
	      udiv_qrnnd (q1, n1, n2, n1, d0);
f0102c3e:	02a6f6b3          	remu	a3,a3,a0
f0102c42:	026608b3          	mul	a7,a2,t1
f0102c46:	01069593          	slli	a1,a3,0x10
f0102c4a:	0107d693          	srli	a3,a5,0x10
f0102c4e:	8ecd                	or	a3,a3,a1
f0102c50:	859a                	mv	a1,t1
f0102c52:	0116fc63          	bgeu	a3,a7,f0102c6a <__udivdi3+0x1dc>
f0102c56:	96ba                	add	a3,a3,a4
f0102c58:	fff30593          	addi	a1,t1,-1
f0102c5c:	00e6e763          	bltu	a3,a4,f0102c6a <__udivdi3+0x1dc>
f0102c60:	0116f563          	bgeu	a3,a7,f0102c6a <__udivdi3+0x1dc>
f0102c64:	ffe30593          	addi	a1,t1,-2
f0102c68:	96ba                	add	a3,a3,a4
f0102c6a:	411686b3          	sub	a3,a3,a7
f0102c6e:	02a6d8b3          	divu	a7,a3,a0
f0102c72:	07c2                	slli	a5,a5,0x10
f0102c74:	83c1                	srli	a5,a5,0x10
f0102c76:	02a6f6b3          	remu	a3,a3,a0
f0102c7a:	03160633          	mul	a2,a2,a7
f0102c7e:	06c2                	slli	a3,a3,0x10
f0102c80:	8fd5                	or	a5,a5,a3
f0102c82:	86c6                	mv	a3,a7
f0102c84:	00c7fc63          	bgeu	a5,a2,f0102c9c <__udivdi3+0x20e>
f0102c88:	97ba                	add	a5,a5,a4
f0102c8a:	fff88693          	addi	a3,a7,-1
f0102c8e:	00e7e763          	bltu	a5,a4,f0102c9c <__udivdi3+0x20e>
f0102c92:	00c7f563          	bgeu	a5,a2,f0102c9c <__udivdi3+0x20e>
f0102c96:	ffe88693          	addi	a3,a7,-2
f0102c9a:	97ba                	add	a5,a5,a4
f0102c9c:	05c2                	slli	a1,a1,0x10
f0102c9e:	8f91                	sub	a5,a5,a2
f0102ca0:	8dd5                	or	a1,a1,a3
f0102ca2:	bddd                	j	f0102b98 <__udivdi3+0x10a>
      if (d1 > n1)
f0102ca4:	14d5e163          	bltu	a1,a3,f0102de6 <__udivdi3+0x358>
	  count_leading_zeros (bm, d1);
f0102ca8:	67c1                	lui	a5,0x10
f0102caa:	02f6ff63          	bgeu	a3,a5,f0102ce8 <__udivdi3+0x25a>
f0102cae:	1006b713          	sltiu	a4,a3,256
f0102cb2:	00174713          	xori	a4,a4,1
f0102cb6:	070e                	slli	a4,a4,0x3
f0102cb8:	f01087b7          	lui	a5,0xf0108
f0102cbc:	00e6d5b3          	srl	a1,a3,a4
f0102cc0:	32c78793          	addi	a5,a5,812 # f010832c <_sp+0xffffeddc>
f0102cc4:	97ae                	add	a5,a5,a1
f0102cc6:	0007c783          	lbu	a5,0(a5)
f0102cca:	97ba                	add	a5,a5,a4
f0102ccc:	02000713          	li	a4,32
f0102cd0:	40f705b3          	sub	a1,a4,a5
	  if (bm == 0)
f0102cd4:	02f71163          	bne	a4,a5,f0102cf6 <__udivdi3+0x268>
		  q0 = 1;
f0102cd8:	4505                	li	a0,1
	      if (n1 > d1 || n0 >= d0)
f0102cda:	e716eee3          	bltu	a3,a7,f0102b56 <__udivdi3+0xc8>
f0102cde:	00c33533          	sltu	a0,t1,a2
f0102ce2:	00154513          	xori	a0,a0,1
f0102ce6:	8082                	ret
	  count_leading_zeros (bm, d1);
f0102ce8:	010007b7          	lui	a5,0x1000
f0102cec:	4741                	li	a4,16
f0102cee:	fcf6e5e3          	bltu	a3,a5,f0102cb8 <__udivdi3+0x22a>
f0102cf2:	4761                	li	a4,24
f0102cf4:	b7d1                	j	f0102cb8 <__udivdi3+0x22a>
	      d1 = (d1 << bm) | (d0 >> b);
f0102cf6:	00f65733          	srl	a4,a2,a5
f0102cfa:	00b696b3          	sll	a3,a3,a1
f0102cfe:	8ed9                	or	a3,a3,a4
	      n2 = n1 >> b;
f0102d00:	00f8d733          	srl	a4,a7,a5
	      n1 = (n1 << bm) | (n0 >> b);
f0102d04:	00b898b3          	sll	a7,a7,a1
f0102d08:	00f357b3          	srl	a5,t1,a5
f0102d0c:	0117e7b3          	or	a5,a5,a7
	      udiv_qrnnd (q0, n1, n2, n1, d1);
f0102d10:	0106d893          	srli	a7,a3,0x10
f0102d14:	03175eb3          	divu	t4,a4,a7
f0102d18:	01069813          	slli	a6,a3,0x10
f0102d1c:	01085813          	srli	a6,a6,0x10
	      d0 = d0 << bm;
f0102d20:	00b61633          	sll	a2,a2,a1
	      udiv_qrnnd (q0, n1, n2, n1, d1);
f0102d24:	03177733          	remu	a4,a4,a7
f0102d28:	03d80e33          	mul	t3,a6,t4
f0102d2c:	01071513          	slli	a0,a4,0x10
f0102d30:	0107d713          	srli	a4,a5,0x10
f0102d34:	8f49                	or	a4,a4,a0
f0102d36:	8576                	mv	a0,t4
f0102d38:	01c77c63          	bgeu	a4,t3,f0102d50 <__udivdi3+0x2c2>
f0102d3c:	9736                	add	a4,a4,a3
f0102d3e:	fffe8513          	addi	a0,t4,-1
f0102d42:	00d76763          	bltu	a4,a3,f0102d50 <__udivdi3+0x2c2>
f0102d46:	01c77563          	bgeu	a4,t3,f0102d50 <__udivdi3+0x2c2>
f0102d4a:	ffee8513          	addi	a0,t4,-2
f0102d4e:	9736                	add	a4,a4,a3
f0102d50:	41c70733          	sub	a4,a4,t3
f0102d54:	03175e33          	divu	t3,a4,a7
f0102d58:	07c2                	slli	a5,a5,0x10
f0102d5a:	83c1                	srli	a5,a5,0x10
f0102d5c:	03177733          	remu	a4,a4,a7
f0102d60:	03c80833          	mul	a6,a6,t3
f0102d64:	0742                	slli	a4,a4,0x10
f0102d66:	8fd9                	or	a5,a5,a4
f0102d68:	8772                	mv	a4,t3
f0102d6a:	0107fc63          	bgeu	a5,a6,f0102d82 <__udivdi3+0x2f4>
f0102d6e:	97b6                	add	a5,a5,a3
f0102d70:	fffe0713          	addi	a4,t3,-1
f0102d74:	00d7e763          	bltu	a5,a3,f0102d82 <__udivdi3+0x2f4>
f0102d78:	0107f563          	bgeu	a5,a6,f0102d82 <__udivdi3+0x2f4>
f0102d7c:	ffee0713          	addi	a4,t3,-2
f0102d80:	97b6                	add	a5,a5,a3
f0102d82:	0542                	slli	a0,a0,0x10
	      umul_ppmm (m1, m0, q0, d0);
f0102d84:	6e41                	lui	t3,0x10
	      udiv_qrnnd (q0, n1, n2, n1, d1);
f0102d86:	8d59                	or	a0,a0,a4
	      umul_ppmm (m1, m0, q0, d0);
f0102d88:	fffe0693          	addi	a3,t3,-1 # ffff <syscalls.c.1b5c30a8+0x837b>
f0102d8c:	00d57733          	and	a4,a0,a3
	      udiv_qrnnd (q0, n1, n2, n1, d1);
f0102d90:	410787b3          	sub	a5,a5,a6
	      umul_ppmm (m1, m0, q0, d0);
f0102d94:	8ef1                	and	a3,a3,a2
f0102d96:	01055813          	srli	a6,a0,0x10
f0102d9a:	8241                	srli	a2,a2,0x10
f0102d9c:	02d708b3          	mul	a7,a4,a3
f0102da0:	02d806b3          	mul	a3,a6,a3
f0102da4:	02c70733          	mul	a4,a4,a2
f0102da8:	02c80833          	mul	a6,a6,a2
f0102dac:	00d70633          	add	a2,a4,a3
f0102db0:	0108d713          	srli	a4,a7,0x10
f0102db4:	9732                	add	a4,a4,a2
f0102db6:	00d77363          	bgeu	a4,a3,f0102dbc <__udivdi3+0x32e>
f0102dba:	9872                	add	a6,a6,t3
f0102dbc:	01075693          	srli	a3,a4,0x10
f0102dc0:	96c2                	add	a3,a3,a6
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
f0102dc2:	02d7e063          	bltu	a5,a3,f0102de2 <__udivdi3+0x354>
f0102dc6:	d8d797e3          	bne	a5,a3,f0102b54 <__udivdi3+0xc6>
	      umul_ppmm (m1, m0, q0, d0);
f0102dca:	67c1                	lui	a5,0x10
f0102dcc:	17fd                	addi	a5,a5,-1
f0102dce:	8f7d                	and	a4,a4,a5
f0102dd0:	0742                	slli	a4,a4,0x10
f0102dd2:	00f8f8b3          	and	a7,a7,a5
	      n0 = n0 << bm;
f0102dd6:	00b31333          	sll	t1,t1,a1
	      umul_ppmm (m1, m0, q0, d0);
f0102dda:	9746                	add	a4,a4,a7
	      q1 = 0;
f0102ddc:	4581                	li	a1,0
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
f0102dde:	d6e37ce3          	bgeu	t1,a4,f0102b56 <__udivdi3+0xc8>
		  q0--;
f0102de2:	157d                	addi	a0,a0,-1
		  sub_ddmmss (m1, m0, m1, m0, d1, d0);
f0102de4:	bb85                	j	f0102b54 <__udivdi3+0xc6>
	  q1 = 0;
f0102de6:	4581                	li	a1,0
	  q0 = 0;
f0102de8:	4501                	li	a0,0
f0102dea:	8082                	ret
