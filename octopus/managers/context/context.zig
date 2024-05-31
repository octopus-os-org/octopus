const builtin = @import("builtin");

pub const Entry = *const fn () void;

pub const RoutineContext = struct {
    /// stack record
    sp: usize = 0,
    stack: []u8,
    entry: Entry,

    pub fn init(self: *RoutineContext, stack: []u8, entry: *const fn () void) void {
        // var ctx: RoutineContext = undefined;
        self.entry = entry;
        self.stack = stack;
        // base: the sp grows to low from high
        self.sp = @intFromPtr(stack.ptr) + stack.len;

        arch_specific.init_context_space(&self.sp, self.entry);
    }

    inline fn is_valid_stack_addr(self: *RoutineContext, addr: usize) bool {
        const low = @intFromPtr(&self.stack[0]);
        const high = @intFromPtr(&self.stack[self.stack.len - 1]);

        return (addr >= low and addr <= high);
    }

    pub fn left_stack_space(self: *RoutineContext) usize {
        if (!self.is_valid_stack_addr(self.sp)) {
            return 0;
        }

        const low = @intFromPtr(&self.stack[0]);

        return self.sp - low;
    }
    pub fn used_stack_space(self: *RoutineContext) usize {
        return self.total_stack_space() - self.left_stack_space();
    }
    pub fn total_stack_space(self: *RoutineContext) usize {
        return self.stack.len;
    }
};

pub var g_main_routine: RoutineContext = undefined;
pub var g_cur_routine: *RoutineContext = &g_main_routine;

pub fn init_main_routine(stack_start: usize, stack_len: usize) void {
    g_main_routine.stack.len = stack_len;
    g_main_routine.stack.ptr = @ptrFromInt(stack_start);
    g_main_routine.sp = arch_specific.get_current_sp();
}

fn gen_arch_specific() type {
    // todo

    // const std = @import("std");
    // const arm = std.Target.arm;
    // const isARMV7M = builtin.cpu.features.isSuperSetOf(arm.featureSet(&[_]arm.Feature{
    //     .v7m,
    //     .v7em,
    // }));
    // @compileLog("set: {}", builtin.cpu.features);

    const isThumb = builtin.cpu.arch.isThumb();

    if (isThumb) {
        return struct {
            /// !: not ensure accuracy
            inline fn get_current_sp() usize {
                return asm volatile ("mov r0, sp"
                    : [ret] "={r0}" (-> usize),
                );
            }

            inline fn init_context_space(sp: *usize, entry: Entry) void {
                asm volatile (
                    \\ .extern context_init_space
                    \\ bl context_init_space
                    :
                    : [_sp] "{r0}" (sp),
                      [_entry] "{r1}" (entry),
                );
            }

            pub fn switch_to_routine(ctx: *RoutineContext) void {
                if (g_cur_routine == ctx) {
                    return;
                }
                var _curroutine = g_cur_routine;
                g_cur_routine = ctx;

                asm volatile (
                    \\ .extern context_switch_to_from
                    \\ push {lr}
                    \\ bl context_switch_to_from
                    \\ pop {lr}
                    :
                    : [to] "{r0}" (&ctx.sp),
                      [from] "{r1}" (&_curroutine.sp),
                );
            }

            pub fn switch_to_from_routine(to: *RoutineContext, from: *RoutineContext) void {
                g_cur_routine = to;
                asm volatile (
                    \\ .extern context_switch_to_from
                    \\ bl context_switch_to_from
                    :
                    : [to] "{r0}" (&to.sp),
                      [from] "{r1}" (&from.sp),
                );
            }

            pub fn direct_to_routine(ctx: *RoutineContext) void {
                g_cur_routine = ctx;
                asm volatile (
                    \\ .extern context_direct_switch_to
                    \\ bl context_direct_switch_to
                    :
                    : [to] "{r0}" (&ctx.sp),
                );
            }
        };
    } else if (builtin.cpu.arch.isRISCV()) {
        return struct {
            /// !: not ensure accuracy
            inline fn get_current_sp() usize {
                return asm volatile ("mv a0, sp"
                    : [ret] "={a0}" (-> usize),
                );
            }

            inline fn init_context_space(sp: *usize, entry: Entry) void {
                asm volatile (
                    \\ .extern context_init_space
                    \\ call context_init_space
                    :
                    : [_sp] "{a0}" (sp),
                      [_entry] "{a1}" (entry),
                );
            }

            pub fn switch_to_routine(ctx: *RoutineContext) void {
                if (g_cur_routine == ctx) {
                    return;
                }

                var _curroutine = g_cur_routine;
                g_cur_routine = ctx;
                asm volatile (
                    \\ .extern context_switch_to_from 
                    \\ call context_switch_to_from
                    :
                    : [to] "{a0}" (&ctx.sp),
                      [from] "{a1}" (&_curroutine.sp),
                );
            }

            pub fn switch_to_from_routine(to: *RoutineContext, from: *RoutineContext) void {
                g_cur_routine = to;
                asm volatile (
                    \\ .extern context_switch_to_from 
                    \\ call context_switch_to_from
                    :
                    : [to] "{a0}" (&to.sp),
                      [from] "{a1}" (&from.sp),
                );
            }

            pub fn direct_to_routine(ctx: *RoutineContext) void {
                g_cur_routine = ctx;
                asm volatile (
                    \\ .extern context_direct_switch_to 
                    \\ call context_direct_switch_to
                    :
                    : [to] "{a0}" (&ctx.sp),
                );
            }
        };
    } else {
        @compileLog("not supported arch: ", builtin.cpu.arch);
        @compileError("not supproted arch");
    }
}

const arch_specific = gen_arch_specific();

pub usingnamespace arch_specific;
