#######################
# set env
#######################

DEFAULT_TOOLCHAIN:=riscv32-unknown-elf-
TOOLCHAIN?=${DEFAULT_TOOLCHAIN}

_runqemu=qemu-system-riscv32 -M virt -m 128M -kernel $(elffile) -serial stdio -display none

#######################
# load modules
#######################

include ../.comm/base.mk
include ../.comm/runqemu.mk

#######################
# other local commands
#######################

run-nobios: ## run program on qemu without bios
	${_runqemu} -bios none
run-nobios-g-s: ## ...
	${_runqemu} -bios none -s -S

rundev: ## run program on qemu with extending ...
	${_runqemu} \
	-drive if=none,file=sd.bin,format=raw,id=blk0 -device virtio-blk-device,drive=blk0,bus=virtio-mmio-bus.0
rundev-g-s: ## ...
	${_runqemu} \
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
