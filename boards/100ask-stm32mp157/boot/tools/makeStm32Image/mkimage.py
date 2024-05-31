# @Time : 2020/12/31
# @Author : David Dai
# @File : mkimage.py
#!/usr/bin/python2

# changelog
# time | author | changed
# 2023-07-14 | vano | remove type option (make this for stm32mp157 only)

import os
import argparse
import struct

parser = argparse.ArgumentParser()

# parser.add_argument('-t', '--type')
parser.add_argument('-b', '--bin')
parser.add_argument('-o', '--out', default = "load.bin")
parser.add_argument('-g', '--img', default = "load.img")
parser.add_argument('-a', '--addr', default = "0x00000000")
parser.add_argument('-e', '--ep', default = "0x00000000")

args = parser.parse_args()

args.addr = int(args.addr, 16)
args.ep = int(args.ep, 16)

def stm32image():
    checksum = 0

    with open(args.out, 'wb') as f:
        #write head 'STM32'
        f.write(struct.pack('<B', 0x53))
        f.write(struct.pack('<B', 0x54))
        f.write(struct.pack('<B', 0x4D))
        f.write(struct.pack('<B', 0x32))
        for i in range(16):
            f.write(struct.pack('<I', 0x00000000))

        #write checksum
        with open(args.bin, 'rb') as b:
            while(True):
                raw = b.read(1)
                if len(raw) == 0:
                    b.close()
                    break
                else:
                    checksum = checksum + ord(raw)
        checksum = checksum & 0xffffffff
        f.write(struct.pack('<I', checksum))
        f.write(struct.pack('<I', 0x00010000))

        #write size
        f.write(struct.pack('<I', os.path.getsize(args.bin)))
        #write entry point
        f.write(struct.pack('<I', args.ep))
        f.write(struct.pack('<I', 0x00000000))
        #write image load
        f.write(struct.pack('<I', args.addr))
        f.write(struct.pack('<I', 0x00000000))

        f.write(struct.pack('<I', 0x00000000))
        f.write(struct.pack('<I', 0x00000001))
        f.write(struct.pack('<I', 0x00000001))
        for i in range(37):
            f.write(struct.pack('<I', 0x00000000))

        #write bin data
        with open(args.bin, 'rb') as b:
            while(True):
                raw = b.read(1024)
                if len(raw) == 0:
                    b.close()
                    break
                else:
                    f.write(raw)
        f.close()

    print('Image Type   : STMicroelectronics STM32 Image')
    print('Bin File     : %s' % args.bin)
    print('Out File     : %s' % args.out)
    print('Image Size   : %d bytes' % os.path.getsize(args.bin))
    print('Image Load   : 0x%x' % args.addr)
    print('Entry Point  : 0x%x' % args.ep)
    print('Checksum     : 0x%x' % checksum)

if __name__ == '__main__':
    if args.bin is not None:
        if not os.path.exists(args.bin):
            print('Bin File : %s is not exist' % args.bin)
            exit()

        stm32image()
    else:
        print('Help : mkimage.py -b <inputBinaryFile> [-o <outputBinaryFileName>]  ')