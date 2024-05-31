//
// Copyright (c) 2024, sogwyms@gmail.com
//
// SPDX-License-Identifier: Apache-2.0
//
// Change Logs:
// Date           Author       Notes
// 2024-02-25     vano         porting from the c edition

// Note: The DWT cycle counter is a 32-bit counter which increase one on each processor clock cycle. On overflow, it wraps to zero.
// Cons: The counter can't work when the processor is halted in Debug state.

const debug = @import("octopus").debug;

const REG = struct {
    const ROM_TABLE_ENTRY = @as(u32, 0xE00FF000);
    const DEMCR = @as(u32, 0xE000EDFC);
    const DWT_CTRL = @as(u32, 0xE0001000);
    const DWT_CYCCNT = @as(u32, 0xE0001004);
    const DWT_CPICNT = @as(u32, 0xE0001008);
    const DWT_EXCCNT = @as(u32, 0xE000100C);
    const DWT_SLEEPCNT = @as(u32, 0xE0001010);
    const DWT_LSUCNT = @as(u32, 0xE0001014);
    const DWT_FOLDCNT = @as(u32, 0xE0001018);
    const DWT_PCSR = @as(u32, 0xE000101C);
    const DWT_COMP_0 = @as(u32, 0xE0001020);
    const DWT_MASK_0 = @as(u32, 0xE0001024);
    const DWT_FUNCTION_0 = @as(u32, 0xE0001028);
};

const MASK = struct {
    const DEMCR_MASK_TRCENA = @as(u32, (0x01 << 24));
    const DWT_MASK_CTRL_NUMCOMP = @as(u32, (0x0F << 28));
    const DWT_MASK_CTRL_NOCYCCNT = @as(u32, (0x01 << 25));
    const DWT_MASK_CTRL_CYCCNTENA = @as(u32, (0x01 << 0));
    const DWT_MASK_FUNCTION_CYCMATCH = @as(u32, (0x01 << 7));
    const DWT_MASK_FUNCTION_MATCHED = @as(u32, (0x01 << 24));
};

const ROMDWT_OFFSET = @as(u32, 0x004);

inline fn regp(addr: u32) *u32 {
    return @as(*u32, @ptrFromInt(addr));
}

pub inline fn get_counter() u32 {
    return regp(REG.DWT_CYCCNT).*;
}

/// set counter value
fn dwt_set_counter(val: u32) void {
    regp(REG.DWT_CYCCNT).* = val;
}

fn dwt_enable_cyccnt() void {
    regp(REG.DEMCR).* |= MASK.DEMCR_MASK_TRCENA;
    regp(REG.DWT_CTRL).* |= MASK.DWT_MASK_CTRL_CYCCNTENA;
}

fn dwt_disable_cyccnt() void {
    regp(REG.DWT_CTRL).* &= ~MASK.DWT_MASK_CTRL_CYCCNTENA;
}

/// whether the chip supports dwt
fn has_dwt() bool {
    return !(regp((REG.ROM_TABLE_ENTRY + ROMDWT_OFFSET)).* & 1 == 0);
}

/// whether the chip supports cycle-counter (of dwt)
fn has_cycle_counter() bool {
    return (regp(REG.DWT_CTRL).* & MASK.DWT_MASK_CTRL_NOCYCCNT == 0);
}

pub fn init() anyerror!void {
    if (!(has_dwt() and has_cycle_counter())) {
        return error.Failure;
    }

    // Disable DWT counter And then clear counter value (to zero)
    dwt_disable_cyccnt();
    dwt_set_counter(0);

    // Enable DWT counter
    dwt_enable_cyccnt();
}
