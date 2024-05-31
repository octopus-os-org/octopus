.cpu cortex-m4
.syntax unified
.thumb
.text

.equ REGBYTES, 4

.macro SAVE_CONTEXT
    // note: ！will save and then update sp

    // save sp to space
    str sp, [sp, #-1*REGBYTES]
    // save return-address 
    str lr, [sp, #-2*REGBYTES] 
    // save xpsr
    // use lr as temporary register
    mrs lr, xpsr
    str lr, [sp, #-3*REGBYTES] 
    ldr lr, [sp, #-2*REGBYTES]  
    // and then save rx
    str r0, [sp, #-4*REGBYTES]    
    str r1, [sp, #-5*REGBYTES]    
    str r2, [sp, #-6*REGBYTES]    
    str r3, [sp, #-7*REGBYTES]    
    str r4, [sp, #-8*REGBYTES]    
    str r5, [sp, #-9*REGBYTES]
    str r6, [sp, #-10*REGBYTES]
    str r7, [sp, #-11*REGBYTES]
    str r8, [sp, #-12*REGBYTES]
    str r9, [sp, #-13*REGBYTES]
    str r10, [sp, #-14*REGBYTES]
    str r11, [sp, #-15*REGBYTES]
    str r12, [sp, #-16*REGBYTES]

    sub sp, sp, #16*REGBYTES

.endm

.macro LOAD_CONTEXT
    // note: load and then update sp
    add sp, sp, #16*REGBYTES

    // load rx
    ldr r0, [sp, #-4*REGBYTES]    
    ldr r1, [sp, #-5*REGBYTES]    
    ldr r2, [sp, #-6*REGBYTES]    
    ldr r3, [sp, #-7*REGBYTES]    
    ldr r4, [sp, #-8*REGBYTES]    
    ldr r5, [sp, #-9*REGBYTES]
    ldr r6, [sp, #-10*REGBYTES]
    ldr r7, [sp, #-11*REGBYTES]
    ldr r8, [sp, #-12*REGBYTES]
    ldr r9, [sp, #-13*REGBYTES]
    ldr r10, [sp, #-14*REGBYTES]
    ldr r11, [sp, #-15*REGBYTES]
    ldr r12, [sp, #-16*REGBYTES]

    // restore xpsr
    ldr r0, [sp, #-3*REGBYTES]
    msr xpsr, r0 
    ldr r0, [sp, #-4*REGBYTES]

    // restore return-address
    ldr lr, [sp, #-2*REGBYTES] 

    // restore sp
    ldr sp, [sp, #-1*REGBYTES]

.endm

/// do init context space (by r0 r1)
/// treat r0 as sp
/// treat r1 as ra (return address)
.macro INIT_CONTEXT_SPACE
    // sp
    str r0, [r0, #-1*REGBYTES]

    // return-address 
    str r1, [r0, #-2*REGBYTES]

    // xpsr
    mrs r1, xpsr      
    str r1, [r0, #-3*REGBYTES]
    
    // and then save rx
    mov r1, #0

    str r1, [r0, #-4*REGBYTES]  
    str r1, [r0, #-5*REGBYTES]  
    str r1, [r0, #-6*REGBYTES]  
    str r1, [r0, #-7*REGBYTES]  
    str r1, [r0, #-8*REGBYTES]  
    str r1, [r0, #-9*REGBYTES]
    str r1, [r0, #-10*REGBYTES]
    str r1, [r0, #-11*REGBYTES]
    str r1, [r0, #-12*REGBYTES]
    str r1, [r0, #-13*REGBYTES]
    str r1, [r0, #-14*REGBYTES]
    str r1, [r0, #-15*REGBYTES]
    str r1, [r0, #-16*REGBYTES]

    sub r0, r0, #16*REGBYTES

.endm



/// Switch context to `r0` without saving the current
/// fn (to: *usize) void
/// `r0` == to
/// note: to is context handle (i.e. sp)
.global context_direct_switch_to 
.thumb_func
context_direct_switch_to:
    /* restore target context handle (sp)*/
    ldr sp, [r0]
    /* restore context by context handle */
    LOAD_CONTEXT
    /* return */
    bx lr


/// Switch context to `r0` from `r1`
/// fn (to: *usize, from: *usize) void
/// `r0` == to
/// `r1` == from
/// note: to and from all are context handle (i.e. sp)
.global context_switch_to_from
.thumb_func
context_switch_to_from:
    /* save current context */
    SAVE_CONTEXT
    /* store the saved context handle to space pointed by r1 */
    str sp, [r1]
    /* restore target context handle (sp)*/
    ldr sp, [r0]
    LOAD_CONTEXT

    /* return */
    bx lr

/// Init context space
/// fn (sp: *usize, entry: usize) void
/// r0 == sp
/// r1 == entry
/// note: only set SP and RA and the others will be zero; the sp value will be changed
.global context_init_space
.thumb_func
context_init_space:
    // prepare
    mov r2, r0
    ldr r0, [r0]
    // do init space
    INIT_CONTEXT_SPACE
    // save space index
    str r0, [r2]
    // return
    bx lr
