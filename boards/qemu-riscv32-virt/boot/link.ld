/* Define the entry point of the output file. */
ENTRY(_start)


/*
 * Memory layout:
 * 0x80000000 - 0x80200000: SBI
 * 0x80200000 - 0x81200000: Kernel
 */

/* Define memory regions. */
MEMORY
{
  ram (rwx) : ORIGIN = 0x80200000, LENGTH = 10M
  rom (rx)  : ORIGIN = ORIGIN(ram) + 10M, LENGTH = 1M
}

/* Define sections. */
SECTIONS
{
    .start :
    {
      *(.start)

    } > ram

    . = ALIGN(8);

  .text : {
    *(.text)  /* Program code */
    *(.text*)  /* Program code */
    *(.rodata)  /* Read-only data */
    *(.rodata*)  /* Read-only data */
    *(.srodata)
    *(.srodata*)
    /** support for octopus initialization-mechanism */
    . = ALIGN(4);
    _octopus_init_begin = .;
    KEEP(*(.octopus.init));
    _octopus_init_end = .;
    . = ALIGN(4);
  } >ram

 . = ALIGN(4);
  _data_loadaddr = LOADADDR(.data);
  .data : {
    . = ALIGN(4);
    _data_start = .;
    *(.data)  /* Read-write non-zero initialized data */
    *(.data*)  /* Read-write non-zero initialized data */
    *(.sdata) 
    *(.sdata*)
    _data_end = .;
    . = ALIGN(4);
  } >ram AT>rom

  .bss(NOLOAD) : {
    _bss_start = .;
    *(.bss) /* Read-write zero initialized data */
    *(.bss*) /* Read-write zero initialized data */
    *(.sbss)
    *(.sbss*)
    _bss_end = .;
  } > ram 

  .reserved(NOLOAD) : {
    . = ALIGN(8);
    _stack_low = .;
    KEEP(*(.octopus.main_stack));
    _stack_high = .;

    . = ALIGN(8);
    _heap_start = .;
    KEEP(*(.octopus.heap));
    _heap_end = .;
  } > ram

  PROVIDE(_memory_start = ORIGIN(ram));
  PROVIDE(_memory_end = ORIGIN(ram) + LENGTH(ram));
  PROVIDE(stack_top = _stack_high);
  end = .;
}