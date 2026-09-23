package core

import chisel3._
import chisel3.util._

class LM_IO_Interface_ImmdValGen extends Bundle {
  val instruction = Input(UInt(32.W))
  val imm = Output(UInt(32.W))
}

class Imm_gen extends Module {
  val io = IO(new LM_IO_Interface_ImmdValGen)

  
  io.imm := 0.U

  switch(io.instruction(6, 0)) {

    // I-type
    is("b0010011".U) {
      io.imm := Cat(
        Fill(20, io.instruction(31)),
        io.instruction(31, 20)
      )
    }

    // I-type: LOAD
    is("b0000011".U) {
      io.imm := Cat(
        Fill(20, io.instruction(31)),
        io.instruction(31, 20)
      )
    }

    // I-type: JALR
    is("b1100111".U) {
      io.imm := Cat(
        Fill(20, io.instruction(31)),
        io.instruction(31, 20)
      )
    }

    // S-type
    is("b0100011".U) {
      io.imm := Cat(
        Fill(20, io.instruction(31)),
        io.instruction(31, 25),
        io.instruction(11, 7)
      )
    }

    // SB-type
    is("b1100011".U) {
      io.imm := Cat(
        Fill(19, io.instruction(31)),
        io.instruction(31),
        io.instruction(7),
        io.instruction(30, 25),
        io.instruction(11, 8),
        0.U(1.W)
      )
    }

    // U-type: LUI
    is("b0110111".U) {
      io.imm := Cat(
        io.instruction(31, 12),
        0.U(12.W)
      )
    }

    // U-type
    is("b0010111".U) {
      io.imm := Cat(
        io.instruction(31, 12),
        0.U(12.W)
      )
    }

    // J-type:Jal
    is("b1101111".U) {
      io.imm := Cat(
        Fill(11, io.instruction(31)),
        io.instruction(31),
        io.instruction(19, 12),
        io.instruction(20),
        io.instruction(30, 21),
        0.U(1.W)
      )
    }
  }
}
