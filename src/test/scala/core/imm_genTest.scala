package core
import chisel3._
import chiseltest._
import org.scalatest.FreeSpec

class imm_genTest extends FreeSpec with ChiselScalatestTester {

  "Verify imm" in {
    test(new Imm_gen) { dut =>
      dut.io.instruction.poke("h00500093".U)
      dut.io.imm.expect(5.U)
    }
  }
}
