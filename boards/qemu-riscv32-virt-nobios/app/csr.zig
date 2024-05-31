const std = @import("std");

// Note: structure
//   x io
//   x layout
//   x (io + layout)

const csrxrw = struct {
    /// csrx
    fn _init(comptime regname: []const u8) type {
        return struct {
            pub inline fn read() usize {
                return asm volatile ("csrr a0, " ++ regname
                    : [ret] "={a0}" (-> usize),
                );
            }
            pub inline fn write(val: usize) void {
                asm volatile ("csrw " ++ regname ++ ", a0"
                    :
                    : [val] "{a0}" (val),
                );
            }
            /// set bits by mask (e.g mask 0x07 will set bit2~bit0)
            pub inline fn set_bits(mask: usize) void {
                asm volatile ("csrs " ++ regname ++ ", a0"
                    :
                    : [mask] "{a0}" (mask),
                );
            }
            /// clear bits by mask (e.g mask 0x07 will clear bit2~bit0)
            pub inline fn clear_bits(mask: usize) void {
                asm volatile ("csrc " ++ regname ++ ", a0"
                    :
                    : [mask] "{a0}" (mask),
                );
            }
        };
    }

    // Machine Information
    pub const mvendorid = _init("mvendorid");
    pub const marchid = _init("marchid");
    pub const mimpid = _init("mimpid");
    pub const mhartid = _init("mhartid");
    pub const mconfigptr = _init("mconfigptr");

    // Machine Trap Setup
    pub const mstatus = _init("mstatus");
    pub const misa = _init("misa");
    pub const medeleg = _init("medeleg");
    pub const mideleg = _init("mideleg");
    pub const mie = _init("mie");
    pub const mtvec = _init("mtvec");
    pub const mcounteren = _init("mcounteren");
    pub const mstatush = _init("mstatush");
    pub const medelegh = _init("medelegh");

    // Machine Trap Handling
    pub const mscratch = _init("mscratch");
    pub const mepc = _init("mepc");
    pub const mcause = _init("mcause");
    pub const mtval = _init("mtval");
    pub const mip = _init("mip");
    pub const mtinst = _init("mtinst");
    pub const mtval2 = _init("mtval2");

    // Supervisor Trap Setup
    pub const sstatus = _init("sstatus");
    pub const sie = _init("sie");
    pub const stvec = _init("stvec");
    pub const scounteren = _init("scounteren");
    // Supervisor Configuration
    pub const senvcfg = _init("senvcfg");

    // Supervisor Trap Handling
    pub const sscratch = _init("sscratch");
    pub const sepc = _init("sepc");
    pub const scause = _init("scause");
    pub const stval = _init("stval");
    pub const sip = _init("sip");
    pub const scountovf = _init("scountovf");
};

