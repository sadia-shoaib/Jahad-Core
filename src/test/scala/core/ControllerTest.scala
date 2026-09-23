package core
import chisel3._
import chiseltest._
import org.scalatest.FreeSpec

class ControllerTest extends FreeSpec with ChiselScalatestTester {

  "Verify Main Controller" in {

    test(new Controller()) { dut =>

      // =====================================================
      // R-Type
      // opcode = 0x33
      // =====================================================

      dut.io.opcode.poke("h33".U)

      dut.io.RegWrite.expect(1.B)
      dut.io.mem_write.expect(0.B)
      dut.io.mem_read.expect(0.B)
      dut.io.mem_to_Reg.expect(0.B)
      dut.io.branch.expect(0.B)

      dut.io.operand_B_sel.expect(0.B)
      dut.io.extend_sel.expect("b00".U)

      // R-Type is not a jump or branch
      dut.io.next_pc_sel.expect("b00".U)


      // =====================================================
      // I-Type
      // opcode = 0x13
      // =====================================================

      dut.io.opcode.poke("h13".U)

      dut.io.RegWrite.expect(1.B)
      dut.io.mem_write.expect(0.B)
      dut.io.mem_read.expect(0.B)
      dut.io.mem_to_Reg.expect(0.B)
      dut.io.branch.expect(0.B)

      // I-Type uses immediate
      dut.io.operand_B_sel.expect(1.B)

      dut.io.extend_sel.expect("b00".U)
      dut.io.next_pc_sel.expect("b00".U)


      // =====================================================
      // Load
      // opcode = 0x03
      // =====================================================

      dut.io.opcode.poke("h03".U)

      dut.io.RegWrite.expect(1.B)
      dut.io.mem_write.expect(0.B)
      dut.io.mem_read.expect(1.B)
      dut.io.mem_to_Reg.expect(1.B)
      dut.io.branch.expect(0.B)

      dut.io.operand_B_sel.expect(1.B)

      // Store=0, Load=1 -> 01
      dut.io.extend_sel.expect("b01".U)

      dut.io.next_pc_sel.expect("b00".U)


      // =====================================================
      // Store
      // opcode = 0x23
      // =====================================================

      dut.io.opcode.poke("h23".U)

      dut.io.RegWrite.expect(0.B)
      dut.io.mem_write.expect(1.B)
      dut.io.mem_read.expect(0.B)
      dut.io.mem_to_Reg.expect(0.B)
      dut.io.branch.expect(0.B)

      dut.io.operand_B_sel.expect(0.B)

      // Store=1, Load=0 -> 10
      dut.io.extend_sel.expect("b10".U)

      dut.io.next_pc_sel.expect("b00".U)


      // =====================================================
      // Branch
      // opcode = 0x63
      // =====================================================

      dut.io.opcode.poke("h63".U)

      dut.io.RegWrite.expect(0.B)
      dut.io.mem_write.expect(0.B)
      dut.io.mem_read.expect(0.B)
      dut.io.mem_to_Reg.expect(0.B)
      dut.io.branch.expect(1.B)

      dut.io.operand_B_sel.expect(0.B)

      dut.io.extend_sel.expect("b00".U)

      // Branch -> 01
      dut.io.next_pc_sel.expect("b01".U)


      // =====================================================
      // JAL
      // opcode = 0x6F
      // =====================================================

      dut.io.opcode.poke("h6f".U)

      dut.io.RegWrite.expect(1.B)
      dut.io.mem_write.expect(0.B)
      dut.io.mem_read.expect(0.B)
      dut.io.mem_to_Reg.expect(0.B)
      dut.io.branch.expect(0.B)

      dut.io.extend_sel.expect("b00".U)

      // JAL -> 11
      dut.io.next_pc_sel.expect("b11".U)


      // =====================================================
      // JALR
      // opcode = 0x67
      // =====================================================

      dut.io.opcode.poke("h67".U)

      dut.io.RegWrite.expect(1.B)
      dut.io.mem_write.expect(0.B)
      dut.io.mem_read.expect(0.B)
      dut.io.mem_to_Reg.expect(0.B)
      dut.io.branch.expect(0.B)

      dut.io.extend_sel.expect("b00".U)

      // JALR -> 01
      dut.io.next_pc_sel.expect("b01".U)


      // =====================================================
      // LUI
      // opcode = 0x37
      // =====================================================

      dut.io.opcode.poke("h37".U)

      dut.io.RegWrite.expect(1.B)
      dut.io.mem_write.expect(0.B)
      dut.io.mem_read.expect(0.B)
      dut.io.mem_to_Reg.expect(0.B)
      dut.io.branch.expect(0.B)

      dut.io.operand_B_sel.expect(1.B)

      dut.io.extend_sel.expect("b00".U)
      dut.io.next_pc_sel.expect("b00".U)


      println("Main Controller test completed successfully!")

    }
  }
}
