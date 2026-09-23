package core
import chisel3._ 
import chisel3.util._

class Interface extends Bundle {
    val opcode = Input(UInt(7.W))
    val R_Type = Output(Bool())
    val I_Type = Output(Bool())
    val Store = Output(Bool())
    val Load = Output(Bool())
    val Branch = Output(Bool())
    val Jal = Output(Bool())
    val Jalr = Output(Bool())
    val LUI = Output(Bool())
}

class TypeControl extends Module{
    val io = IO(new Interface)
    io.R_Type := 0.B
    io.I_Type := 0.B
    io.Store := 0.B
    io.Load := 0.B
    io.Branch := 0.B
    io.Jal := 0.B
    io.Jalr := 0.B
    io.LUI := 0.B

    when(io.opcode === "h13".U){
        io. I_Type := 1.B
    }.elsewhen(io.opcode === "h33".U){
        io.R_Type := 1.B
    }.elsewhen(io.opcode === "h23".U){
        io.Store := 1.B
    }.elsewhen(io.opcode === "h63".U){
        io.Branch := 1.B
    }.elsewhen(io.opcode === "h03".U){
        io.Load := 1.B
    }.elsewhen(io.opcode === "h6f".U){
        io.Jal := 1.B
    }.elsewhen(io.opcode === "h67".U){
        io.Jalr := 1.B
    }.elsewhen(io.opcode === "h37".U){
        io.LUI := 1.B
    }
    
}