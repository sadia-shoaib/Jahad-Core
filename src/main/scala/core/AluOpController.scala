package core

import chisel3._
import chisel3.util._

class AluOpController extends Module {

    val io = IO(new Bundle {

        val RType = Input(Bool())
        val IType = Input(Bool())
        val branch = Input(Bool())
        val load = Input(Bool())
        val store = Input(Bool())
        val jal = Input(Bool())
        val jalr = Input(Bool())
        val LUI = Input(Bool())

        val and5 = Output(Bool())
        val and4 = Output(Bool())
        val and1 = Output(Bool())

        val aluopt = Output(UInt(3.W))
    })

    io.and5 := !io.RType &&
               !io.branch &&
               !io.IType &&
               !io.jalr &&
               !io.jal

    io.and4 := !io.RType &&
               !io.load &&
               !io.store &&
               !io.IType

    io.and1 := !io.RType &&
               !io.load &&
               !io.branch &&
               !io.LUI

    io.aluopt := Cat(io.and5, io.and4, io.and1)
}
