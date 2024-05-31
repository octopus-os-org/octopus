elffile=`ls zig-out/bin/*.elf | head -n 1`
riscv32-unknown-elf-readelf.exe ${elffile} -a > readelf-a.out