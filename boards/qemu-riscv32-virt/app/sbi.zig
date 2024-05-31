// Note:
// - Following sbi 2.0
// - Ignore legacy
// - Target riscv32

// TODO:
// - do optimize to remove all sbi_call_x

const SBIRet = struct {
    err: isize,
    val: isize,
};

const sbierr = error{
    SBI_ERR_FAILED,
    SBI_ERR_NOT_SUPPORTED,
    SBI_ERR_INVALID_PARAM,
    SBI_ERR_DENIED,
    SBI_ERR_INVALID_ADDRESS,
    SBI_ERR_ALREADY_AVAILABLE,
    SBI_ERR_ALREADY_STARTED,
    SBI_ERR_ALREADY_STOPPED,
    SBI_ERR_NO_SHMEM,
    SBI_ERR_INVALID_STATE,
    SBI_ERR_BAD_RANGE,
};

const sbieid = enum(u32) {
    BASE = 0x10,
    BDCN = 0x4442434E,
    TIME = 0x54494D45,
};

const sbicall = struct {
    inline fn n0(eid: u32, fid: u32) SBIRet {
        var errcode: isize = 0;
        var retval: isize = 0;
        asm volatile ("ecall"
            : [errcode] "={a0}" (errcode),
              [retval] "={a1}" (retval),
            : [eid] "{a7}" (eid),
              [fid] "{a6}" (fid),
        );
        return .{ .err = errcode, .val = retval };
    }
    inline fn n1(eid: u32, fid: u32, p1: usize) SBIRet {
        var errcode: isize = 0;
        var retval: isize = 0;

        asm volatile (""
            :
            : [p1] "{a0}" (p1),
        );
        asm volatile ("ecall"
            : [errcode] "={a0}" (errcode),
              [retval] "={a1}" (retval),
            : [eid] "{a7}" (eid),
              [fid] "{a6}" (fid),
        );
        return .{ .err = errcode, .val = retval };
    }
    inline fn n2(eid: u32, fid: u32, p1: usize, p2: usize) SBIRet {
        var errcode: isize = 0;
        var retval: isize = 0;
        asm volatile (""
            :
            : [p1] "{a0}" (p1),
              [p2] "{a1}" (p2),
        );
        asm volatile ("ecall"
            : [errcode] "={a0}" (errcode),
              [retval] "={a1}" (retval),
            : [eid] "{a7}" (eid),
              [fid] "{a6}" (fid),
        );
        return .{ .err = errcode, .val = retval };
    }
    inline fn n3(eid: u32, fid: u32, p1: usize, p2: usize, p3: usize) SBIRet {
        var errcode: isize = 0;
        var retval: isize = 0;
        asm volatile (""
            :
            : [p1] "{a0}" (p1),
              [p2] "{a1}" (p2),
              [p3] "{a2}" (p3),
        );
        asm volatile ("ecall"
            : [errcode] "={a0}" (errcode),
              [retval] "={a1}" (retval),
            : [eid] "{a7}" (eid),
              [fid] "{a6}" (fid),
        );
        return .{ .err = errcode, .val = retval };
    }
    inline fn n4(eid: u32, fid: u32, p1: usize, p2: usize, p3: usize, p4: usize) SBIRet {
        var errcode: isize = 0;
        var retval: isize = 0;
        asm volatile (""
            :
            : [p1] "{a0}" (p1),
              [p2] "{a1}" (p2),
              [p3] "{a2}" (p3),
              [p4] "{a3}" (p4),
        );
        asm volatile ("ecall"
            : [errcode] "={a0}" (errcode),
              [retval] "={a1}" (retval),
            : [eid] "{a7}" (eid),
              [fid] "{a6}" (fid),
        );
        return .{ .err = errcode, .val = retval };
    }
    inline fn n5(eid: u32, fid: u32, p1: usize, p2: usize, p3: usize, p4: usize, p5: usize) SBIRet {
        var errcode: isize = 0;
        var retval: isize = 0;
        asm volatile (""
            :
            : [p1] "{a0}" (p1),
              [p2] "{a1}" (p2),
              [p3] "{a2}" (p3),
              [p4] "{a3}" (p4),
              [p5] "{a4}" (p5),
        );
        asm volatile ("ecall"
            : [errcode] "={a0}" (errcode),
              [retval] "={a1}" (retval),
            : [eid] "{a7}" (eid),
              [fid] "{a6}" (fid),
        );
        return .{ .err = errcode, .val = retval };
    }
};

// todo: impl
// sbi_get_spec_version 0.2 0 0x10
// sbi_get_impl_id 0.2 1 0x10
// sbi_get_impl_version 0.2 2 0x10
// sbi_probe_extension 0.2 3 0x10
// sbi_get_mvendorid 0.2 4 0x10
// sbi_get_marchid 0.2 5 0x10
// sbi_get_mimpid 0.2 6 0x10

pub fn sbi_debug_console_write(data: []const u8) sbierr!isize {
    const ret = sbicall.n3(@intFromEnum(sbieid.BDCN), 0, data.len, @intFromPtr(data.ptr), 0);
    if (ret.err != 0) {
        return ecode2err(ret.err);
    }

    return ret.val;
}

pub fn sbi_debug_console_read(buf: []u8) sbierr!usize {
    const ret = sbicall.n3(@intFromEnum(sbieid.BDCN), 0, buf.len, @intFromPtr(buf.ptr), 0);
    if (ret.err != 0) {
        return ecode2err(ret.err);
    }
    return ret.val;
}

pub fn sbi_debug_console_write_byte(c: u8) sbierr!void {
    const ret = sbicall.n1(@intFromEnum(sbieid.BDCN), 2, c);
    if (ret.err != 0) {
        return ecode2err(ret.err);
    }
}
/// Programs the clock for next event after stime_value time. stime_value is in absolute time.
pub fn sbi_set_timer(clock: u64) sbierr!void {
    const ret = sbicall.n2(@intFromEnum(sbieid.TIME), 0, @as(u32, @truncate(clock)), @as(u32, @truncate(clock >> 32)));
    if (ret.err != 0) {
        return ecode2err(ret.err);
    }
}

/// error-code -> error
fn ecode2err(errcode: isize) sbierr {
    return switch (errcode) {
        -1 => sbierr.SBI_ERR_FAILED,
        -2 => sbierr.SBI_ERR_NOT_SUPPORTED,
        -3 => sbierr.SBI_ERR_INVALID_PARAM,
        -4 => sbierr.SBI_ERR_DENIED,
        -5 => sbierr.SBI_ERR_INVALID_ADDRESS,
        -6 => sbierr.SBI_ERR_ALREADY_AVAILABLE,
        -7 => sbierr.SBI_ERR_ALREADY_STARTED,
        -8 => sbierr.SBI_ERR_ALREADY_STOPPED,
        -9 => sbierr.SBI_ERR_NO_SHMEM,
        -10 => sbierr.SBI_ERR_INVALID_STATE,
        -11 => sbierr.SBI_ERR_BAD_RANGE,
        else => unreachable,
    };
}
