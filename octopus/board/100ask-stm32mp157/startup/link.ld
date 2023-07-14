/* Define memory regions. */
MEMORY
{
  /* sysram start_address: 0x2FFC0000 end_address:2FFF_FFFF (size:256KB*/
  /* RAMh0(r): ORIGIN = 0x2FFC0000, LENGTH = 0x2400 is used by rom-code) (size: 9KB*/
  /* RAMh1(r): ORIGIN = 0x2FFC2400, LENGTH = 0x100 reserved for stm32 header (size: 256B*/
  /* and then the left(0x2FFC2500 - 0x2FFFFFFF) is for user-code (size: 246.75KB  */

  /* HEADER (rwx) : ORIGIN = 0x2FFC2400, LENGTH = 256 */
  /* SYSRAM (rwx) : ORIGIN = 0x2FFC2500, LENGTH = (256K - 0x2500) */


  /* The following defines ddr-ram which is start at address 0xC000_0000 and end at 0xDFFF_FFFF */
  /* the ddr-ram size is 512MB on board 100ask-stm32mp157_v11  */
  SYSRAM (rwx) : ORIGIN = 0xC0100000, LENGTH = (512M - 0x100000)
}

/* Define the entry point of the output file. */
ENTRY(_startup)

/* _stack_end = ORIGIN(SYSRAM) + LENGTH(SYSRAM);    end of RAM */

/* Define sections. */
SECTIONS
{
  /* .header : {
     KEEP(*(.stm32header));
  }>HEADER */

  .text : {
    . = ALIGN(4);
    KEEP(*(.text.startup));
    /* KEEP(*(.text.vector_table)); Vector table and pretect this section from removing (the optmization will remove unrefered code) */
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
