package core

import chisel3._

class ProgramCounter extends Module {

  val io = IO(new Bundle {
    val input  = Input(UInt(32.W))
    val pc    = Output(UInt(32.W))
    val pc4   = Output(UInt(32.W))
  })

  val pcReg = RegInit(0.U(32.W))

  io.pc  := pcReg
  io.pc4 := pcReg + 4.U

  pcReg := io.input
}