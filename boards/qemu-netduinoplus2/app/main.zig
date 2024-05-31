const std = @import("std");

const octopus = @import("octopus");
const ctx = octopus.context;

var rt1: ctx.RoutineContext = undefined;
var rt1_stack_space: [1024 * 1]u8 = undefined;
fn rt1_entry() void {
    octopus.debug.puts("\nroutine1\n");
    var loopcnt: usize = 0;
    while (true) {
        waitms(50);
        loopcnt += 1;
        octopus.debug.printf("\nrt1-loopcnt: {}  {}/{}\n", .{ loopcnt, ctx.g_cur_routine.used_stack_space(), ctx.g_cur_routine.total_stack_space() });

        // ctx.switch_to_routine(&rt2);
        if (loopcnt % 50 == 0) {
            // ctx.switch_to_routine(&ctx.g_main_routine);
            ctx.switch_to_routine(&rt2);
        }
    }
}

var rt2: ctx.RoutineContext = undefined;
var rt2_stack_space: [1024 * 1]u8 = undefined;
fn rt2_entry() void {
    octopus.debug.puts("\nroutine2\n");
    var loopcnt: usize = 0;
    while (true) {
        waitms(50);
        loopcnt += 1;
        octopus.debug.printf("\nrt2-loopcnt: {}  {}/{}\n", .{ loopcnt, ctx.g_cur_routine.used_stack_space(), ctx.g_cur_routine.total_stack_space() });

        // ctx.switch_to_routine(&rt2);
        if (loopcnt % 50 == 0) {
            // ctx.switch_to_routine(&ctx.g_main_routine);
            ctx.switch_to_routine(&rt3);
        }
    }
}

var rt3: ctx.RoutineContext = undefined;
var rt3_stack_space: [256 * 1]u8 = undefined;
fn rt3_entry() void {
    octopus.debug.puts("\nroutine3\n");
    var loopcnt: usize = 0;
    octopus.debug.puts("\nroutine3 2\n");

    while (true) {
        waitms(50);
        loopcnt += 1;
        octopus.debug.puts("\nroutine3 3\n");
        // octopus.debug.printf("\nrt3-loopcnt: {}  {}/{}\n", .{ loopcnt, ctx.g_cur_routine.used_stack_space(), ctx.g_cur_routine.total_stack_space() });

        octopus.debug.printf("\nrt3-loopcnt: {}  {}\n", .{ loopcnt, ctx.g_cur_routine });

        octopus.debug.printf("rt3: sp:{x} stack:{x} {} entry:{}\n", .{ rt3.sp, @intFromPtr(rt3.stack.ptr), rt3.stack.len, rt3.entry });

        // ctx.switch_to_routine(&rt2);
        if (loopcnt % 50 == 0) {
            ctx.switch_to_routine(&ctx.g_main_routine);
            // ctx.switch_to_routine(&rt2);
            // octopus.debug.puts("50\n");
        }
    }
}

extern fn main_stack_size() usize;
extern fn main_stack_addr() usize;

fn test_routine() void {
    rt1.init(&rt1_stack_space, &rt1_entry);
    octopus.debug.printf("entry addr: 0x{x}\n", .{&rt1_entry});
    octopus.debug.printf("stack: {any}\n", .{rt1_stack_space[(rt1_stack_space.len - (15 * 4))..]});
    // const _sp: *u32 = @ptrFromInt(rt1.sp + 4);
    // octopus.debug.printf("stack: 0x{x}\n", .{_sp.*});

    rt2.init(&rt2_stack_space, &rt2_entry);
    rt3.init(&rt3_stack_space, &rt3_entry);

    octopus.debug.printf("rt3 entry addr: 0x{x}\n", .{&rt3_entry});
    octopus.debug.printf("rt3 stack addr: {*} {} {}\n", .{ rt3.stack.ptr, &rt3_stack_space[0], rt3_stack_space.len });

    octopus.debug.printf("rt2 entry addr: 0x{x}\n", .{&rt2_entry});
    octopus.debug.printf("rt2 stack addr: {*} {} {}\n", .{ rt2.stack.ptr, &rt2_stack_space[0], rt2_stack_space.len });

    ctx.switch_to_routine(&rt3);
    ctx.switch_to_routine(&ctx.g_main_routine);
    // ctx.switch_to_routine(&rt2);
}

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

    octopus.debug.puts("hello from main\n");

    test_routine();

    var loopcnt: usize = 0;
    while (true) {
        waitms(1000);
        loopcnt += 1;

        // octopus.debug.printf("\rloopcnt: {}", .{loopcnt});
        octopus.debug.printf("\rmain loopcnt: {} {}/{}", .{ loopcnt, ctx.g_main_routine.used_stack_space(), ctx.g_main_routine.total_stack_space() });

        if (loopcnt % 10 == 0) {
            ctx.switch_to_routine(&rt1);
            // ctx.direct_to_routine(&rt3);
            // ctx.switch_to_from_routine(&rt3, &ctx.g_main_routine);
        }
    }
}

fn waitms(ms: usize) void {
    for (0..(100000 * ms)) |_| {
        asm volatile ("nop");
    }
}
