# 执行时的工作目录应为项目根目录

flashStartAddress="0xC0100000"
flashFile=`ls zig-out/bin/*.bin | head -n 1`

if [ $# == 1 ]; then
    flashFile=$1
fi

echo "flashing file: ${flashFile}"

# program - 烧写程序 如果是bin文件则需要指定烧写地址，elf文件则不需要

# verify - 烧写完毕后校验烧写的对不对
# reset - 执行复位
# exit - 直接退出； 如无则会开启 gdb server 
    # -c "program ${flashFile} ${flashStartAddress}  " \

openocd \
    -f interface/cmsis-dap.cfg \
    -f target/stm32mp15x.cfg  \
    -c "init" \
    -c "adapter srst delay 3100" \
    -c "halt" \
    -c "load_image ${flashFile} ${flashStartAddress} bin" \
    -c "set_reg {pc 0xC0100000}" \
    -c "resume" \
    -c "exit"