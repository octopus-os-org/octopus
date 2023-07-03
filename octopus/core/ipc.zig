const rt = @cImport({
    @cInclude("rtapi.h");
});

pub const MsgQueue = struct {
    _rt_mq_handle: rt.rt_mq_t = 0,

    pub fn init(self: *MsgQueue, name: []const u8, msg_size: u32, msg_capacity: u32) !void {
        self._rt_mq_handle = rt.rt_mq_create(@as([*c]const u8, name), msg_size, msg_capacity, rt.RT_IPC_FLAG_PRIO);
        if (self._rt_mq_handle == 0) {
            return error.Failure;
        }
    }

    pub fn send(self: *MsgQueue, buf: *anyopaque, buf_size: u32) !void {
        var ret = rt.rt_mq_send(self._rt_mq_handle, @as(?*anyopaque, buf), buf_size);
        if (ret != rt.RT_EOK) {
            return error.Failure;
        }
    }

    pub fn recv(self: *MsgQueue, buf: *anyopaque, buf_size: u32, timeout: i32) !void {
        var ret = rt.rt_mq_recv(self._rt_mq_handle, @as(?*anyopaque, buf), buf_size, timeout);
        if (ret != rt.RT_EOK) {
            return error.Failure;
        }
    }
};

pub const Sem = struct {
    _rt_sem_handle: rt.rt_sem_t = 0,

    pub fn init(self: *Sem, name: []const u8, val: u32) !void {
        self._rt_sem_handle = rt.rt_sem_create(@as([*c]const u8, name), val, rt.RT_IPC_FLAG_PRIO);
        if (self._rt_sem_handle == 0) {
            return error.Failure;
        }
    }

    pub fn take(self: *Sem, timeout: i32) void {
        _ = rt.rt_sem_take(self._rt_sem_handle, timeout);
    }

    pub fn release(self: *Sem) void {
        _ = rt.rt_sem_release(self._rt_sem_handle);
    }
};
