package core

import chisel3._

trait Config2 {
  val XLEN = 32
}

class RegFileIO extends Bundle with Config2 {
  val raddr1 = Input(UInt(5.W))
  val raddr2 = Input(UInt(5.W))

  val rdata1 = Output(SInt(XLEN.W))
  val rdata2 = Output(SInt(XLEN.W))

  val wen   = Input(Bool())
  val waddr = Input(UInt(5.W))
  val wdata = Input(SInt(XLEN.W))
}

class RegFile extends Module with Config2 {
  val io = IO(new RegFileIO)

  // Initialize all registers to 0
  val reg = RegInit(VecInit(Seq.fill(32)(0.S(XLEN.W))))

  // Read ports
  io.rdata1 := reg(io.raddr1)
  io.rdata2 := reg(io.raddr2)

  // Write port
  when (io.wen && io.waddr =/= 0.U) {
    reg(io.waddr) := io.wdata
  }

  // x0 is always zero
  reg(0) := 0.S
}