const csrxfmt = struct {
    fn Fmtx(comptime bitsize: usize) type {
        const MXLEN = comptime switch (bitsize) {
            32 => 32,
            64 => 64,
            else => unreachable,
        };

        const UX = std.meta.Int(.unsigned, MXLEN);

        const _util = struct {
            fn mux(comptime mxlen: usize, comptime t32: type, comptime t64: type) type {
                return if (mxlen == 32) t32 else t64;
            }
            /// valx
            fn _init(comptime PackedT: type) type {
                const size = @bitSizeOf(PackedT);
                if ((size % 8) != 0)
                    @compileError("size must be divisible by 8!");

                if (!std.math.isPowerOfTwo(size / 8))
                    @compileError("size must encode a power of two number of bytes!");

                const IntT = std.meta.Int(.unsigned, size);

                if (@sizeOf(PackedT) != (size / 8))
                    @compileError(std.fmt.comptimePrint("IntT and PackedT must have the same size!, they are {} and {} bytes respectively", .{ size / 8, @sizeOf(PackedT) }));

                return extern struct {
                    pub const raw_type = IntT;
                    pub const layout_type = PackedT;

                    pub inline fn vtot(v: IntT) PackedT {
                        return @bitCast(v);
                    }
                    pub inline fn ttov(t: PackedT) IntT {
                        return @bitCast(t);
                    }

                    pub inline fn modvbyt(v: IntT, fields: anytype) IntT {
                        var val = vtot(v);
                        inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                            @field(val, field.name) = @field(fields, field.name);
                        }
                        return ttov(val);
                    }
                };
            }
        };

        return struct {
            pub const misa = _util._init(packed struct(UX) {
                Extensions: u26 = undefined,
                WARL: std.meta.Int(.unsigned, MXLEN - 28) = 0,
                MXL: u2 = undefined,
            });

            // pub const mvendorid = _util._init(packed struct(u32) {});
            // pub const marchid = _util._init(packed struct(UX) {});
            // pub const mimpid = _util._init(packed struct(UX) {});
            // pub const mhartid = _util._init(packed struct(UX) {});
            pub const mstatus = _util._init(_util.mux(MXLEN, packed struct(u32) {
                WPRI_0: u1 = 0, // reserved
                SIE: u1 = undefined, // Supervisor Interrupt Enable
                WPRI_2: u1 = 0, // reserved
                MIE: u1 = undefined, // Machine Interrupt Enable
                WPRI_4: u1 = 0, // reserved
                SPIE: u1 = undefined, // Supervisor Previous Interrupt Enable
                UBE: u1 = undefined, // Control the endianness of memory accesse in User-Mode
                MPIE: u1 = undefined,
                SPP: u1 = undefined, // Supervisor Previous Privilege mode
                VS: u2 = undefined,
                MPP: u2 = undefined,
                FS: u2 = undefined,
                XS: u2 = undefined,
                MPRV: u1 = undefined,
                SUM: u1 = undefined,
                MXR: u1 = undefined,
                TVM: u1 = undefined,
                TW: u1 = undefined,
                TSR: u1 = undefined,
                WPRI_30_23: u8 = 0, // reserved
                SD: u1 = undefined,
            }, packed struct(u64) {
                WPRI_0: u1 = 0, // reserved
                SIE: u1 = undefined, // Supervisor Interrupt Enable
                WPRI_2: u1 = 0, // reserved
                MIE: u1 = undefined, // Machine Interrupt Enable
                WPRI_4: u1 = 0, // reserved
                SPIE: u1 = undefined, // Supervisor Previous Interrupt Enable
                UBE: u1 = undefined,
                MPIE: u1 = undefined,
                SPP: u1 = undefined, // Supervisor Previous Privilege mode
                VS: u2 = undefined,
                MPP: u2 = undefined,
                FS: u2 = undefined,
                XS: u2 = undefined,
                MPRV: u1 = undefined,
                SUM: u1 = undefined,
                MXR: u1 = undefined,
                TVM: u1 = undefined,
                TW: u1 = undefined,
                TSR: u1 = undefined,
                WPRI_31_23: u9 = 0, // reserved
                UXL: u2 = undefined,
                SXL: u2 = undefined,
                SBE: u1 = undefined,
                MBE: u1 = undefined,
                WPRI_62_38: u25 = 0, // reserved

                SD: u1 = undefined,
            }));

            const _xtvec = _util._init(packed struct(UX) {
                MODE: enum(u2) {
                    /// All traps set pc to BASE.
                    Direct = 0,
                    /// Asynchronous interrupts set pc to BASE+4×cause.
                    Vectored = 1,
                    rsvd_2 = 2,
                    rsvd_3 = 3,
                },
                BASE: std.meta.Int(.unsigned, MXLEN - 2) = undefined,
            });
            pub const mtvec = _xtvec;

            pub const mip = _util._init(packed struct(UX) {
                rsvd_0: u1 = 0,
                SSIP: u1 = undefined,
                rsvd_2: u1 = 0,

                MSIP: u1 = undefined,
                rsvd_4: u1 = 0,

                STIP: u1 = undefined,
                rsvd_6: u1 = 0,

                MTIP: u1 = undefined,
                rsvd_8: u1 = 0,

                SEIP: u1 = undefined,
                rsvd_10: u1 = 0,

                MEIP: u1 = undefined,
                rsvd_12: u1 = 0,

                LCOFIP: u1 = undefined,
                rsvd_15_14: u2 = 0,

                rsvd_x_16: std.meta.Int(.unsigned, MXLEN - 16) = undefined,
            });
            pub const mie = _util._init(packed struct(UX) {
                rsvd_0: u1 = 0,
                SSIE: u1 = undefined,
                rsvd_2: u1 = 0,

                MSIE: u1 = undefined,
                rsvd_4: u1 = 0,

                STIE: u1 = undefined,
                rsvd_6: u1 = 0,

                MTIE: u1 = undefined,
                rsvd_8: u1 = 0,

                SEIE: u1 = undefined,
                rsvd_10: u1 = 0,

                MEIE: u1 = undefined,
                rsvd_12: u1 = 0,

                LCOFIE: u1 = undefined,
                rsvd_15_14: u2 = 0,

                rsvd_x_16: std.meta.Int(.unsigned, MXLEN - 16) = undefined,
            });

            const _xcause = _util._init(packed struct(UX) {
                Code: std.meta.Int(.unsigned, MXLEN - 1) = undefined,
                Interrupt: u1,
            });
            pub const mcause = _xcause;

            pub const scause = _xcause;
            pub const stvec = _xtvec;
            pub const sip = _util._init(packed struct(UX) {
                rsvd_0: u1 = 0,
                SSIP: u1 = undefined,
                rsvd_4_2: u3 = 0,
                STIP: u1 = undefined,
                rsvd_8_6: u3 = 0,
                SEIP: u1 = undefined,
                rsvd_12_10: u3 = 0,
                LCOFIP: u1 = undefined,
                rsvd_15_14: u2 = 0,

                rsvd_x_16: std.meta.Int(.unsigned, MXLEN - 16) = undefined,
            });
            pub const sie = _util._init(packed struct(UX) {
                rsvd_0: u1 = 0,
                SSIE: u1 = undefined,
                rsvd_4_2: u3 = 0,
                STIE: u1 = undefined,
                rsvd_8_6: u3 = 0,
                SEIE: u1 = undefined,
                rsvd_12_10: u3 = 0,
                LCOFIE: u1 = undefined,
                rsvd_15_14: u2 = 0,

                rsvd_x_16: std.meta.Int(.unsigned, MXLEN - 16) = undefined,
            });
            pub const sstatus = _util._init(_util.mux(MXLEN, packed struct(u32) {
                WPRI_0: u1 = 0, // reserved
                SIE: u1 = undefined, // Supervisor Interrupt Enable
                WPRI_4_2: u3 = 0, // reserved
                SPIE: u1 = undefined, // Supervisor Previous Interrupt Enable
                UBE: u1 = undefined, // Control the endianness of memory accesse in User-Mode
                WPRI_7: u1 = undefined, // reserved
                SPP: u1 = undefined, // Supervisor Previous Privilege mode
                VS: u2 = undefined,
                WPRI_12_11: u2 = undefined,
                FS: u2 = undefined,
                XS: u2 = undefined,
                WPRI_17: u1 = undefined,
                SUM: u1 = undefined,
                MXR: u1 = undefined,
                WPRI_30_20: u11 = 0, // reserved
                SD: u1 = undefined,
            }, packed struct(u64) {
                WPRI_0: u1 = 0, // reserved
                SIE: u1 = undefined, // Supervisor Interrupt Enable
                WPRI_4_2: u3 = 0, // reserved
                SPIE: u1 = undefined, // Supervisor Previous Interrupt Enable
                UBE: u1 = undefined, // Control the endianness of memory accesse in User-Mode
                WPRI_7: u1 = undefined, // reserved
                SPP: u1 = undefined, // Supervisor Previous Privilege mode
                VS: u2 = undefined,
                WPRI_12_11: u2 = undefined,
                FS: u2 = undefined,
                XS: u2 = undefined,
                WPRI_17: u1 = undefined,
                SUM: u1 = undefined,
                MXR: u1 = undefined,
                WPRI_31_20: u11 = 0, // reserved
                UXL: u2 = undefined,
                WPRI_62_34: u29 = 0, // reserved
                SD: u1 = undefined,
            }));
        };
    }

    pub const fmtx = Fmtx(@bitSizeOf(usize));
};

