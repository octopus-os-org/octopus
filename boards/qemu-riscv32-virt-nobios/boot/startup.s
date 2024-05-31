.include "context_reg.s"

.equ REGBYTES, 4

.extern start
.extern trap_handler

.globl _start
.section ".start", "ax"
_start:
    csrr   t0, mhartid
    lui    t1, 0
    beq    t0, t1, 2f

1:  wfi
    j      1b

2:
    /* clear Interrupt Registers */
    csrw mie, 0
    csrw mip, 0
    /* set Trap Vector Base Address Register */
    la t0, trap_entry
    csrw mtvec, t0

    li x1, 0
    li x2, 0
    li x3, 0
    li x4, 0
    li x5, 0
    li x6, 0
    li x7, 0
    li x8, 0
    li x9, 0
    li x10,0
    li x11,0
    li x12,0
    li x13,0
    li x14,0
    li x15,0
    li x16,0
    li x17,0
    li x18,0
    li x19,0
    li x20,0
    li x21,0
    li x22,0
    li x23,0
    li x24,0
    li x25,0
    li x26,0
    li x27,0
    li x28,0
    li x29,0
    li x30,0
    li x31,0

    /* initialize stack pointer */
    la sp, stack_top
    call   start

.align 2
.global trap_entry
trap_entry:
_enter_trap:
    /* save sp to register (scratch) */ 
    csrw mscratch, sp
_save_ctx:
    SAVE_ALL_CONTEXT_REG
_after_save_ctx:
    /* if trap is ecall, make epc+=4 */
    csrr t0, mcause
    li t1, 0x0b
    bne t0, t1, _call_handler
_optional_addmepc4:
    INC_MEPC_4
_call_handler:
    call trap_handler
_restore_ctx:
    RESTORE_ALL_CONTEXT_REG
_exit_trap:
    # csrw mscratch, zero 
    mret
    
