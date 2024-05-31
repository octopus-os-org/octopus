const std = @import("std");

const octopus = @import("octopus");

pub fn main() void {
    const tty = octopus.idm.dev.find(octopus.default.TTY);
    if (tty) |devtty| {
        // var dev: *octopus.dev.Dev = @alignCast(@ptrCast(tty));
        const say = "Welcome To App World!\r\n";
        _ = devtty.*.write(say);
    }

    if (tty) |devtty| {
        // var dev: *octopus.dev.Dev = @alignCast(@ptrCast(tty));
        const say = "[info] Echo mode\r\n";
        _ = devtty.*.write(say);
    }

    var i: u32 = 0;
    while (true) {
        i += 1;
        if (tty) |devtty| {
            // const say = "[info] Check\r\n";
            // _ = devtty.*.write(say, say.len);

            var c: [1]u8 = undefined;
            if (devtty.*.read(&c) == 1) {
                // const say2 = "[info] checked\r\n";
                // _ = devtty.*.write(say2, say2.len);
                _ = devtty.*.write(&c);
            }
        }

        if (i > 500000) {
            i = 0;
        }
    }
}

fn delay(t: u32) void {
    var i: u32 = 0;

    while (i < t) {
        i += 1;
    }
}
