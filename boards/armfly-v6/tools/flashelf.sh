# 执行时的工作目录应为项目根目录

flashFile=`ls zig-out/bin/*.elf | head -n 1`

if [ $# == 1 ]; then
    flashFile=$1
fi

echo "flashing file: ${flashFile}"

# program - 烧写程序 如果是bin文件则需要指定烧写地址，elf文件则不需要

# verify - 烧写完毕后校验烧写的对不对
# reset - 执行复位
# exit - 直接退出； 如无则会开启 gdb server 



openocd \
    -f interface/cmsis-dap.cfg \
    -f target/stm32f4x.cfg  \
    -c "program ${flashFile} verify reset " \
    -c "exit"


