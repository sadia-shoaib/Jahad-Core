package core

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

trait Config4 {
  val WLEN         = 32
  val INST_MEM_LEN = 1024
}

class Instr_MemIO extends Bundle with Config4 {
  val addr = Input(UInt(WLEN.W))
  val inst = Output(UInt(WLEN.W))
}

class InstMem(initFile: String = "fibonaciAssembly.txt") extends Module with Config4 {
  val io = IO(new Instr_MemIO)

  val imem = Mem(INST_MEM_LEN, UInt(WLEN.W))
  loadMemoryFromFile(imem, initFile)

  // PC is a byte address; memory is word indexed
  io.inst := imem(io.addr(11, 2))
}