
.section .stm32header,"a",%progbits
.type  _stm32header, %object
_stm32header:
@ Magic number STM32 (in big endian) 32-bit
    .byte 0x53
    .byte 0x54
    .byte 0x4D
    .byte 0x32
@ Image signature 512-bit = 64B (ignore)
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
@ Image checksum 32-bit (ignore)
    .word 0
@ Header version 32-bit fixed v1.0
    .byte 0 @ reserved
    .byte 1 @ major version
    .byte 0 @ minor version
    .byte 0 @ reserved
@ Image length 32-bit (ignore) fixed (2FFFFFFF - 0x2FFC2500)
    .word 0x3DAFF
@ Image entry point 32-bit fixed 0x2FFC2500
    .word 0x2FFC2500
@ Reserved1 32-bit
    .word 0
@ Load address 32-bit fixed 0x2FFC2500
    .word 0x2FFC2500
@ Reserved2 32-bit
    .word 0
@ Image version number
    .word 0x1
@ Option flags 32-bit
    .word 0x1
@ ECDSA algorithm 32-bit 
    .word 1
@ ECDSA public key 512-bit (ignore)
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
@ Padding 83-byte
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .byte 0
    .byte 0
    .byte 0
@ Binary type 1-byte
    .byte 0x10
