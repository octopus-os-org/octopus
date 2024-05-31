#######################
# set env
#######################

DEFAULT_TOOLCHAIN:=arm-none-eabi-
TOOLCHAIN?=${DEFAULT_TOOLCHAIN}

_runqemu=qemu-system-arm -M vexpress-a9 -m 512M -kernel ${elffile} -serial stdio
#######################
# load modules
#######################

include ../.comm/base.mk
include ../.comm/runqemu.mk

#######################
# other local commands
#######################

