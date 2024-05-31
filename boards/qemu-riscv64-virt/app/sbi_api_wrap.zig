const sbi = @import("sbi.zig");

pub const putc = sbi.sbi_debug_console_write_byte;
pub const puts = sbi.sbi_debug_console_write;
pub const set_timer = sbi.sbi_set_timer;
