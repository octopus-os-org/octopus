.equ TOTAL_CONTEXT_REG, 33

.macro SAVE_ALL_CONTEXT_REG
    /* prepare space */
    addi sp, sp, -TOTAL_CONTEXT_REG * 4
    /* save ra */ 
    sw x1,   1 * 4(sp)
    /* save xstatus */
    csrr x1, mstatus
    sw x1,   2 * 4(sp)
    /* save xepc */
    csrr x1, mepc
    sw x1,   0 * 4(sp)
    sw x3,   3 * 4(sp)
    sw x4,   4 * 4(sp)
    sw x5,   5 * 4(sp)
    sw x6,   6 * 4(sp)
    sw x7,   7 * 4(sp)
    sw x8,   8 * 4(sp)
    sw x9,   9 * 4(sp)
    sw x10, 10 * 4(sp)
    sw x11, 11 * 4(sp)
    sw x12, 12 * 4(sp)
    sw x13, 13 * 4(sp)
    sw x14, 14 * 4(sp)
    sw x15, 15 * 4(sp)
    sw x16, 16 * 4(sp)
    sw x17, 17 * 4(sp)
    sw x18, 18 * 4(sp)
    sw x19, 19 * 4(sp)
    sw x20, 20 * 4(sp)
    sw x21, 21 * 4(sp)
    sw x22, 22 * 4(sp)
    sw x23, 23 * 4(sp)
    sw x24, 24 * 4(sp)
    sw x25, 25 * 4(sp)
    sw x26, 26 * 4(sp)
    sw x27, 27 * 4(sp)
    sw x28, 28 * 4(sp)
    sw x29, 29 * 4(sp)
    sw x30, 30 * 4(sp)
    sw x31, 31 * 4(sp)
    /* save sp to space */
    csrr t0, mscratch
    sw t0, 32 * 4(sp)
.endm

.macro RESTORE_ALL_CONTEXT_REG
    /* restore general register */
    # addi t0, sp, TOTAL_CONTEXT_REG * 4
    # csrw mscratch, t0
    /* restore ra to xepc */
    lw x1, 0 * 4(sp)
    csrw mepc, x1
    /* restore mstatus */
    lw x1,   2 * 4(sp)
    csrw mstatus, x1

    lw x1,   1 * 4(sp)
    lw x3,   3 * 4(sp)
    lw x4,   4 * 4(sp) /* restore tp */
    lw x5,   5 * 4(sp)
    lw x6,   6 * 4(sp)
    lw x7,   7 * 4(sp)
    lw x8,   8 * 4(sp)
    lw x9,   9 * 4(sp)
    lw x10, 10 * 4(sp)
    lw x11, 11 * 4(sp)
    lw x12, 12 * 4(sp)
    lw x13, 13 * 4(sp)
    lw x14, 14 * 4(sp)
    lw x15, 15 * 4(sp)
    lw x16, 16 * 4(sp)
    lw x17, 17 * 4(sp)
    lw x18, 18 * 4(sp)
    lw x19, 19 * 4(sp)
    lw x20, 20 * 4(sp)
    lw x21, 21 * 4(sp)
    lw x22, 22 * 4(sp)
    lw x23, 23 * 4(sp)
    lw x24, 24 * 4(sp)
    lw x25, 25 * 4(sp)
    lw x26, 26 * 4(sp)
    lw x27, 27 * 4(sp)
    lw x28, 28 * 4(sp)
    lw x29, 29 * 4(sp)
    lw x30, 30 * 4(sp)
    lw x31, 31 * 4(sp)
    /* restore sp */
    lw sp, 32 * 4(sp)
.endm

// base: sp is stored in mscratch
.macro INC_MEPC_4
    csrr t0, mscratch
    addi t0, t0, -TOTAL_CONTEXT_REG * 4
    lw t1, 0 * 4(t0)
    addi t1, t1, 4
    sw t1, 0 * 4(t0)
.endm