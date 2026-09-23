package core

import chisel3._
import chisel3.util._

class ControlDecodeIO extends Bundle {

  val R_Type = Input(Bool())
  val Load   = Input(Bool())
  val Store  = Input(Bool())
  val Branch = Input(Bool())
  val I_Type = Input(Bool())
  val Jalr   = Input(Bool())
  val Jal    = Input(Bool())
  val LUI    = Input(Bool())

  val mem_write  = Output(Bool())
  val branch     = Output(Bool())
  val mem_read   = Output(Bool())
  val RegWrite   = Output(Bool())
  val mem_to_Reg = Output(Bool())

  val ALU_operation = Output(UInt(3.W))

  val operand_A_sel = Output(UInt(2.W))
  val operand_B_sel = Output(Bool())

  val extend_sel  = Output(UInt(2.W))
  val next_pc_sel = Output(UInt(2.W))
}

class SignalControl extends Module {

  val io = IO(new ControlDecodeIO)

  // Operand A selector
  val op_A = Module(new OperandA_sel)
  op_A.io.LUI  := io.LUI
  op_A.io.Jal  := io.Jal
  op_A.io.Jalr := io.Jalr
  io.operand_A_sel := op_A.io.oper_A

  // Next PC selector
  val next = Module(new NextPc)
  next.io.Branch := io.Branch
  next.io.Jal    := io.Jal
  next.io.Jalr   := io.Jalr
  io.next_pc_sel := next.io.next_Pc

  // ALU operation controller
  val alOp = Module(new AluOpController)
  alOp.io.RType  := io.R_Type
  alOp.io.IType  := io.I_Type
  alOp.io.store  := io.Store
  alOp.io.load   := io.Load
  alOp.io.LUI    := io.LUI
  alOp.io.jal    := io.Jal
  alOp.io.jalr   := io.Jalr
  alOp.io.branch := io.Branch

  // Defaults
  io.mem_write     := false.B
  io.branch        := false.B
  io.mem_read      := false.B
  io.RegWrite      := false.B
  io.mem_to_Reg    := false.B
  io.ALU_operation := alOp.io.aluopt
  io.operand_B_sel := false.B
  io.extend_sel    := Cat(io.Store, io.Load)

  // Load: rs1 + imm, write memory data to rd
  when(io.Load) {
    io.mem_read      := true.B
    io.mem_to_Reg    := true.B
    io.RegWrite      := true.B
    io.operand_B_sel := true.B
  }

  // Store: rs1 + imm (S-type) is the address, so B must be the immediate
  when(io.Store) {
    io.mem_write     := true.B
    io.operand_B_sel := true.B      // FIXED (was false.B)
  }

  // R-type
  when(io.R_Type) {
    io.RegWrite := true.B
  }

  // I-type
  when(io.I_Type) {
    io.RegWrite      := true.B
    io.operand_B_sel := true.B
  }

  // Branch: compare rs1 with rs2, so B stays as the register
  when(io.Branch) {
    io.branch := true.B
  }

  // JAL / JALR: rd gets PC+4 (handled in Top's write-back mux)
  when(io.Jal) {
    io.RegWrite := true.B
  }
  when(io.Jalr) {
    io.RegWrite := true.B
  }

  // LUI
  when(io.LUI) {
    io.RegWrite      := true.B
    io.operand_B_sel := true.B
  }
}