# BOARD PACT

The job of "board" is something like a bootloader

## Behaviors and Existences

- ~~must have obuild.zig file~~
- responsible for the most initial taking of the control of program-flow (e.g initialize sp ..., to make runtime environment ready)

- responsible for the basic initializations like clock, interrupt, uart(log device)

- ~~responsible for the interrupt vector-table initialization~~
- ~~responsible for the basic clock intialization~~
- ~~responsible for the os clock intialization (e.g. systick)~~

- ~~the systick interrupt handler is "extern SysTickIrqHandler"~~
- ~~the pendsv interrupt handler is "extern PendSV_Handler"~~

- ~~responsible for the basic I/O device(e.g. uart) intialization to interact with users~~


- responsible for prividing heap (buffer) by calling:`octopus.set_heap_mem(xxx)
`

- need call 'octopus.entry()' for transfering the control of program-flow to octopus


- for context
    - need support global functions `export fn main_stack_size() usize` and  
    `export fn main_stack_addr() usize` 
    - need support functions `.global context_init_space` and `.global context_switch_to_from` and `.global context_direct_switch_to`. 
    the calling conventions are arch-dependent (see 'context-calling-convention')

- (optional,recommend) enable octopus-debug by calling `octopus.debug.set_lower_puts(xxx)`
- todig ~~(optional,recommend) enable octopus-tickm by calling "octopus.tickm.set_lower_ticker(xxx)"~~


##### context-calling-convention

`arg1 == to`

`arg2 == from`

- arm: 
    - `arg1 == r0` 
    - `arg2 == r1`
- riscv
    - `arg1 == a0` 
    - `arg2 == a1` 