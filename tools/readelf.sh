elffile=`ls zig-out/bin/*.elf | head -n 1`
arm-none-eabi-readelf.exe ${elffile} -a > readelf.out