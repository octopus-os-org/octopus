const std = @import("std");

const octopus = @import("octopus");
const rvcsr = @import("csr.zig");

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
    const cause = rvcsr.mcause.read();
    const ip = rvcsr.mip.read();
    octopus.debug.printf("\nhandler register dump:\n", .{});
    octopus.debug.printf("cause: 0x{x}\n", .{cause});
    octopus.debug.printf("ip: 0x{x}\n", .{ip});

    // mark as handled (clear pending bits)
    rvcsr.mip.clear_bits(ip);
}

inline fn trig_ecall() void {
    asm volatile (
        \\ ecall
    );
}

/// mtime
inline fn get_curtick() u64 {
    var low: u32 = 0;
    var high: u32 = 0;
    asm volatile ("rdtime a0"
        : [low] "={a0}" (low),
    );
    asm volatile ("rdtimeh a0"
        : [high] "={a0}" (high),
    );
    return (@as(u64, high) << 32) | @as(u64, low);
}

fn init_trap() void {
    // rvcsr.mstatus.modifyt(.{ .MIE = 1 });
}

fn init_timer() !void {
    // rvcsr.mie.modifyt(.{ .MTIE = 1 });
}

fn test_virtio() void {
    const virtio: *VirtioMmioConfig = @as(*VirtioMmioConfig, @ptrFromInt(0x10001000));
    octopus.debug.printf("virio: {} \n", .{virtio.*});

    // rvcsr.mtvec.testw();
    // rvcsr.stvec.write(0x90);
    // rvcsr.mtvec.write(0xF0);
    // rvcsr.mtvec.clear_bits(0x80);
    // rvcsr.mtvec.set_bits(0xF0);

    init_trap();

    trig_ecall();

    octopus.debug.printf("reg mtvec: 0x{x}\n", .{rvcsr.mtvec.read()});
    octopus.debug.printf("reg mstatus: {}\n", .{rvcsr.mstatus.readt()});

    octopus.debug.printf("curtick: {}\n", .{get_curtick()});

    octopus.debug.printf("last line\n", .{});
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

    octopus.debug.puts("\ndone\n");
    while (true) {}
}
