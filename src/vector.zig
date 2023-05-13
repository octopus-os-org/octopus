// These two are the default empty implementations for exception handlers
export fn blockingHandler() void {
    while (true) {}
}

export fn nullHandler() void {}

// These are the exception handlers, which are weakly linked to the default handlers
// in the linker script
extern fn resetHandler() void;
extern fn nmiHandler() void;
extern fn hardFaultHandler() void;
extern fn memoryManagementFaultHandler() void;
extern fn busFaultHandler() void;
extern fn usageFaultHandler() void;
extern fn svCallHandler() void;
extern fn debugMonitorHandler() void;
extern fn pendSVHandler() void;
extern fn sysTickHandler() void;

// The vector table
const vector_table linksection(".vectors") = [_]?fn () callconv(.C) void{
    resetHandler, // Reset
    null, // Undefined instruction
    null, // Software instruction
    null, // Prefetch abort
    null, // Data abort
    null, // Reserved
    null, // IRQ
    null, // FIQ
};
