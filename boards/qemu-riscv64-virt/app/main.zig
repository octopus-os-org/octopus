const std = @import("std");

const octopus = @import("octopus");
const rvcsr = @import("csr.zig");
const sbi = @import("sbi.zig");
const sbiapi = @import("sbi_api_wrap.zig");

const ctx = octopus.context;

const VirtioMmioConfig = packed struct {
    magic: u32,
    version: u32,
    device_id: u32,
    vendor_id: u32,
    // rt_uint32_t magic;                  /* [0x00]<RO> Magic value */
    // rt_uint32_t version;                /* [0x04]<RO> Device version number */
    // rt_uint32_t device_id;              /* [0x08]<RO> Virtio Subsystem Device ID */
    // rt_uint32_t vendor_id;              /* [0x0c]<RO> Virtio Subsystem Vendor ID */
    // rt_uint32_t device_features;        /* [0x10]<RO> Flags representing features the device supports */
    // rt_uint32_t device_features_sel;    /* [0x14]<WO> Device (host) features word selection. */
    // rt_uint32_t res0[2];                /* [0x18] */
    // rt_uint32_t driver_features;        /* [0x20]<WO> Device features understood and activated by the driver */
    // rt_uint32_t driver_features_sel;    /* [0x24]<WO> Activated (guest) features word selection */
    // rt_uint32_t guest_page_size;        /* [0x28]<WO> Guest page size, this value should be a power of 2 */
    // rt_uint32_t res1[1];                /* [0x2c] */
    // rt_uint32_t queue_sel;              /* [0x30]<WO> Virtual queue index */
    // rt_uint32_t queue_num_max;          /* [0x34]<RO> Maximum virtual queue size */
    // rt_uint32_t queue_num;              /* [0x38]<WO> Virtual queue size */
    // rt_uint32_t queue_align;            /* [0x3c]<WO> Used Ring alignment in the virtual queue */
    // rt_uint32_t queue_pfn;              /* [0x40]<RW> Guest physical page number of the virtual queue */
    // rt_uint32_t queue_ready;            /* [0x44]<RW> Virtual queue ready bit */
    // rt_uint32_t res2[2];                /* [0x48] */
    // rt_uint32_t queue_notify;           /* [0x50]<WO> Queue notifier */
    // rt_uint32_t res3[3];                /* [0x54] */
    // rt_uint32_t interrupt_status;       /* [0x60]<RO> Interrupt status */
    // rt_uint32_t interrupt_ack;          /* [0x64]<WO> Interrupt acknowledge */
    // rt_uint32_t res4[2];                /* [0x68] */
    // rt_uint32_t status;                 /* [0x70]<RW> Device status */
    // rt_uint32_t res5[3];                /* [0x74] */
    // rt_uint32_t queue_desc_low;         /* [0x80]<WO> Virtual queue’s Descriptor Area 64 bit long physical address */
    // rt_uint32_t queue_desc_high;        /* [0x84]<WO> */
    // rt_uint32_t res6[2];                /* [0x88] */
    // rt_uint32_t queue_driver_low;       /* [0x90]<WO> Virtual queue’s Driver Area 64 bit long physical address */
    // rt_uint32_t queue_driver_high;      /* [0x94]<WO> */
    // rt_uint32_t res7[2];                /* [0x98] */
    // rt_uint32_t queue_device_low;       /* [0xa0]<WO> Virtual queue’s Device Area 64 bit long physical address */
    // rt_uint32_t queue_device_high;      /* [0xa4]<WO> */
    // rt_uint32_t res8[21];               /* [0xa8] */
    // rt_uint32_t config_generation;      /* [0xfc]<RO> Configuration atomicity value */
    // rt_uint32_t config[];               /* [0x100+]<RO> Configuration space */
};

export fn trap_handler() void {
    const cause = rvcsr.scause.read();
    const sip = rvcsr.sip.read();
    octopus.debug.printf("\nhandler register dump:\n", .{});
    octopus.debug.printf("scause: 0x{x}\n", .{cause});
    octopus.debug.printf("sip: 0x{x}\n", .{sip});

    waitms(1000);

    if (cause == 0x80000005) { // timer int
        octopus.debug.printf("curtick: {}\n", .{get_curtick()});
        sbiapi.set_timer(get_curtick() + 3 * 12 * 1000 * 1000) catch {};
    }

    // mark as handled (clear pending bits)
    rvcsr.sip.clear_bits(sip);
}

inline fn trig_sint() void {
    asm volatile (
        \\ la t0, 0x02
        \\ csrs sip, t0
    );
}

/// read mtime
inline fn get_curtick() u64 {
    var low: u64 = 0;
    asm volatile ("rdtime a0"
        : [low] "={a0}" (low),
    );
    return low;
}

fn wait(ticks: usize) void {
    const tickstart = get_curtick();
    while (get_curtick() < (tickstart + ticks)) {}
}

fn waitms(ms: usize) void {
    const ticks_per_s = 1 * 8 * 1000 * 1000;
    wait(ms * (ticks_per_s / 1000));
}

