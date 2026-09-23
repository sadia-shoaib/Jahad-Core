package core
import chisel3._
import chiseltest._
import org.scalatest.FreeSpec

class InstMem_Test extends FreeSpec with ChiselScalatestTester {

  "Verify imm" in {
    test(new InstMem()) { dut =>
      dut.io.addr.poke(0.U)
      dut.io.inst.expect("h00a00213".U)
    }
  }
}
