.include "comm.s"

// layout:
    // space-offset  content
    // 32            sscratch
    // 31            x31
    // ...           ...
    // 3             x3
    // 2             sstatus
    // 1             x1
    // 0             sepc
.macro SAVE_ALL_CONTEXT_REG
    /* prepare space */
    addi sp, sp, -33 * REGBYTES
    /* save ra */ 
    SAVE x1,   1 * REGBYTES(sp)
    /* save xstatus */
    csrr x1, sstatus
    SAVE x1,   2 * REGBYTES(sp)
    /* save xepc */
    csrr x1, sepc
    # addi x1, x1, 0 // to next inst
    SAVE x1,   0 * REGBYTES(sp)
    SAVE x3,   3 * REGBYTES(sp)
    SAVE x4,   4 * REGBYTES(sp)
    SAVE x5,   5 * REGBYTES(sp)
    SAVE x6,   6 * REGBYTES(sp)
    SAVE x7,   7 * REGBYTES(sp)
    SAVE x8,   8 * REGBYTES(sp)
    SAVE x9,   9 * REGBYTES(sp)
    SAVE x10, 10 * REGBYTES(sp)
    SAVE x11, 11 * REGBYTES(sp)
    SAVE x12, 12 * REGBYTES(sp)
    SAVE x13, 13 * REGBYTES(sp)
    SAVE x14, 14 * REGBYTES(sp)
    SAVE x15, 15 * REGBYTES(sp)
    SAVE x16, 16 * REGBYTES(sp)
    SAVE x17, 17 * REGBYTES(sp)
    SAVE x18, 18 * REGBYTES(sp)
    SAVE x19, 19 * REGBYTES(sp)
    SAVE x20, 20 * REGBYTES(sp)
    SAVE x21, 21 * REGBYTES(sp)
    SAVE x22, 22 * REGBYTES(sp)
    SAVE x23, 23 * REGBYTES(sp)
    SAVE x24, 24 * REGBYTES(sp)
    SAVE x25, 25 * REGBYTES(sp)
    SAVE x26, 26 * REGBYTES(sp)
    SAVE x27, 27 * REGBYTES(sp)
    SAVE x28, 28 * REGBYTES(sp)
    SAVE x29, 29 * REGBYTES(sp)
    SAVE x30, 30 * REGBYTES(sp)
    SAVE x31, 31 * REGBYTES(sp)
    /* save sp to space */
    csrr t0, sscratch
    SAVE t0, 32 * REGBYTES(sp)
.endm

.macro RESTORE_ALL_CONTEXT_REG
    /* restore general register */
    # addi t0, sp, 33 * 4
    # csrw sscratch, t0
    /* restore ra to xepc */
    LOAD x1, 0 * REGBYTES(sp)
    csrw sepc, x1
    /* restore sstatus */
    LOAD x1,   2 * REGBYTES(sp)
    csrw sstatus, x1

    LOAD x1,   1 * REGBYTES(sp)
    LOAD x3,   3 * REGBYTES(sp)
    LOAD x4,   4 * REGBYTES(sp)
    LOAD x5,   5 * REGBYTES(sp)
    LOAD x6,   6 * REGBYTES(sp)
    LOAD x7,   7 * REGBYTES(sp)
    LOAD x8,   8 * REGBYTES(sp)
    LOAD x9,   9 * REGBYTES(sp)
    LOAD x10, 10 * REGBYTES(sp)
    LOAD x11, 11 * REGBYTES(sp)
    LOAD x12, 12 * REGBYTES(sp)
    LOAD x13, 13 * REGBYTES(sp)
    LOAD x14, 14 * REGBYTES(sp)
    LOAD x15, 15 * REGBYTES(sp)
    LOAD x16, 16 * REGBYTES(sp)
    LOAD x17, 17 * REGBYTES(sp)
    LOAD x18, 18 * REGBYTES(sp)
    LOAD x19, 19 * REGBYTES(sp)
    LOAD x20, 20 * REGBYTES(sp)
    LOAD x21, 21 * REGBYTES(sp)
    LOAD x22, 22 * REGBYTES(sp)
    LOAD x23, 23 * REGBYTES(sp)
    LOAD x24, 24 * REGBYTES(sp)
    LOAD x25, 25 * REGBYTES(sp)
    LOAD x26, 26 * REGBYTES(sp)
    LOAD x27, 27 * REGBYTES(sp)
    LOAD x28, 28 * REGBYTES(sp)
    LOAD x29, 29 * REGBYTES(sp)
    LOAD x30, 30 * REGBYTES(sp)
    LOAD x31, 31 * REGBYTES(sp)
    /* restore sp */
    LOAD sp, 32 * REGBYTES(sp)
.endm
