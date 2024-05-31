.extern __boot_header_length
.extern __app_offset

.section .bh.fw_cont_header,"a",%progbits
.type  fw_cont_header, %object
fw_cont_header:
// Magic number STM32 (in big endian) 32-bit
    .byte 0xBF // tag fixed-value 
    .byte 0x10 // version fixed-value
    // .4byte __boot_header_length // length 2byte
    // .4byte 0 // flags 0

    .4byte __boot_header_length // length 2byte
    .2byte 0 // flags 0

    .2byte 0 // sw_version
    .byte 0 // fuse_version
    .byte 1 // number of fw
    .2byte 0 // device_config_block_offset
    .2byte 0 // signature_block_offset


.section .bh.fw_info_table,"a",%progbits
.type  fw_info_table, %object
fw_info_table:
    .4byte __app_offset
    .4byte __fw_size
    .4byte 0

    .4byte 0
    .4byte __boot_app_addr
    .4byte 0
    .4byte __boot_app_addr
    .4byte 0
