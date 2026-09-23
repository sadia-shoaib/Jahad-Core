package core

import chisel3._
import chisel3.util._

// aluControl encoding (5 bits):
//   0_0000 ADD   0_1000 SUB
//   0_0001 SLL
//   0_0010 SLT   0_0011 SLTU
//   0_0100 XOR
//   0_0101 SRL   0_1101 SRA
//   0_0110 OR    0_0111 AND
//   1_0000 BEQ   1_0001 BNE
//   1_0100 BLT   1_0101 BGE
//   1_0110 BLTU  1_0111 BGEU
class ALU extends Module {
  val io = IO(new Bundle {
    val in1        = Input(SInt(32.W))
    val in2        = Input(SInt(32.W))
    val aluControl = Input(UInt(5.W))
    val out        = Output(SInt(32.W))
    val Branch     = Output(Bool())
  })

  val a  = io.in1
  val b  = io.in2
  val aU = a.asUInt
  val bU = b.asUInt

  // Only the low 5 bits of operand B are used as the shift amount
  val shamt = io.in2(4, 0).asUInt

  io.out    := 0.S
  io.Branch := false.B

  switch(io.aluControl) {
    // Arithmetic / logic
    is("b00000".U) { io.out := a + b }
    is("b01000".U) { io.out := a - b }
    is("b00001".U) { io.out := (aU << shamt)(31, 0).asSInt }
    is("b00010".U) { io.out := Mux(a < b, 1.S, 0.S) }
    is("b00011".U) { io.out := Mux(aU < bU, 1.S, 0.S) }
    is("b00100".U) { io.out := (aU ^ bU).asSInt }
    is("b00101".U) { io.out := (aU >> shamt).asSInt }
    is("b01101".U) { io.out := (a >> shamt).asSInt }
    is("b00110".U) { io.out := (aU | bU).asSInt }
    is("b00111".U) { io.out := (aU & bU).asSInt }

    // Branch comparisons (result goes on Branch, not on out)
    is("b10000".U) { io.Branch := (a === b) }   // beq
    is("b10001".U) { io.Branch := (a =/= b) }   // bne
    is("b10100".U) { io.Branch := (a < b) }     // blt
    is("b10101".U) { io.Branch := (a >= b) }    // bge
    is("b10110".U) { io.Branch := (aU < bU) }   // bltu
    is("b10111".U) { io.Branch := (aU >= bU) }  // bgeu
  }
}