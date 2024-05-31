include ../.comm/base.mk

flashelf: ## flashing elf to board, after complete jumping to "app" by hand is needed 
	# program - 烧写程序 如果是bin文件则需要指定烧写地址，elf文件则不需要
	# verify - 烧写完毕后校验烧写的对不对
	# reset - 执行复位
	# exit - 直接退出； 如无则会开启 gdb server 
	openocd \
		-f interface/cmsis-dap.cfg \
		-f target/stm32mp15x.cfg  \
		-c "init" \
		-c "adapter srst delay 100" \
		-c "halt" \
		-c "load_image ${elffile}" \
		-c "resume" \
		-c "exit"

