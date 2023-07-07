# BOARD PACT

The job of "board" is something like a bootloader

## Behaviors and Existences

- must have obuild.zig file
- responsible for the most initial taking of the control of program-flow (e.g initialize sp ..., to make runtime environment ready)
- responsible for the interrupt vector-table initialization
- responsible for the basic clock intialization
- responsible for the os clock intialization (e.g. systick)
- must call 'app.main' for transfering the control of program-flow

- the systick interrupt handler is "extern SysTickIrqHandler"
- the pendsv interrupt handler is "extern PendSV_Handler"