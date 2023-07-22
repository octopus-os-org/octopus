package main

import (
	"bytes"
	"fmt"
	"strings"
	"time"

	"github.com/spf13/cast"

	"github.com/ziutek/telnet"
)

type MO struct {
	conn *telnet.Conn
}

func NewMO(conn *telnet.Conn) *MO {
	mo := new(MO)
	mo.conn = conn
	return mo
}

func (m *MO) ReadAllResponseText() string {
	conn := m.conn

	var buf bytes.Buffer
	// set reading timeout to be 100ms
	conn.SetReadDeadline(time.Now().Add(time.Millisecond * 100))
	for {
		b, e := conn.ReadByte()
		if e != nil {
			break
		}
		buf.WriteByte(b)
	}

	return buf.String()
}

// write data into addr
func (m *MO) WriteAddr(addr uint32, data uint32) {
	conn := m.conn

	conn.Write([]byte(fmt.Sprintf("mww 0x%x 0x%x \r\n", addr, data)))
}

// read data at addr
func (m *MO) ReadAddr(addr uint32) uint32 {
	conn := m.conn

	conn.Write([]byte(fmt.Sprintf("mdw 0x%x\r\n", addr)))
	time.Sleep(100 * time.Millisecond)
	text := m.ReadAllResponseText()
	print(text)
	_, after, found := strings.Cut(text, fmt.Sprintf("0x%x: ", addr))
	if !found {
		panic("should not happen:" + fmt.Sprintf("0x%x", addr) + ":" + text)
	}

	return cast.ToUint32("0x" + after[:8])
}

// The basic input/output api for manipulating chips
type BaseIO interface {
	WriteAddr(addr uint32, data uint32)
	ReadAddr(addr uint32) uint32
}

type AO struct {
	bio BaseIO
}

const (
	POWER    = 0x58007000 + iota*4
	CLKCR    = 0x58007000 + iota*4
	ARGR     = 0x58007000 + iota*4
	CMDR     = 0x58007000 + iota*4
	RESPCMDR = 0x58007000 + iota*4
	RESP1R   = 0x58007000 + iota*4
	RESP2R   = 0x58007000 + iota*4
	RESP3R   = 0x58007000 + iota*4
	RESP4R   = 0x58007000 + iota*4

	DTIMER = 0x58007000 + iota*4
	DLENR  = 0x58007000 + iota*4
	DCTRL  = 0x58007000 + iota*4
	DCNTR  = 0x58007000 + iota*4
	STAR   = 0x58007000 + iota*4
	ICR    = 0x58007000 + iota*4

	MASKR    = 0x58007000 + iota*4
	ACKTIMER = 0x58007000 + iota*4
)

const (
	CMD0 = iota
	CMD1
	CMD2
	CMD3
	CMD4
	CMD5
	CMD6
	CMD7
	CMD8
	CMD9
)

func NewAO(bio BaseIO) *AO {
	ao := new(AO)
	ao.bio = bio
	return ao
}

const (
	CMD_RESP_NONE              = 0b00
	CMD_RESP_SHORT             = 0b01
	CMD_RESP_SHORT_WITHOUT_CRC = 0b10
	CMD_RESP_LONG              = 0b11
)

// send a command (no data transfer)
func (a *AO) SendCmd(cmdIndex int, cmdArg uint32, respType int) {
	io := a.bio

	io.WriteAddr(ARGR, cmdArg)
	io.WriteAddr(CMDR, uint32(0x1000|((respType&0x3)<<8)|(cmdIndex&0x3F)))
}

// clear status register
func (a *AO) ClearAllStatus() {
	a.bio.WriteAddr(STAR, 0xFFFFffff)
}

// read response data
func (a *AO) ReadResponses() []uint32 {
	io := a.bio

	ret := make([]uint32, 4)
	ret[0] = io.ReadAddr(RESP1R)
	// ret[1] = io.ReadAddr(RESP1R)
	// ret[2] = io.ReadAddr(RESP1R)
	// ret[3] = io.ReadAddr(RESP1R)

	return ret
}

func (a *AO) ReadEmmcExtCSD() {
	io := a.bio

	// set
	//   argument to be 0
	//   long response
	//   cmd8
	//   starting send cmd
	io.WriteAddr(ARGR, 0)
	io.WriteAddr(CMDR, 0x1380+CMD8)

	// verify response cmd
	respcmd := io.ReadAddr(RESPCMDR)
	if respcmd != CMD8 {
		panic("not the same response command")
	}

	// verify status

}

func (a *AO) FindEmmcRCA() {
	io := a.bio

	var arg uint32
	// arg = 0x24d1
	arg = 0x322e
	for {
		arg += 1

		time.Sleep(time.Millisecond * 30)

		// clear all status
		io.WriteAddr(ICR, 0xFFFFffff)

		time.Sleep(time.Millisecond * 100)

		io.WriteAddr(ARGR, arg<<16)
		time.Sleep(time.Millisecond * 20)
		io.WriteAddr(CMDR, 0x1300+CMD9)

		time.Sleep(time.Millisecond * 90)
		// io.ReadAddr(STAR)
		// time.Sleep(time.Millisecond * 10)

		respcmd := io.ReadAddr(RESPCMDR)
		if respcmd == CMD9 {
			break
		}
	}

	fmt.Printf("found! the rca is :%v", arg)
}

func (a *AO) ReInitializeEmmc(rca int) {
	io := a.bio
	a.ClearAllStatus()

	// step1: Reset emmc (CMD0 with argument 0)
	io.WriteAddr(CLKCR, 0x0003009D) // modify clock to be under 400Khz && 1-bit bus
	a.SendCmd(CMD0, 0, CMD_RESP_NONE)
	fmt.Println("Reset done")

	time.Sleep(time.Millisecond * 500)
	// step2: Do voltage identification (CMD1 with argument 0xC0FF8080)
	for {
		ocr := uint32(0xC0FF8080)

		a.SendCmd(CMD1, ocr, CMD_RESP_SHORT_WITHOUT_CRC)

		resp := a.ReadResponses()
		if resp[0] == ocr {
			break
		}

		time.Sleep(time.Millisecond * 500)
		fmt.Println("Doing voltage identification...")
	}
	fmt.Println("Voltage identification done")

	time.Sleep(time.Millisecond * 500)
	// step3: Request device CID (CMD2)
	a.SendCmd(CMD2, 0, CMD_RESP_LONG)
	fmt.Println("Request CID done")

	time.Sleep(time.Millisecond * 500)
	// step4: Set device RCA (CMD3 with argument RCA)
	a.ClearAllStatus()
	a.SendCmd(CMD3, uint32(rca<<16), CMD_RESP_SHORT)
	fmt.Println("Set RCA done")

	fmt.Println("Reinitialization done")
}

func main() {
	conn, err := telnet.Dial("tcp", "127.0.0.1:4444")
	if err != nil {
		panic(err.Error())
	}
	defer func() {
		time.Sleep(time.Second * 10)
		conn.Close()
	}()

	mo := NewMO(conn)
	time.Sleep(time.Millisecond * 200)
	print(mo.ReadAllResponseText())

	ao := NewAO(mo)
	print(mo.ReadAllResponseText())
	ao.ReInitializeEmmc(2)

	print(mo.ReadAllResponseText())
}
