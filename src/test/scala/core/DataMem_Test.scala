
package core

import chisel3._
import chiseltest._
import org.scalatest.FreeSpec

class DataMem_Test extends FreeSpec with ChiselScalatestTester {

  "Verify DataMem" in {

    test(new DataMem) { dut =>

      // --------------------------------
      // Select input 0 = 100
      // --------------------------------
      dut.io.data_in(0).poke(100.U)
      dut.io.data_in(1).poke(200.U)
      dut.io.data_in(2).poke(300.U)
      dut.io.data_in(3).poke(400.U)

      dut.io.data_selector.poke(0.U)

      // Address 5
      dut.io.addr.poke(5.U)

      // Enable writing
      dut.io.wr_en.poke(true.B)

      // Write selected value (100) into address 5
      dut.clock.step(1)

      // --------------------------------
      // Stop writing
      // --------------------------------
      dut.io.wr_en.poke(false.B)

      // Read address 5
      dut.io.addr.poke(5.U)

      dut.io.data_out.expect(100.U)

      // --------------------------------
      // Write input 1 = 200
      // into address 10
      // --------------------------------
      dut.io.data_selector.poke(1.U)
      dut.io.addr.poke(10.U)
      dut.io.wr_en.poke(true.B)

      dut.clock.step(1)

      dut.io.wr_en.poke(false.B)

      // Read address 10
      dut.io.addr.poke(10.U)

      dut.io.data_out.expect(200.U)

      // --------------------------------
      // Write input 2 = 300
      // into address 15
      // --------------------------------
      dut.io.data_selector.poke(2.U)
      dut.io.addr.poke(15.U)
      dut.io.wr_en.poke(true.B)

      dut.clock.step(1)

      dut.io.wr_en.poke(false.B)

      // Read address 15
      dut.io.addr.poke(15.U)

      dut.io.data_out.expect(300.U)

      // --------------------------------
      // Write input 3 = 400
      // into address 20
      // --------------------------------
      dut.io.data_selector.poke(3.U)
      dut.io.addr.poke(20.U)
      dut.io.wr_en.poke(true.B)

      dut.clock.step(1)

      dut.io.wr_en.poke(false.B)

      // Read address 20
      dut.io.addr.poke(20.U)

      dut.io.data_out.expect(400.U)
    }
  }
}
