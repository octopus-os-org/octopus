
br: build runq ## `build` and then `run`

cbr: clean build runq ## `clean` and then `build` and then `run`

runq: ## run program on qemu (`ctrl-c` or `ctrl-a + x` exit)
	${_runqemu}
runq-g: ## `runq` with gdb server on (:1234)
	${_runqemu} -s
runq-g-s: ## `runq` with gdb server on and halt
	${_runqemu} -s -S

rungdb: ## run gdb client (need set TOOLCHAIN env to indicate the toolchain prefix)
	@echo the toolchain is ${TOOLCHAIN}
	${TOOLCHAIN}gdb ${elffile} -ex "target remote :1234"