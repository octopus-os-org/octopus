const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");
const board = @import("board/board.zig");
const os = @import("octopus");

const std = @import("std");

const chip = @import("octopus").chip.st.stm32f407vet6;

var _buffer: [256]u8 = undefined;

pub fn app_entry(p: ?*anyopaque) void {
    _ = p;

    if (chip.pinid.pin_id_from_hrs("B00")) |pin| {
        _ = chip.pinmgr.pinmgr_set_pin_mux(pin, 0x40) catch {};
    } else |_| {
        board.uart.puts("adc pin error\r\n");
    }

    chip.adcmgr.adcmgr_init();

    while (true) {
        board.led.led_toggle();

        // Sleep for some time
        os.thread.sleepMs(500);

        // if (board.uart.uart_getc_noblock()) |rd| {
        //     board.uart.uart_putc(rd);
        // }

        if (chip.adcid.adc_id_from_hrs("ADC1CH08")) |ch| {
            var res = chip.adcmgr.adcmgr_start_and_wait_channel_once(ch);

            if (std.fmt.bufPrint(&_buffer, "val:{} .\r\n", .{res})) |buf| {
                board.uart.puts(buf);
            } else |_| {
                board.uart.puts("adc error\r\n");
            }
        } else |_| {}
    }
}
