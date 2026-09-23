package core

import chisel3._
import chisel3.util._

class Top(initFile: String = "fibonaciAssembly.txt") extends Module {

  val io = IO(new Bundle {
    val Reg_Out       = Output(SInt(32.W))
    val PC_Out        = Output(UInt(32.W))
    val instruction   = Output(UInt(32.W))
    val aluResult     = Output(UInt(32.W))
    val writeBackData = Output(SInt(32.W))
  })

  // ============================================================
  // MODULES
  // ============================================================
  val Pc         = Module(new ProgramCounter)
  val InsMem     = Module(new InstMem(initFile))
  val Regfile    = Module(new RegFile)
  val ImmGen     = Module(new Imm_gen)
  val controller = Module(new Controller)
  val AluControl = Module(new ALUControl)
  val ALU        = Module(new ALU)
  val DataMem    = Module(new DataMem)
  val TypeDecode = Module(new TypeControl)

  // ============================================================
  // BASIC SIGNALS
  // ============================================================
  val pcValue     = Pc.io.pc
  val pcPlus4     = Pc.io.pc4
  val instruction = InsMem.io.inst

  val opcode = instruction(6, 0)
  val rd     = instruction(11, 7)
  val funct3 = instruction(14, 12)
  val rs1    = instruction(19, 15)
  val rs2    = instruction(24, 20)

  val rdata1    = Regfile.io.rdata1
  val rdata2    = Regfile.io.rdata2
  val immediate = ImmGen.io.imm

  val aluOut      = ALU.io.out.asUInt
  val memReadData = DataMem.io.data_out

  // Instruction classes decoded locally (independent of controller quirks)
  val isJal   = TypeDecode.io.Jal
  val isJalr  = TypeDecode.io.Jalr
  val isLink  = isJal || isJalr
  val isLui   = opcode === "b0110111".U
  val isAuipc = opcode === "b0010111".U

  // ============================================================
  // WIRES
  // ============================================================
  val writeBackData = Wire(SInt(32.W))
  val operandA      = Wire(SInt(32.W))
  val operandB      = Wire(SInt(32.W))
  val nextPC        = Wire(UInt(32.W))

  // ============================================================
  // PC / INSTRUCTION MEMORY
  // ============================================================
  Pc.io.input   := nextPC
  InsMem.io.addr := pcValue

  // ============================================================
  // DECODE
  // ============================================================
  TypeDecode.io.opcode  := opcode
  controller.io.opcode  := opcode
  ImmGen.io.instruction := instruction

  // ============================================================
  // REGISTER FILE
  // ============================================================
  Regfile.io.raddr1 := rs1
  Regfile.io.raddr2 := rs2
  Regfile.io.waddr  := rd
  // controller.RegWrite OR'ed with link/LUI/AUIPC as a safety net
  Regfile.io.wen    := controller.io.RegWrite || isLink || isLui || isAuipc
  Regfile.io.wdata  := writeBackData

  // ============================================================
  // ALU CONTROL
  // funct7 (bit 30) only matters for R-type and for srai/srli.
  // For other I-type (e.g. addi with imm bit 30 set) it must be 0.
  // ============================================================
  AluControl.io.aluOp  := controller.io.ALU_operation
  AluControl.io.funct3 := funct3
  AluControl.io.funct7 := Mux(
    TypeDecode.io.R_Type || (TypeDecode.io.I_Type && funct3 === "b101".U),
    instruction(30),
    false.B
  )

  // ============================================================
  // ALU OPERANDS
  // A: 00/01 = rs1, 10 = PC (AUIPC), 11 = 0 (LUI)
  // B: 0 = rs2, 1 = immediate
  // ============================================================
  operandA := Mux(
    controller.io.operand_A_sel === "b10".U,
    pcValue.asSInt,
    Mux(controller.io.operand_A_sel === "b11".U, 0.S, rdata1.asSInt)
  )

  operandB := Mux(controller.io.operand_B_sel, immediate.asSInt, rdata2.asSInt)

  ALU.io.in1        := operandA
  ALU.io.in2        := operandB
  ALU.io.aluControl := AluControl.io.aluCtrl

  // ============================================================
  // DATA MEMORY (word addressed: byte address >> 2)
  // ============================================================
  DataMem.io.addr := aluOut(9, 2)

  DataMem.io.data_in(0) := rdata2.asUInt
  DataMem.io.data_in(1) := rdata2.asUInt
  DataMem.io.data_in(2) := rdata2.asUInt
  DataMem.io.data_in(3) := rdata2.asUInt
  DataMem.io.data_selector := 0.U

  DataMem.io.wr_en := controller.io.mem_write

  // ============================================================
  // WRITE BACK
  // priority: JAL/JALR (PC+4) > LUI (imm) > AUIPC (pc+imm) > load > ALU
  // ============================================================
  val auipcResult = (pcValue.asSInt + immediate.asSInt)

  writeBackData := MuxCase(
    aluOut.asSInt,
    Seq(
      isLink                     -> pcPlus4.asSInt,
      isLui                      -> immediate.asSInt,
      isAuipc                    -> auipcResult,
      controller.io.mem_to_Reg   -> memReadData.asSInt
    )
  )

  // ============================================================
  // BRANCH / NEXT PC
  // ============================================================
  val brTaken     = ALU.io.Branch.asBool
  val branchTaken = controller.io.branch && brTaken

  val branchTarget = (pcValue.asSInt + immediate.asSInt).asUInt
  val jalTarget    = (pcValue.asSInt + immediate.asSInt).asUInt
  val jalrTarget   = (rdata1.asUInt + immediate.asUInt) & "hFFFFFFFE".U

  nextPC := Mux(isJalr, jalrTarget,
            Mux(isJal, jalTarget,
            Mux(branchTaken, branchTarget, pcPlus4)))

  // ============================================================
  // OUTPUTS
  // ============================================================
  io.PC_Out        := pcValue
  io.instruction   := instruction
  io.aluResult     := aluOut
  io.writeBackData := writeBackData
  io.Reg_Out       := rdata1
}