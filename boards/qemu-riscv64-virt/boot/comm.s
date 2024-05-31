
.equ REGBYTES, 8

.macro SAVE reg, addr 
    sd \reg , \addr
.endm 

.macro LOAD reg, addr 
    ld \reg, \addr
.endm 

