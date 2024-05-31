elffile:=$(shell test -d zig-out && ( ls zig-out/bin/*.elf | head -n 1))
binfile:=$(shell test -d zig-out && ( ls zig-out/bin/*.bin | head -n 1))
$(info ELF: ${elffile})
$(info BIN: ${binfile})

help:
	@for mf in $$(echo "$(MAKEFILE_LIST)" | tr ' ' '\n' | sort | tr '\n' ' '); do \
		grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $$mf >> ._tmpmk ; \
		sort ._tmpmk > .tmpmk; \
	done
	@rm ._tmpmk
	@printf "Targets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' .tmpmk | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@rm .tmpmk

build: ## build (in default optimization)
	zig build

build-rs: ## build in release-safe 
	zig build -Doptimize=ReleaseSafe

build-rf: ## build in release-fast
	zig build -Doptimize=ReleaseFast

build-rsm: ## build in release-small
	zig build -Doptimize=ReleaseSmall

cb: clean build ## `clean` and then `build`

dump: ## gen debug data (need set TOOLCHAIN env to indicate the toolchain prefix)
	@echo the toolchain is "'${TOOLCHAIN}'"
	${TOOLCHAIN}objdump ${elffile} -D > objdump-D.out
	${TOOLCHAIN}objdump ${elffile} -h > objdump-h.out
	${TOOLCHAIN}readelf ${elffile} -a > readelf-a.out
	${TOOLCHAIN}size ${elffile}

dump-complete-makefile: ## all in a single file
	@for mf in $$(echo "$(MAKEFILE_LIST)" | tr ' ' '\n' | sort | tr '\n' ' '); do \
		echo "<<< '$$mf' " >> makefile.out; \
		cat $$mf >> makefile.out; \
	done

clean: ## clean all generated files
	-rm -f *.out
	-rm -rf zig-out
	-rm -rf zig-cache
	-rm -rf .zig-cache
	
.PHONY: help clean dump
