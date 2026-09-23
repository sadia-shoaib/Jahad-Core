
package core

import chisel3._
import chiseltest._
import org.scalatest.FreeSpec

class TopTest extends FreeSpec with ChiselScalatestTester {

  "Top module" - {

    "should execute all instructions" in {

      test(new Top) { dut =>

        // Run one clock cycle for each instruction
        dut.clock.step(100)  

      }
    }
  }
}
