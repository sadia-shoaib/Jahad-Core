package core
import chisel3._
import chisel3.util._

class OperandA_sel extends Module {
    val io = IO(new Bundle {
        val LUI = Input(Bool())
        val Jal = Input(Bool())
        val Jalr = Input(Bool())

        val and0 = Output(Bool())
        val and1 = Output(Bool())
        val and2 = Output(Bool())
        val and3 = Output(Bool())
        val or = Output(Bool())

        val oper_A = Output(UInt(2.W))
    })

    io.and0 := !io.LUI && io.Jal && !io.Jalr
    io.and1 := !io.LUI && io.Jalr && !io.Jal
    io.and2 := io.LUI && !io.Jal && !io.Jalr
    io.and3 := !io.LUI && !io.Jal && !io.Jalr

    io.or := io.and0 | io.and1 | io.and2

    // bit 1 = or
    // bit 0 = and3
    io.oper_A := Cat(io.or, io.and3)
}