const csrx = struct {
    fn _init(lrw: type, lfmt: type) type {
        return struct {
            pub const fmt = lfmt;
            pub usingnamespace lrw;

            pub inline fn readt() lfmt.layout_type {
                return lfmt.vtot(lrw.read());
            }
            pub inline fn writet(t: lfmt.layout_type) void {
                lrw.write(lfmt.ttov(t));
            }
            pub inline fn modifyt(fields: anytype) void {
                var v = lrw.read();
                v = lfmt.modvbyt(v, fields);
                lrw.write(v);
            }
        };
    }

    /// without fmt
    fn _init2(lrw: type) type {
        return struct {
            pub usingnamespace lrw;
        };
    }

    const rwx = csrxrw;
    const fmtx = csrxfmt.fmtx;

    // Machine Information
    pub const mvendorid = _init2(rwx.mvendorid);
    pub const marchid = _init2(rwx.marchid);
    pub const mimpid = _init2(rwx.mimpid);
    pub const mhartid = _init2(rwx.mhartid);
    pub const mconfigptr = _init2(rwx.mconfigptr);

    // Machine Trap Setup
    pub const mstatus = _init(rwx.mstatus, fmtx.mstatus);
    pub const misa = _init(rwx.misa, fmtx.misa);
    /// (control) machine interrupt delegation
    pub const medeleg = _init2(rwx.medeleg);
    /// (control) machine exception delegation
    pub const mideleg = _init2(rwx.mideleg);
    /// (control) machine interrupt enable
    pub const mie = _init(rwx.mie, fmtx.mie);
    /// (control) machine trap vector (handler)
    pub const mtvec = _init(rwx.mtvec, fmtx.mtvec);
    pub const mcounteren = _init2(rwx.mcounteren);
    pub const mstatush = _init2(rwx.mstatush);
    pub const medelegh = _init2(rwx.medelegh);

    // Machine Trap Handling
    pub const mscratch = _init2(rwx.mscratch);
    /// (status) machine exception program counter
    pub const mepc = _init2(rwx.mepc);
    /// (status) machine trap cause
    pub const mcause = _init2(rwx.mcause);
    pub const mtval = _init2(rwx.mtval);
    pub const mip = _init(rwx.mip, fmtx.mip);
    pub const mtinst = _init2(rwx.mtinst);
    pub const mtval2 = _init2(rwx.mtval2);

    // Supervisor Trap Setup
    pub const sstatus = _init(rwx.sstatus, fmtx.sstatus);
    pub const sie = _init(rwx.sie, fmtx.sie);
    pub const stvec = _init(rwx.stvec, fmtx.stvec);
    pub const scounteren = _init2(rwx.scounteren);
    // Supervisor Configuration
    pub const senvcfg = _init2(rwx.senvcfg);

    // Supervisor Trap Handling
    pub const sscratch = _init2(rwx.sscratch);
    pub const sepc = _init2(rwx.sepc);
    pub const scause = _init(rwx.scause, fmtx.scause);
    pub const stval = _init2(rwx.stval);
    pub const sip = _init(rwx.sip, fmtx.sip);
    pub const scountovf = _init2(rwx.scountovf);
};

pub usingnamespace csrx;
