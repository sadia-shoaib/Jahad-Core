package core

import chisel3._

class IO_Interface extends Bundle {
  val data_in       = Input(Vec(4, UInt(32.W)))
  val data_selector = Input(UInt(2.W))
  val data_out      = Output(UInt(32.W))
  val addr          = Input(UInt(8.W))
  val wr_en         = Input(Bool())
}

class DataMem extends Module {
  val io = IO(new IO_Interface)

  // 256 x 32-bit word memory, combinational read
  val memory = Mem(256, UInt(32.W))

  io.data_out := memory(io.addr)

  when(io.wr_en) {
    memory(io.addr) := io.data_in(io.data_selector)
  }
}