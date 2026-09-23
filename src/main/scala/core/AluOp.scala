package core

import chisel3._

object AluOp {

  val ALU_ADD    = 0.U(5.W)
  val ALU_SLL    = 1.U(5.W)
  val ALU_SLT    = 2.U(5.W)
  val ALU_SLTU   = 3.U(5.W)
  val ALU_XOR    = 4.U(5.W)
  val ALU_SRL    = 5.U(5.W)
  val ALU_OR     = 6.U(5.W)
  val ALU_AND    = 7.U(5.W)
  val ALU_SUB    = 8.U(5.W)
  val ALU_SRA    = 13.U(5.W)
  val ALU_BEQ    = 16.U(5.W)
  val ALU_BNE    = 17.U(5.W)
  val ALU_BLT    = 20.U(5.W)
  val ALU_BGE    = 21.U(5.W)
  val ALU_BLTU   = 22.U(5.W)
  val ALU_BGEU   = 23.U(5.W)
  val ALU_COPY_A = 31.U(5.W)
}