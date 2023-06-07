const std = @import("std");

const rt = @cImport({
    @cInclude("rtapi.h");
});

pub const ThreadEntry = *const fn (p: ?*anyopaque) void;

pub const Thread = struct {
    _thread_entry: ThreadEntry = undefined, // thread function
    _thread_entry_param: ?*anyopaque = null,
    _rt_thread: rt.rt_thread = undefined, // rt thread handle

    pub fn init(self: *Thread, name: []const u8, entry: ThreadEntry, entry_param: ?*anyopaque, stack: []u8, priority: u8, tick: u32) !void {
        self._thread_entry = entry;
        self._thread_entry_param = entry_param;

        var ret = rt.rt_thread_init(&self._rt_thread, @ptrCast([*c]const u8, name), &_rt_thread_entry, self, @ptrCast(?*anyopaque, &stack[0]), stack.len, priority, tick);
        if (ret != rt.RT_EOK) {
            return error.Failure;
        }
    }

    pub fn startup(self: *Thread) !void {
        var ret = rt.rt_thread_startup(&self._rt_thread);
        if (ret != rt.RT_EOK) {
            return error.Failure;
        }
    }
};

// rt thread function
fn _rt_thread_entry(p: ?*anyopaque) callconv(.C) void {
    const t = @intToPtr(*Thread, @ptrToInt(p.?));

    t._thread_entry(t._thread_entry_param);
}
