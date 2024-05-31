
.equ REGBYTES, 4

.macro SAVE reg, addr 
    sw \reg , \addr
.endm 

.macro LOAD reg, addr 
    lw \reg, \addr
.endm 

