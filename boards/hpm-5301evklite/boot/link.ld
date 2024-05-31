/*
 * Copyright 2021-2023 HPMicro
 * SPDX-License-Identifier: BSD-3-Clause
 */

ENTRY(_start)


/* STACK_SIZE = DEFINED(_stack_size) ? _stack_size : 0x4000;
HEAP_SIZE = DEFINED(_heap_size) ? _heap_size : 32K; */

STACK_SIZE = 0x4000;
HEAP_SIZE = 0x4000;


MEMORY
{
    XPI0 (rx) : ORIGIN = 0x80000000, LENGTH = 1M
    ILM (wx) : ORIGIN = 0x00000000, LENGTH = 128K
    DLM (w) : ORIGIN = 0x00080000, LENGTH = 128K
    AHB_SRAM (w) : ORIGIN = 0xf0400000, LENGTH = 32K
}

/* __nor_cfg_option_load_addr__ = ORIGIN(XPI0) + 0x400; */
__boot_header_start_addr = ORIGIN(XPI0) + 0x1000;
__boot_app_addr = ORIGIN(XPI0) + 0x3000;
__boot_header_length = __boot_header_end__ - __boot_header_start__;
__app_offset = __boot_app_addr - __boot_header_start_addr;

SECTIONS
{
    /* .nor_cfg_option __nor_cfg_option_load_addr__ : {
        KEEP(*(.nor_cfg_option))
    } > XPI0 */

    .boot_header __boot_header_start_addr : {
        __boot_header_start__ = .;
        KEEP(*(.bh.fw_cont_header))
        KEEP(*(.bh.fw_info_table))
        __boot_header_end__ = .;
    } > XPI0

    .text __boot_app_addr : {
        KEEP(*(.text.startup));
    } > XPI0

    .text : {
        . = ALIGN(8);
        *(.text)
        *(.text*)
        *(.rodata)
        *(.rodata*)

        /** support for octopus initialization-mechanism */
        . = ALIGN(4);
        _octopus_init_begin = .;
        KEEP(*(.octopus.init));
        _octopus_init_end = .;
        . = ALIGN(4);
    } > XPI0

    .bss(NOLOAD) : {
        . = ALIGN(8);
        _bss_start = .;
        *(.bss)
        *(.bss*)
        . = ALIGN(8);
        _bss_end = .;
    } > DLM

    _data_loadaddr = LOADADDR(.data);
    .data : {
        . = ALIGN(8);
        _data_start = .;
        /* __global_pointer$ = . + 0x800; */
        *(.data)
        *(.data*)
        . = ALIGN(8);
        _data_end = .;
    } > DLM AT>XPI0

    .reserved(NOLOAD) : {
        . = ALIGN(8);
        _stack_low = .;
        KEEP(*(.octopus.main_stack));
        _stack_high = .;

        . = ALIGN(8);
        _heap_start = .;
        KEEP(*(.octopus.heap));
        _heap_end = .;
    } > DLM

    .helper : {
        . = ALIGN(8);
        _rom_data_end = .;
    } > XPI0

    __fw_size = _rom_data_end - __boot_app_addr;
}
