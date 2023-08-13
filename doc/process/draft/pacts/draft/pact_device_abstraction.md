# 设备抽象


## 接口定义

```zig
fn read(underlying: *anyopaque, buf: [*]u8, size: size_t) size_t;
fn write(underlying: *anyopaque, buf: [*]const u8, size: size_t) size_t;
fn open(underlying: *anyopaque) !void;
fn close(underlying: *anyopaque) !void;
fn signal(underlying: *anyopaque, id: signal_id_t, callback: sig_callback_t) !void
fn status(underlying: *anyopaque, id: status_id_t) ?status_t;
fn ctrl(underlying: *anyopaque, arg: anyopaque) !?anyopaque;
```