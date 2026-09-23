package core
import chisel3._


class Jalr extends Module {
  val io = IO (new Bundle {
	val in1 = Input(SInt(32.W))
	val in2 = Input(SInt(32.W))
	val out = Output(SInt(32.W))
  })
	val a = io.in1 + io.in2
	io.out := a & 4294967294L.S
}