fn init_trap() void {
    // enable trap and soft-interrupt
    rvcsr.sstatus.modifyt(.{ .SIE = 1 });
    rvcsr.sie.modifyt(.{ .SSIE = 1 });
}

fn init_timer() !void {
    rvcsr.sie.modifyt(.{ .STIE = 1 });
    try sbiapi.set_timer(get_curtick() + 10000 * 1000 * 10);
}

fn test_virtio() void {
    const virtio: *VirtioMmioConfig = @as(*VirtioMmioConfig, @ptrFromInt(0x10001000));
    octopus.debug.printf("virio: {} \n", .{virtio.*});
}

fn test_trap() void {
    init_trap();

    octopus.debug.printf("reg stvec: 0x{x}\n", .{rvcsr.stvec.read()});
    octopus.debug.printf("reg sstatus: {}\n", .{rvcsr.sstatus.readt()});

    octopus.debug.printf("curtick: {}\n", .{get_curtick()});
    trig_sint();
    trig_sint();
    octopus.debug.printf("curtick: {}\n", .{get_curtick()});

    octopus.debug.printf("curtick: {}\n", .{get_curtick()});
}

fn test_sbi() void {
    _ = sbiapi.putc('Z') catch |err| {
        octopus.debug.printf("sbi error {}\n", .{err});
    };
    octopus.debug.printf("sbi write result {any}\n", .{sbi.sbi_debug_console_write("test sbi\r\n")});
    _ = sbi.sbi_debug_console_write("test sbi\r\n") catch |err| {
        octopus.debug.printf("sbi error {}\n", .{err});
    };
}

var rt1_stack_space: [1024 * 8]u8 = undefined;
fn rt1_entry() void {
    octopus.debug.puts("\nroutine1\n");
    var loopcnt: usize = 0;
    while (true) {
        waitms(50);
        loopcnt += 1;
        octopus.debug.printf("\nrt1-loopcnt: {}  {}/{}\n", .{ loopcnt, ctx.g_cur_routine.used_stack_space(), ctx.g_cur_routine.total_stack_space() });

        ctx.switch_to_routine(&rt2);
    }
}

var rt2_stack_space: [1024 * 8]u8 = undefined;
fn rt2_entry() void {
    octopus.debug.puts("\nroutine2\n");

    var loopcnt: usize = 0;
    while (true) {
        waitms(50);
        loopcnt += 1;
        octopus.debug.printf("\nrt2-loopcnt: {}  {}/{}\n", .{ loopcnt, ctx.g_cur_routine.used_stack_space(), ctx.g_cur_routine.total_stack_space() });

        ctx.switch_to_routine(&rt1);
        // switch_to_rt1(rt1.?);
        // ctx.g_to_routine = rt1;
        // ctx.do_witch();
        if (loopcnt % 50 == 0) {
            ctx.switch_to_routine(&ctx.g_main_routine);
        }
    }
}

var rt3_stack_space: [1024 * 2]u8 = undefined;
fn rt3_entry() void {
    octopus.debug.puts("\nroutine3\n");

    var loopcnt: usize = 0;
    while (true) {
        waitms(50);
        loopcnt += 1;
        octopus.debug.printf("\nrt3-loopcnt: {}  {}/{}\n", .{ loopcnt, ctx.g_cur_routine.used_stack_space(), ctx.g_cur_routine.total_stack_space() });

        ctx.switch_to_routine(&rt1);
    }
}

var rt1: ctx.RoutineContext = undefined;
var rt2: ctx.RoutineContext = undefined;
var rt3: ctx.RoutineContext = undefined;

fn test_context() void {
    // var stack_space: [1024 * 8]u8 = undefined;
    octopus.debug.puts("test context ...\n");

    rt1.init(&rt1_stack_space, &rt1_entry);
    octopus.debug.printf("entry addr: 0x{x}\n", .{&rt1_entry});
    octopus.debug.printf("stack: {any}\n", .{rt1_stack_space[(rt1_stack_space.len - (33 * 8))..]});
    const _sp: *u32 = @ptrFromInt(rt1.sp + 8);
    octopus.debug.printf("stack: 0x{x}\n", .{_sp.*});

    rt2.init(&rt2_stack_space, &rt2_entry);
    rt3.init(&rt3_stack_space, &rt3_entry);
    octopus.debug.puts("going to jump\n");

    ctx.switch_to_routine(&rt1);

    // ctx.switch_to_from_routine(&rt3, &ctx.g_main_routine);
    // ctx.direct_to_routine(rt1.?);
    // ctx.direct_to_routine(rt2.?);
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

    test_virtio();
    test_sbi();
    test_trap();

    test_context();

    octopus.debug.puts("\ndone\n");
    var loopcnt: usize = 0;
    while (true) {
        waitms(1000);
        loopcnt += 1;

        if (loopcnt % 10 == 0) {
            ctx.switch_to_routine(&rt3);
            // ctx.switch_to_from_routine(&rt3, &ctx.g_main_routine);
        }
        octopus.debug.printf("\rloopcnt: {} {}/{}", .{ loopcnt, ctx.g_main_routine.used_stack_space(), ctx.g_main_routine.total_stack_space() });
    }
}
