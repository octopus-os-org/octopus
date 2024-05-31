OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)

ENTRY(_start)


/* Define memory regions. */
MEMORY
{
  ROM (rx)  : ORIGIN = 0x60010000, LENGTH = 2M
  RAM (rwx) : ORIGIN = ORIGIN(ROM) + 2M, LENGTH = 32M
}

/* Define the entry point of the output file. */
ENTRY(_start)

/* Define sections. */
SECTIONS
{
    .text : {
         KEEP(*(.vector_table)); /* Vector table and pretect this section from removing (the optmization will remove unrefered code) */
        *(.text)  /* Program code */
        *(.text*)  /* Program code */
        *(.rodata)  /* Read-only data */
        *(.rodata*)  /* Read-only data */
        
        /** support for octopus initialization-mechanism */
        . = ALIGN(4);
        _octopus_init_begin = .;
        KEEP(*(.octopus.init));
        _octopus_init_end = .;
        . = ALIGN(4);
    } >ROM

    .ARM.exidx :
    {
        __exidx_start = .;
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
        __exidx_end = .;
    } >RAM

    _data_loadaddr = LOADADDR(.data);
    .data : {
        . = ALIGN(8);
        _data_start = .;
        *(.data)  /* Read-write initialized data */
        *(.data*)  /* Read-write initialized data */
        . = ALIGN(8);
        _data_end = .;
    } >RAM AT>ROM

    .bss : {
        . = ALIGN(8);
        _bss_start = .;
        *(.bss) /* zero-initialized data */
        *(.bss*) /* zero-initialized data */
        . = ALIGN(8);
        _bss_end = .;
    } > RAM 

    .reserved(NOLOAD) : {
        /* stack */
        . = ALIGN(8);
        _stack_low = .;
        KEEP(*(.octopus.main_stack));
        _stack_high = .;
        /* heap */
        . = ALIGN(8);
        _heap_start = .;
        KEEP(*(.octopus.heap));
        _heap_end = .;

        /* stack for fiq */
        . = ALIGN(8);
        _fiq_stack_low = .;
        . += 16K;
        _fiq_stack_high = .;
        /* stack for irq */
        . = ALIGN(8);
        _irq_stack_low = .;
        . += 16K;
        _irq_stack_high = .;

    } > RAM

    .comment 0 : { *(.comment) }
}
