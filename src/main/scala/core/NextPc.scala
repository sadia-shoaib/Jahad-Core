package core
import chisel3._
import chisel3.util._

class NextPcIO extends Bundle {

    val Branch = Input(Bool())
    val Jal    = Input(Bool())
    val Jalr   = Input(Bool())

    val next_Pc = Output(UInt(2.W))
}

class NextPc extends Module {

    val io = IO(new NextPcIO)

    // Default:
    // 00 = normal PC + 4
    io.next_Pc := "b00".U

    // Branch or JALR
    when(io.Branch || io.Jalr) {
        io.next_Pc := "b01".U
    }

    // JAL
    when(io.Jal) {
        io.next_Pc := "b11".U
    }
}

