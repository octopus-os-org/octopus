/* Some defines */
.equ MODE_FIQ, 0x11
.equ MODE_IRQ, 0x12
.equ MODE_SVC, 0x13

.global _vector_table
.global _startup
.extern resetHandler

.section .text.vector_table
_vector_table:
    b _startup
    b . /* 0x4  Undefined Instruction */
    b . /* 0x8  Software Interrupt */
    b . /* 0xC  Prefetch Abort */
    b . /* 0x10 Data Abort */
    b . /* 0x14 Reserved */
    b . /* 0x18 IRQ */
    b . /* 0x1C FIQ */

.section .text.startup
_startup:
    msr cpsr_c, #0x13 /* be Supervisor mode */
    ldr sp, =_stack_end /* set sp */

    bl resetHandler
    b .

