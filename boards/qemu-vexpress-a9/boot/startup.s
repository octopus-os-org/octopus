
/* Some defines */
.equ MODE_FIQ, 0x11
.equ MODE_IRQ, 0x12
.equ MODE_SVC, 0x13

.extern resetHandler

.global _vector_table

.section .vector_table,"a",%progbits
.type  _vector_table, %object
_vector_table:
    b _start
    b . /* 0x4  Undefined Instruction */
    b . /* 0x8  Software Interrupt */
    b .  /* 0xC  Prefetch Abort */
    b . /* 0x10 Data Abort */
    b . /* 0x14 Reserved */
    b . /* 0x18 IRQ */
    b . /* 0x1C FIQ */

.section .text
.global _start
_start:
    msr cpsr_c, #0x13
    ldr sp, =_stack_high

    // init uart (enable)
    ldr r0, =0x10009000
    ldr r1, =0x301
    str r1, [r0, #0x30]

    // print some
    ldr r1, = 'a'
    str r1, [r0, #0x00]
    str r1, [r0, #0x00]
    str r1, [r0, #0x00]
    ldr r1, = '\n'
    str r1, [r0, #0x00]

    b resetHandler

