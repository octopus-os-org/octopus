.equ REGBYTES, 8

.section .text.start
.extern resetHandler

.section .text.startup
.globl _start
_start:
    csrr   t0, mhartid
    lui    t1, 0
    beq    t0, t1, 2f

1:  wfi
    j      1b

2:
    # initialize global pointer
    # la gp, _gp
  
    # initialize stack pointer
    la sp, _stack_high
    call   resetHandler


