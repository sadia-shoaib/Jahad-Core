package processor

import chisel3._
import chisel3.util._
import chisel3.util.log2Ceil

trait Config {
  val INLEN = 8
  val OUTLEN = log2Ceil(INLEN)

}

class PriEnc_IO_Interface extends Bundle with Config {
  val in = Input(Vec(INLEN, Bool()))
  val out = Output(UInt(OUTLEN.W))
}

class PriorityEncoder extends Module {
  val io = IO(new PriEnc_IO_Interface())

  io.out := 0.U

  when(io.in(7)) {
    io.out := 7.U
  }.elsewhen(io.in(6)) {
    io.out := 6.U
  }.elsewhen(io.in(5)) {
    io.out := 5.U
  }.elsewhen(io.in(4)) {
    io.out := 4.U
  }.elsewhen(io.in(3)) {
    io.out := 3.U
  }.elsewhen(io.in(2)) {
    io.out := 2.U
  }.elsewhen(io.in(1)) {
    io.out := 1.U
  }.otherwise {
    io.out := 0.U
  }

}
