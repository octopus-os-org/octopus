elffile=`ls zig-out/bin/*.elf | head -n 1`
arm-none-eabi-objdump.exe ${elffile} -D > objdump.out