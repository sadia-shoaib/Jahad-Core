package core

import chisel3._

class InstrDecoder_ALUCtrl_Interface extends Bundle {

  val funct3 = Input(UInt(3.W))
  val funct7 = Input(UInt(7.W))
}