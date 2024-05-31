elffile:=$(shell test -d zig-out && ( ls zig-out/bin/*.elf | head -n 1))
binfile:=$(shell test -d zig-out && ( ls zig-out/bin/*.bin | head -n 1))
$(info ELF: ${elffile})
$(info BIN: ${binfile})

_run:=qemu-system-riscv32 -M virt -m 128M -kernel $(elffile) -serial stdio -display none -bios none

## show targets
help:
	@printf "Targets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' ${MAKEFILE_LIST} | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## build
	zig build
build-rs: ## build in release-safe
	zig build -Doptimize=ReleaseSafe


run: ## run program on qemu (note: bios off) (ctrl-c to exit)
	${_run}
run-g: ## ... with gdb server on (:1234)
	${_run} -s
run-g-s: ## ... with gdb server on and halt
	${_run} -s -S

br: build run ## `build` and then `run`

cbr: clean build run ## `clean` and then `build` and then `run`

rundev: ## run program on qemu with extending ...
	${_run} \
	-drive if=none,file=sd.bin,format=raw,id=blk0 -device virtio-blk-device,drive=blk0,bus=virtio-mmio-bus.0
rundev-g-s: ## ...
	${_run} \
	-drive if=none,file=sd.bin,format=raw,id=blk0 -device virtio-blk-device,drive=blk0,bus=virtio-mmio-bus.0 \
	-s -S

	# qemu-system-riscv32 -nographic -machine virt -m 256M -kernel rtthread.bin -s -S \
	# -drive if=none,file=sd.bin,format=raw,id=blk0 -device virtio-blk-device,drive=blk0,bus=virtio-mmio-bus.0 \
	# -netdev user,id=tap0 -device virtio-net-device,netdev=tap0,bus=virtio-mmio-bus.1 \
	# -device virtio-serial-device -chardev socket,host=127.0.0.1,port=4321,server=on,wait=off,telnet=on,id=console0 -device virtserialport,chardev=console0

dumpdts: ## dump device-tree
	board=virt
	qemu-system-riscv32 -machine virt,dumpdtb=qemu-riscv32-virt.dtb 2>/dev/null
	dtc qemu-riscv32-virt.dtb > qemu-riscv32-virt.dts
	rm qemu-riscv32-virt.dtb

rungdb: ## run gdb client (need set TOOLCHAIN env to indicate the toolchain)
	@echo the toolchain is ${TOOLCHAIN}
	${TOOLCHAIN}gdb ${elffile} -ex "target remote :1234"

dump: ## gen debug data (need set TOOLCHAIN env to indicate the toolchain)
	@echo the toolchain is ${TOOLCHAIN}
	${TOOLCHAIN}objdump ${elffile} -D > objdump-D.out
	${TOOLCHAIN}objdump ${elffile} -h > objdump-h.out
	${TOOLCHAIN}readelf ${elffile} -a > readelf-a.out
	${TOOLCHAIN}size ${elffile}

clean: ## clean all generated files
	-rm -f *.out
	-rm -rf zig-out
	-rm -rf zig-cache
	
.PHONY: help clean dump
