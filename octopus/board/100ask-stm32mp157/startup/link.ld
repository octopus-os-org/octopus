/* Define memory regions. */
MEMORY
{
  /* sysram start_address: 0x2FFC0000 end_address:2FFF_FFFF size:256KB*/
  /* RAMh0(r): ORIGIN = 0x2FFC0000, LENGTH = 0x2400 reserved for specifal purpose (hardware specific)*/
  /* RAMh1(r): ORIGIN = 0x2FFC2400, LENGTH = 0x100 reserved for stm32 header*/
  /* ROM (rx)  : ORIGIN = 0x2FFC2500, LENGTH = 32K 
  RAM (rwx) : ORIGIN = 0x2FFD0000, LENGTH = 128K */
  HEADER (rwx) : ORIGIN = 0x2FFC2400, LENGTH = 256
  SYSRAM (rwx) : ORIGIN = 0x2FFC2500, LENGTH = (256K - 0x2500)
}

/* Define the entry point of the output file. */
ENTRY(_startup)

/* _stack_end = ORIGIN(SYSRAM) + LENGTH(SYSRAM);    end of RAM */

/* Define sections. */
SECTIONS
{
  .header : {
     KEEP(*(.stm32header));
  }>HEADER

  .text : {
    . = ALIGN(4);
    KEEP(*(.text.vector_table)); /* Vector table and pretect this section from removing (the optmization will remove unrefered code) */
    *(.text)  /* Program code */
    *(.text*)  /* Program code */
    *(.rodata*)  /* Read-only data */
    . = ALIGN(4);
  } >SYSRAM

  .data : {
    . = ALIGN(4);
    _data_start = .;
    *(.data)  /* Read-write initialized data */
    *(.data*)  /* Read-write initialized data */
    . = ALIGN(4);
    _data_end = .;
  } > SYSRAM

  .bss : {
    . = ALIGN(4);
    _bss_start = .;
    *(.bss*)
    . = ALIGN(4);
    _bss_end = .;
  } > SYSRAM 

  .ARM.exidx : {
    *(.ARM.exidx*)
  } > SYSRAM


  /* stack section, used to check that there is enough RAM left */
  ._all_stack :
  {
    . = ALIGN(8);
    /* fiq stack */
    PROVIDE ( _fiq_stack_start = . );
    . = . + 0x2000; /* 8KB */
    PROVIDE ( _fiq_stack_end = . );

    /* irq stack */
    PROVIDE ( _irq_stack_start = . );
    . = . + 0x2000; /* 8KB */
    PROVIDE ( _irq_stack_end = . );

    /* main stack */
    PROVIDE ( _stack_start = . );
    . = . + 0x10000; /* 8KB */
    PROVIDE ( _stack_end = . );

    . = ALIGN(8);
  } > SYSRAM

  /* 32KB */
  /* ._os_heap :
  {
    . = ALIGN(8);
    . = (0x2FFFFFFF - 0x8000);
    . = 0x2FFFFFFF;
    . = ALIGN(8);
  } > SYSRAM */

}
