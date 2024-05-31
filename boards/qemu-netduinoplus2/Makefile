#######################
# set env
#######################

DEFAULT_TOOLCHAIN:=arm-none-eabi-
TOOLCHAIN?=${DEFAULT_TOOLCHAIN}

_runqemu=qemu-system-arm -M netduinoplus2 -kernel $(elffile) -serial stdio -display none

#######################
# load modules
#######################

include ../.comm/base.mk
include ../.comm/runqemu.mk

#######################
# other local commands
#######################

dumpdts: ## dump device-tree
	qemu-system-arm -machine netduinoplus2,dumpdtb=netduinoplus2.dtb 2>/dev/null
	dtc netduinoplus2.dtb > netduinoplus2.dts
	rm netduinoplus2.dtb
