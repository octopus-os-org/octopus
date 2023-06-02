binfile=`ls zig-out/bin/*.bin | head -n 1`

qemu-system-arm -M netduinoplus2 -kernel ${binfile} -serial mon:stdio -nographic