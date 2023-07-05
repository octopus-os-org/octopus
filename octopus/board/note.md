# BOARD PACT

The job of "board" is something like a bootloader

## Behaviors and Existences

- must have obuild.zig file
- responsible for the most initial taking of the control of program-flow (e.g initialize sp ..., to make runtime environment ready)
- must call 'app.main' for transfering the control of program-flow