package core

import chisel3._
import chisel3.util._

// aluOp from AluOpController:
//   000 R-type   001 I-type   010 Branch
//   011 JAL/JALR 100 Load     101 Store   110 LUI   111 other
// (everything except R / I / Branch just uses ADD)
class ALUControl extends Module {
  val io = IO(new Bundle {
    val aluOp   = Input(UInt(3.W))
    val funct3  = Input(UInt(3.W))
    val funct7  = Input(Bool())          // instruction bit 30
    val aluCtrl = Output(UInt(5.W))
  })

  val isR  = io.aluOp === "b000".U
  val isI  = io.aluOp === "b001".U
  val isBr = io.aluOp === "b010".U

  // Bit 30 selects SUB/SRA for R-type, but for I-type it only matters
  // for srli/srai (funct3 = 101). For addi etc. it is part of the immediate.
  val f7 = Mux(isR, io.funct7,
           Mux(isI && io.funct3 === "b101".U, io.funct7, false.B))

  io.aluCtrl := MuxCase(
    0.U(5.W),                                   // default: ADD
    Seq(
      (isR || isI) -> Cat(0.U(1.W), f7, io.funct3),
      isBr         -> Cat(1.U(2.W), io.funct3)
    )
  )
}