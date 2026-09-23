package core

import chisel3._
import chiseltest._
import org.scalatest.FreeSpec

class RegFileTest extends FreeSpec with ChiselScalatestTester {

  "Verify RegFile" in {

    test(new RegFile) { dut =>

      // --------------------------------
      // Initially register 0 is zero
      // --------------------------------
      dut.io.raddr1.poke(0.U)
      dut.io.rdata1.expect(0.S)

      // --------------------------------
      // Write 100 into register 1
      // --------------------------------
      dut.io.wen.poke(true.B)
      dut.io.waddr.poke(1.U)
      dut.io.wdata.poke(100.S)

      dut.clock.step(1)

      // --------------------------------
      // Read register 1
      // --------------------------------
      dut.io.raddr1.poke(1.U)
      dut.io.rdata1.expect(100.S)

      // --------------------------------
      // Write 200 into register 2
      // --------------------------------
      dut.io.waddr.poke(2.U)
      dut.io.wdata.poke(200.S)

      dut.clock.step(1)

      // --------------------------------
      // Read register 2
      // --------------------------------
      dut.io.raddr2.poke(2.U)
      dut.io.rdata2.expect(200.S)

      // --------------------------------
      // Check register 1 still has 100
      // --------------------------------
      dut.io.raddr1.poke(1.U)
      dut.io.rdata1.expect(100.S)

      // --------------------------------
      // Try to write 999 into register 0
      // Register 0 must ALWAYS remain 0
      // --------------------------------
      dut.io.waddr.poke(0.U)
      dut.io.wdata.poke(999.S)

      dut.clock.step(1)

      dut.io.raddr1.poke(0.U)
      dut.io.rdata1.expect(0.S)

      // --------------------------------
      // Stop writing
      // --------------------------------
      dut.io.wen.poke(false.B)
    }
  }
}
