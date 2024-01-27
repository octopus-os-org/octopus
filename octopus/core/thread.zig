const std = @import("std");

pub const ThreadEntry = *const fn (p: ?*anyopaque) void;

pub const Thread = struct {
    _thread_entry: ThreadEntry = undefined, // thread function
    _thread_entry_param: ?*anyopaque = null,

    pub fn init(self: *Thread, name: []const u8, entry: ThreadEntry, entry_param: ?*anyopaque, stack: []u8, priority: u8, tick: u32) !void {
        _ = tick;
        _ = priority;
        _ = stack;
        _ = name;
        self._thread_entry = entry;
        self._thread_entry_param = entry_param;

        // var ret = rt.rt_thread_init(&self._rt_thread, @as([*c]const u8, @ptrCast(name)), &_rt_thread_entry, self, @as(?*anyopaque, &stack[0]), stack.len, priority, tick);
        // if (ret != rt.RT_EOK) {
        //     return error.Failure;
        // }
    }

    pub fn startup(self: *Thread) !void {
        _ = self;
        // var ret = rt.rt_thread_startup(&self._rt_thread);
        // if (ret != rt.RT_EOK) {
        //     return error.Failure;
        // }
    }
};

// rt thread function
fn _rt_thread_entry(p: ?*anyopaque) callconv(.C) void {
    const t = @as(*Thread, @alignCast(@ptrCast(p.?)));

    t._thread_entry(t._thread_entry_param);
}

pub fn sleep(ticks: u32) void {
    _ = ticks;
    // _ = rt.rt_thread_delay(ticks);
}

pub fn sleepMs(ms: u32) void {
    _ = ms;
    // sleep(rt.rt_tick_from_millisecond(@as(i32, @bitCast(ms))));
}
