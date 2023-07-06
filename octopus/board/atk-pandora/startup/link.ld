/*
 * This file is part of the libopencm3 project.
 *
 * Copyright (C) 2009 Uwe Hermann <uwe@hermann-uwe.de>
 * Copyright (C) 2011 Stephen Caudle <scaudle@doceme.com>
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */

/* Linker script for ST STM32F4DISCOVERY (STM32F407VG, 1024K flash, 128K RAM,
 * 64K Core Coupled Memory RAM).
 */

/* Define the entry point of the output file. */
ENTRY(_startup)

/* Define memory regions. */
MEMORY
{
  ROM (rx)  : ORIGIN = 0x08000000, LENGTH = 512K
  RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 96K
  CCMRAM (xrw) : ORIGIN = 0x10000000, LENGTH = 32K
}

/* Define sections. */
SECTIONS
{
  .text : {
    . = ALIGN(4);
    KEEP(*(.vector_table)); /* Vector table and pretect this section from removing (the optmization will remove unrefered code) */
    *(.text)  /* Program code */
    *(.text*)  /* Program code */
    *(.rodata)  /* Read-only data */
    *(.rodata*)  /* Read-only data */

    /* section information for finsh shell */
    . = ALIGN(4);
    __fsymtab_start = .;
    KEEP(*(FSymTab))
    __fsymtab_end = .;
    
    . = ALIGN(4);
    __vsymtab_start = .;
    KEEP(*(VSymTab))
    __vsymtab_end = .;

    . = ALIGN(4);
  } >ROM

  _data_loadaddr = LOADADDR(.data);
  .data : {
    . = ALIGN(4);
    _data_start = .;
    *(.data)  /* Read-write non-zero initialized data */
    *(.data*)  /* Read-write non-zero initialized data */
    . = ALIGN(4);
    _data_end = .;
  } >RAM AT>ROM

  .bss : {
    . = ALIGN(4);
    _bss_start = .;
    *(.bss) /* Read-write zero initialized data */
    *(.bss*) /* Read-write zero initialized data */
    . = ALIGN(4);
    _bss_end = .;
  } > RAM 

  /* _stack_start = ADDR(.bss) + SIZEOF(.bss); */
  /* _stack_end = _stack_start + 0x1000; 64KB */
}

PROVIDE(_stack_end = ORIGIN(RAM) + LENGTH(RAM));
