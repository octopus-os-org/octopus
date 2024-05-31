.include "comm.s"

.equ CTX_FRAME_SIZE, 33

// layout:
// space-offset  content
// 32            sp
// 31            x31
// ...           ...
// 3             x3
// 2             -
// 1             x1
// 0             -

/// do save context (by sp)
.macro SAVE_CONTEXT
    /* save current sp to space */
    SAVE sp, -1*REGBYTES(sp)
    /* prepare space */
    addi sp, sp, -CTX_FRAME_SIZE * REGBYTES
    /* save ra */ 
    SAVE x1,   1 * REGBYTES(sp)
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
.endm

/// do load context (by sp)
.macro LOAD_CONTEXT 
    /* restore general register */
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

/// do init context space (by a0 a1)
/// treat a0 as sp
/// treat a1 as ra
.macro INIT_CONTEXT_SPACE
    /* save sp to space */
    SAVE a0, -1*REGBYTES(a0)
    /* prepare space */
    addi a0, a0, -CTX_FRAME_SIZE * REGBYTES
    /* save ra */ 
    SAVE a1,   1 * REGBYTES(a0)
    /* clear others */
    SAVE x0,   3 * REGBYTES(a0)
    SAVE x0,   4 * REGBYTES(a0)
    SAVE x0,   5 * REGBYTES(a0)
    SAVE x0,   6 * REGBYTES(a0)
    SAVE x0,   7 * REGBYTES(a0)
    SAVE x0,   8 * REGBYTES(a0)
    SAVE x0,   9 * REGBYTES(a0)
    SAVE x0,  10 * REGBYTES(a0)
    SAVE x0,  11 * REGBYTES(a0)
    SAVE x0,  12 * REGBYTES(a0)
    SAVE x0,  13 * REGBYTES(a0)
    SAVE x0,  14 * REGBYTES(a0)
    SAVE x0,  15 * REGBYTES(a0)
    SAVE x0,  16 * REGBYTES(a0)
    SAVE x0,  17 * REGBYTES(a0)
    SAVE x0,  18 * REGBYTES(a0)
    SAVE x0,  19 * REGBYTES(a0)
    SAVE x0,  20 * REGBYTES(a0)
    SAVE x0,  21 * REGBYTES(a0)
    SAVE x0,  22 * REGBYTES(a0)
    SAVE x0,  23 * REGBYTES(a0)
    SAVE x0,  24 * REGBYTES(a0)
    SAVE x0,  25 * REGBYTES(a0)
    SAVE x0,  26 * REGBYTES(a0)
    SAVE x0,  27 * REGBYTES(a0)
    SAVE x0,  28 * REGBYTES(a0)
    SAVE x0,  29 * REGBYTES(a0)
    SAVE x0,  30 * REGBYTES(a0)
    SAVE x0,  31 * REGBYTES(a0)
.endm

/// Switch context to `a0` without saving the current
/// fn (to: *usize) void
/// `a0` == to
/// note: to is context handle (i.e. sp)
.global context_direct_switch_to 
context_direct_switch_to:
    /* restore target context handle (sp)*/
    LOAD sp, (a0)
    /* restore context by context handle */
    LOAD_CONTEXT
    /* return */
    ret

/// Switch context to `a0` from `a1`
/// fn (to: *usize, from: *usize) void
/// `a0` == to
/// `a1` == from
/// note: to and from all are context handle (i.e. sp)
.global context_switch_to_from
context_switch_to_from:
    /* save current context */
    SAVE_CONTEXT
    /* store the saved context handle to space pointed by a1 */
    SAVE sp, (a1)
    /* restore target context handle (sp)*/
    LOAD sp, (a0)
    LOAD_CONTEXT

    /* return */
    ret

/// Init context space
/// fn (sp: *usize, entry: usize) void
/// a0 == sp
/// a1 == entry
/// note: only set SP and RA and the others will be zero; the sp value will be changed
.global context_init_space
context_init_space:
    // prepare
    mv t0, a0
    LOAD a0, (a0)
    // do init space
    INIT_CONTEXT_SPACE
    // save space index
    SAVE a0, (t0)

    ret
