- our program is ssbl(which is loaded into ddr by fsbl at here) and it's need to be relocated at address 0xC0100000 (due to the fsbl(tf-a-stm32mp157c-100ask-512d-v1.stm32) set).

- memo: the tf-a-stm32mp157c-100ask-512d-v1.stm32(called fsbl) is loaded by rom-code into onchip-ram after reset. the fsbl is responsible for initializing clock, ddr, etc. and then loading ssbl and jump to ssbl

- memo: of course we can make our program be fsbl directly, but it will ....