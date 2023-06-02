const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");

pub fn main() void {
    periph.clock.clock_init();
    // Enable GPIOD port
    regs.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });
    regs.RCC.APB1ENR.modify(.{ .USART2EN = 1 });

    // Set pin 9/10 mode to Alternate function mode
    regs.GPIOA.MODER.modify(.{ .MODER2 = 0b10, .MODER3 = 0b10 });
    regs.GPIOA.AFRL.modify(.{ .AFRL2 = 0b0111, .AFRL3 = 0b0111 });

    // Set pin 8
    regs.GPIOA.MODER.modify(.{ .MODER12 = 0b01 });

    regs.USART2.CR1.modify(.{ .UE = 0 });
    regs.USART2.BRR.modify(.{ .DIV_Fraction = 12, .DIV_Mantissa = 22 });
    regs.USART2.CR1.modify(.{ .UE = 1, .TE = 1, .RE = 1, .M = 0, .OVER8 = 0 });
    regs.USART2.DR.write_raw(':');

    while (true) {
        var leds_state = regs.GPIOA.ODR.read();

        regs.GPIOA.ODR.modify(.{
            .ODR12 = ~leds_state.ODR12,
        });

        // Sleep for some time
        var i: u32 = 0;
        while (i < 900000) {
            asm volatile ("nop");
            i += 1;
        }
        if (regs.USART2.SR.read().RXNE == 1) {
            regs.USART2.SR.modify(.{ .RXNE = 0 });
            var rd = (regs.USART2.DR.read().DR);
            regs.USART2.DR.write_raw(rd & 0xff);
        }
    }
}
