;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Controller : 
  module TypeControl : 
    input clock : Clock
    input reset : Reset
    output io : {flip opcode : UInt<7>, R_Type : UInt<1>, I_Type : UInt<1>, Store : UInt<1>, Load : UInt<1>, Branch : UInt<1>, Jal : UInt<1>, Jalr : UInt<1>, LUI : UInt<1>}
    
    io.R_Type <= UInt<1>("h00") @[TypeControl.scala 19:15]
    io.I_Type <= UInt<1>("h00") @[TypeControl.scala 20:15]
    io.Store <= UInt<1>("h00") @[TypeControl.scala 21:14]
    io.Load <= UInt<1>("h00") @[TypeControl.scala 22:13]
    io.Branch <= UInt<1>("h00") @[TypeControl.scala 23:15]
    io.Jal <= UInt<1>("h00") @[TypeControl.scala 24:12]
    io.Jalr <= UInt<1>("h00") @[TypeControl.scala 25:13]
    io.LUI <= UInt<1>("h00") @[TypeControl.scala 26:12]
    node _T = eq(io.opcode, UInt<5>("h013")) @[TypeControl.scala 28:20]
    when _T : @[TypeControl.scala 28:32]
      io.I_Type <= UInt<1>("h01") @[TypeControl.scala 29:20]
      skip @[TypeControl.scala 28:32]
    else : @[TypeControl.scala 30:38]
      node _T_1 = eq(io.opcode, UInt<6>("h033")) @[TypeControl.scala 30:26]
      when _T_1 : @[TypeControl.scala 30:38]
        io.R_Type <= UInt<1>("h01") @[TypeControl.scala 31:19]
        skip @[TypeControl.scala 30:38]
      else : @[TypeControl.scala 32:38]
        node _T_2 = eq(io.opcode, UInt<6>("h023")) @[TypeControl.scala 32:26]
        when _T_2 : @[TypeControl.scala 32:38]
          io.Store <= UInt<1>("h01") @[TypeControl.scala 33:18]
          skip @[TypeControl.scala 32:38]
        else : @[TypeControl.scala 34:38]
          node _T_3 = eq(io.opcode, UInt<7>("h063")) @[TypeControl.scala 34:26]
          when _T_3 : @[TypeControl.scala 34:38]
            io.Branch <= UInt<1>("h01") @[TypeControl.scala 35:19]
            skip @[TypeControl.scala 34:38]
          else : @[TypeControl.scala 36:38]
            node _T_4 = eq(io.opcode, UInt<2>("h03")) @[TypeControl.scala 36:26]
            when _T_4 : @[TypeControl.scala 36:38]
              io.Load <= UInt<1>("h01") @[TypeControl.scala 37:17]
              skip @[TypeControl.scala 36:38]
            else : @[TypeControl.scala 38:38]
              node _T_5 = eq(io.opcode, UInt<7>("h06f")) @[TypeControl.scala 38:26]
              when _T_5 : @[TypeControl.scala 38:38]
                io.Jal <= UInt<1>("h01") @[TypeControl.scala 39:16]
                skip @[TypeControl.scala 38:38]
              else : @[TypeControl.scala 40:38]
                node _T_6 = eq(io.opcode, UInt<7>("h067")) @[TypeControl.scala 40:26]
                when _T_6 : @[TypeControl.scala 40:38]
                  io.Jalr <= UInt<1>("h01") @[TypeControl.scala 41:17]
                  skip @[TypeControl.scala 40:38]
                else : @[TypeControl.scala 42:38]
                  node _T_7 = eq(io.opcode, UInt<6>("h037")) @[TypeControl.scala 42:26]
                  when _T_7 : @[TypeControl.scala 42:38]
                    io.LUI <= UInt<1>("h01") @[TypeControl.scala 43:16]
                    skip @[TypeControl.scala 42:38]
    
  module OperandA_sel : 
    input clock : Clock
    input reset : Reset
    output io : {flip LUI : UInt<1>, flip Jal : UInt<1>, flip Jalr : UInt<1>, and0 : UInt<1>, and1 : UInt<1>, and2 : UInt<1>, and3 : UInt<1>, or : UInt<1>, oper_A : UInt<2>}
    
    node _io_and0_T = eq(io.LUI, UInt<1>("h00")) @[OperandA_sel.scala 20:16]
    node _io_and0_T_1 = and(_io_and0_T, io.Jal) @[OperandA_sel.scala 20:24]
    node _io_and0_T_2 = eq(io.Jalr, UInt<1>("h00")) @[OperandA_sel.scala 20:37]
    node _io_and0_T_3 = and(_io_and0_T_1, _io_and0_T_2) @[OperandA_sel.scala 20:34]
    io.and0 <= _io_and0_T_3 @[OperandA_sel.scala 20:13]
    node _io_and1_T = eq(io.LUI, UInt<1>("h00")) @[OperandA_sel.scala 21:16]
    node _io_and1_T_1 = and(_io_and1_T, io.Jalr) @[OperandA_sel.scala 21:24]
    node _io_and1_T_2 = eq(io.Jal, UInt<1>("h00")) @[OperandA_sel.scala 21:38]
    node _io_and1_T_3 = and(_io_and1_T_1, _io_and1_T_2) @[OperandA_sel.scala 21:35]
    io.and1 <= _io_and1_T_3 @[OperandA_sel.scala 21:13]
    node _io_and2_T = eq(io.Jal, UInt<1>("h00")) @[OperandA_sel.scala 22:26]
    node _io_and2_T_1 = and(io.LUI, _io_and2_T) @[OperandA_sel.scala 22:23]
    node _io_and2_T_2 = eq(io.Jalr, UInt<1>("h00")) @[OperandA_sel.scala 22:37]
    node _io_and2_T_3 = and(_io_and2_T_1, _io_and2_T_2) @[OperandA_sel.scala 22:34]
    io.and2 <= _io_and2_T_3 @[OperandA_sel.scala 22:13]
    node _io_and3_T = eq(io.LUI, UInt<1>("h00")) @[OperandA_sel.scala 23:16]
    node _io_and3_T_1 = eq(io.Jal, UInt<1>("h00")) @[OperandA_sel.scala 23:27]
    node _io_and3_T_2 = and(_io_and3_T, _io_and3_T_1) @[OperandA_sel.scala 23:24]
    node _io_and3_T_3 = eq(io.Jalr, UInt<1>("h00")) @[OperandA_sel.scala 23:38]
    node _io_and3_T_4 = and(_io_and3_T_2, _io_and3_T_3) @[OperandA_sel.scala 23:35]
    io.and3 <= _io_and3_T_4 @[OperandA_sel.scala 23:13]
    node _io_or_T = or(io.and0, io.and1) @[OperandA_sel.scala 25:22]
    node _io_or_T_1 = or(_io_or_T, io.and2) @[OperandA_sel.scala 25:32]
    io.or <= _io_or_T_1 @[OperandA_sel.scala 25:11]
    node _io_oper_A_T = cat(io.or, io.and3) @[Cat.scala 30:58]
    io.oper_A <= _io_oper_A_T @[OperandA_sel.scala 29:15]
    
  module NextPc : 
    input clock : Clock
    input reset : Reset
    output io : {flip Branch : UInt<1>, flip Jal : UInt<1>, flip Jalr : UInt<1>, next_Pc : UInt<2>}
    
    io.next_Pc <= UInt<1>("h00") @[NextPc.scala 20:16]
    node _T = or(io.Branch, io.Jalr) @[NextPc.scala 23:20]
    when _T : @[NextPc.scala 23:32]
      io.next_Pc <= UInt<1>("h01") @[NextPc.scala 24:20]
      skip @[NextPc.scala 23:32]
    when io.Jal : @[NextPc.scala 28:18]
      io.next_Pc <= UInt<2>("h03") @[NextPc.scala 29:20]
      skip @[NextPc.scala 28:18]
    
  module AluOpController : 
    input clock : Clock
    input reset : Reset
    output io : {flip RType : UInt<1>, flip IType : UInt<1>, flip branch : UInt<1>, flip load : UInt<1>, flip store : UInt<1>, flip jal : UInt<1>, flip jalr : UInt<1>, flip LUI : UInt<1>, and5 : UInt<1>, and4 : UInt<1>, and1 : UInt<1>, aluopt : UInt<3>}
    
    node _io_and5_T = eq(io.RType, UInt<1>("h00")) @[AluOpController.scala 26:16]
    node _io_and5_T_1 = eq(io.branch, UInt<1>("h00")) @[AluOpController.scala 27:16]
    node _io_and5_T_2 = and(_io_and5_T, _io_and5_T_1) @[AluOpController.scala 26:26]
    node _io_and5_T_3 = eq(io.IType, UInt<1>("h00")) @[AluOpController.scala 28:16]
    node _io_and5_T_4 = and(_io_and5_T_2, _io_and5_T_3) @[AluOpController.scala 27:27]
    node _io_and5_T_5 = eq(io.jalr, UInt<1>("h00")) @[AluOpController.scala 29:16]
    node _io_and5_T_6 = and(_io_and5_T_4, _io_and5_T_5) @[AluOpController.scala 28:26]
    node _io_and5_T_7 = eq(io.jal, UInt<1>("h00")) @[AluOpController.scala 30:16]
    node _io_and5_T_8 = and(_io_and5_T_6, _io_and5_T_7) @[AluOpController.scala 29:25]
    io.and5 <= _io_and5_T_8 @[AluOpController.scala 26:13]
    node _io_and4_T = eq(io.RType, UInt<1>("h00")) @[AluOpController.scala 32:16]
    node _io_and4_T_1 = eq(io.load, UInt<1>("h00")) @[AluOpController.scala 33:16]
    node _io_and4_T_2 = and(_io_and4_T, _io_and4_T_1) @[AluOpController.scala 32:26]
    node _io_and4_T_3 = eq(io.store, UInt<1>("h00")) @[AluOpController.scala 34:16]
    node _io_and4_T_4 = and(_io_and4_T_2, _io_and4_T_3) @[AluOpController.scala 33:25]
    node _io_and4_T_5 = eq(io.IType, UInt<1>("h00")) @[AluOpController.scala 35:16]
    node _io_and4_T_6 = and(_io_and4_T_4, _io_and4_T_5) @[AluOpController.scala 34:26]
    io.and4 <= _io_and4_T_6 @[AluOpController.scala 32:13]
    node _io_and1_T = eq(io.RType, UInt<1>("h00")) @[AluOpController.scala 37:16]
    node _io_and1_T_1 = eq(io.load, UInt<1>("h00")) @[AluOpController.scala 38:16]
    node _io_and1_T_2 = and(_io_and1_T, _io_and1_T_1) @[AluOpController.scala 37:26]
    node _io_and1_T_3 = eq(io.branch, UInt<1>("h00")) @[AluOpController.scala 39:16]
    node _io_and1_T_4 = and(_io_and1_T_2, _io_and1_T_3) @[AluOpController.scala 38:25]
    node _io_and1_T_5 = eq(io.LUI, UInt<1>("h00")) @[AluOpController.scala 40:16]
    node _io_and1_T_6 = and(_io_and1_T_4, _io_and1_T_5) @[AluOpController.scala 39:27]
    io.and1 <= _io_and1_T_6 @[AluOpController.scala 37:13]
    node io_aluopt_hi = cat(io.and5, io.and4) @[Cat.scala 30:58]
    node _io_aluopt_T = cat(io_aluopt_hi, io.and1) @[Cat.scala 30:58]
    io.aluopt <= _io_aluopt_T @[AluOpController.scala 42:15]
    
  module SignalControl : 
    input clock : Clock
    input reset : Reset
    output io : {flip R_Type : UInt<1>, flip Load : UInt<1>, flip Store : UInt<1>, flip Branch : UInt<1>, flip I_Type : UInt<1>, flip Jalr : UInt<1>, flip Jal : UInt<1>, flip LUI : UInt<1>, mem_write : UInt<1>, branch : UInt<1>, mem_read : UInt<1>, RegWrite : UInt<1>, mem_to_Reg : UInt<1>, ALU_operation : UInt<3>, operand_A_sel : UInt<2>, operand_B_sel : UInt<1>, extend_sel : UInt<2>, next_pc_sel : UInt<2>}
    
    inst op_A of OperandA_sel @[SignalControl.scala 39:22]
    op_A.clock <= clock
    op_A.reset <= reset
    op_A.io.LUI <= io.LUI @[SignalControl.scala 41:18]
    op_A.io.Jal <= io.Jal @[SignalControl.scala 42:18]
    op_A.io.Jalr <= io.Jalr @[SignalControl.scala 43:18]
    io.operand_A_sel <= op_A.io.oper_A @[SignalControl.scala 45:22]
    inst next of NextPc @[SignalControl.scala 48:24]
    next.clock <= clock
    next.reset <= reset
    next.io.Branch <= io.Branch @[SignalControl.scala 49:21]
    next.io.Jal <= io.Jal @[SignalControl.scala 50:18]
    next.io.Jalr <= io.Jalr @[SignalControl.scala 51:19]
    io.next_pc_sel <= next.io.next_Pc @[SignalControl.scala 52:20]
    inst alOp of AluOpController @[SignalControl.scala 56:22]
    alOp.clock <= clock
    alOp.reset <= reset
    alOp.io.RType <= io.R_Type @[SignalControl.scala 58:20]
    alOp.io.IType <= io.I_Type @[SignalControl.scala 59:20]
    alOp.io.store <= io.Store @[SignalControl.scala 60:20]
    alOp.io.load <= io.Load @[SignalControl.scala 61:20]
    alOp.io.LUI <= io.LUI @[SignalControl.scala 62:20]
    alOp.io.jal <= io.Jal @[SignalControl.scala 63:20]
    alOp.io.jalr <= io.Jalr @[SignalControl.scala 64:20]
    alOp.io.branch <= io.Branch @[SignalControl.scala 65:20]
    io.mem_write <= UInt<1>("h00") @[SignalControl.scala 69:18]
    io.branch <= UInt<1>("h00") @[SignalControl.scala 70:15]
    io.mem_read <= UInt<1>("h00") @[SignalControl.scala 71:17]
    io.RegWrite <= UInt<1>("h00") @[SignalControl.scala 72:17]
    io.mem_to_Reg <= UInt<1>("h00") @[SignalControl.scala 73:19]
    io.ALU_operation <= alOp.io.aluopt @[SignalControl.scala 75:22]
    io.operand_B_sel <= UInt<1>("h00") @[SignalControl.scala 77:22]
    node _io_extend_sel_T = cat(io.Store, io.Load) @[Cat.scala 30:58]
    io.extend_sel <= _io_extend_sel_T @[SignalControl.scala 88:19]
    when io.Load : @[SignalControl.scala 94:19]
      io.mem_read <= UInt<1>("h01") @[SignalControl.scala 96:21]
      io.mem_to_Reg <= UInt<1>("h01") @[SignalControl.scala 97:23]
      io.RegWrite <= UInt<1>("h01") @[SignalControl.scala 98:21]
      io.operand_B_sel <= UInt<1>("h01") @[SignalControl.scala 100:26]
      skip @[SignalControl.scala 94:19]
    when io.Store : @[SignalControl.scala 105:20]
      io.mem_write <= UInt<1>("h01") @[SignalControl.scala 107:22]
      io.operand_B_sel <= UInt<1>("h00") @[SignalControl.scala 109:26]
      skip @[SignalControl.scala 105:20]
    when io.R_Type : @[SignalControl.scala 114:21]
      io.RegWrite <= UInt<1>("h01") @[SignalControl.scala 116:21]
      skip @[SignalControl.scala 114:21]
    when io.I_Type : @[SignalControl.scala 121:21]
      io.RegWrite <= UInt<1>("h01") @[SignalControl.scala 123:21]
      io.operand_B_sel <= UInt<1>("h01") @[SignalControl.scala 124:26]
      skip @[SignalControl.scala 121:21]
    when io.Branch : @[SignalControl.scala 129:21]
      io.branch <= UInt<1>("h01") @[SignalControl.scala 131:19]
      skip @[SignalControl.scala 129:21]
    when io.Jal : @[SignalControl.scala 136:18]
      io.RegWrite <= UInt<1>("h01") @[SignalControl.scala 138:21]
      skip @[SignalControl.scala 136:18]
    when io.Jalr : @[SignalControl.scala 143:19]
      io.RegWrite <= UInt<1>("h01") @[SignalControl.scala 145:21]
      skip @[SignalControl.scala 143:19]
    when io.LUI : @[SignalControl.scala 150:18]
      io.RegWrite <= UInt<1>("h01") @[SignalControl.scala 152:21]
      io.operand_B_sel <= UInt<1>("h01") @[SignalControl.scala 153:26]
      skip @[SignalControl.scala 150:18]
    
  module Controller : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip opcode : UInt<7>, mem_write : UInt<1>, branch : UInt<1>, mem_read : UInt<1>, RegWrite : UInt<1>, mem_to_Reg : UInt<1>, ALU_operation : UInt<3>, operand_A_sel : UInt<2>, operand_B_sel : UInt<1>, extend_sel : UInt<2>, next_pc_sel : UInt<2>}
    
    inst typeControl of TypeControl @[Controller.scala 32:29]
    typeControl.clock <= clock
    typeControl.reset <= reset
    typeControl.io.opcode <= io.opcode @[Controller.scala 34:27]
    inst signalControl of SignalControl @[Controller.scala 36:31]
    signalControl.clock <= clock
    signalControl.reset <= reset
    signalControl.io.R_Type <= typeControl.io.R_Type @[Controller.scala 41:29]
    signalControl.io.I_Type <= typeControl.io.I_Type @[Controller.scala 42:29]
    signalControl.io.Store <= typeControl.io.Store @[Controller.scala 43:28]
    signalControl.io.Load <= typeControl.io.Load @[Controller.scala 44:27]
    signalControl.io.Branch <= typeControl.io.Branch @[Controller.scala 45:29]
    signalControl.io.Jal <= typeControl.io.Jal @[Controller.scala 46:26]
    signalControl.io.Jalr <= typeControl.io.Jalr @[Controller.scala 47:27]
    signalControl.io.LUI <= typeControl.io.LUI @[Controller.scala 48:26]
    io.mem_write <= signalControl.io.mem_write @[Controller.scala 52:18]
    io.branch <= signalControl.io.branch @[Controller.scala 53:15]
    io.mem_read <= signalControl.io.mem_read @[Controller.scala 54:17]
    io.RegWrite <= signalControl.io.RegWrite @[Controller.scala 55:17]
    io.mem_to_Reg <= signalControl.io.mem_to_Reg @[Controller.scala 56:19]
    io.ALU_operation <= signalControl.io.ALU_operation @[Controller.scala 58:22]
    io.operand_A_sel <= signalControl.io.operand_A_sel @[Controller.scala 60:22]
    io.operand_B_sel <= signalControl.io.operand_B_sel @[Controller.scala 61:22]
    io.extend_sel <= signalControl.io.extend_sel @[Controller.scala 63:19]
    io.next_pc_sel <= signalControl.io.next_pc_sel @[Controller.scala 65:20]
    
