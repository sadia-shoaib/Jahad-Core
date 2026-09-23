circuit Controller :
  module TypeControl :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_R_Type : UInt<1>
    output io_I_Type : UInt<1>
    output io_Store : UInt<1>
    output io_Load : UInt<1>
    output io_Branch : UInt<1>
    output io_Jal : UInt<1>
    output io_Jalr : UInt<1>
    output io_LUI : UInt<1>

    node _T = eq(io_opcode, UInt<5>("h13")) @[TypeControl.scala 28:20]
    node _T_1 = eq(io_opcode, UInt<6>("h33")) @[TypeControl.scala 30:26]
    node _T_2 = eq(io_opcode, UInt<6>("h23")) @[TypeControl.scala 32:26]
    node _T_3 = eq(io_opcode, UInt<7>("h63")) @[TypeControl.scala 34:26]
    node _T_4 = eq(io_opcode, UInt<2>("h3")) @[TypeControl.scala 36:26]
    node _T_5 = eq(io_opcode, UInt<7>("h6f")) @[TypeControl.scala 38:26]
    node _T_6 = eq(io_opcode, UInt<7>("h67")) @[TypeControl.scala 40:26]
    node _T_7 = eq(io_opcode, UInt<6>("h37")) @[TypeControl.scala 42:26]
    node _GEN_0 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[TypeControl.scala 42:38 TypeControl.scala 43:16 TypeControl.scala 26:12]
    node _GEN_1 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[TypeControl.scala 40:38 TypeControl.scala 41:17 TypeControl.scala 25:13]
    node _GEN_2 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[TypeControl.scala 40:38 TypeControl.scala 26:12]
    node _GEN_3 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[TypeControl.scala 38:38 TypeControl.scala 39:16 TypeControl.scala 24:12]
    node _GEN_4 = mux(_T_5, UInt<1>("h0"), _GEN_1) @[TypeControl.scala 38:38 TypeControl.scala 25:13]
    node _GEN_5 = mux(_T_5, UInt<1>("h0"), _GEN_2) @[TypeControl.scala 38:38 TypeControl.scala 26:12]
    node _GEN_6 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[TypeControl.scala 36:38 TypeControl.scala 37:17 TypeControl.scala 22:13]
    node _GEN_7 = mux(_T_4, UInt<1>("h0"), _GEN_3) @[TypeControl.scala 36:38 TypeControl.scala 24:12]
    node _GEN_8 = mux(_T_4, UInt<1>("h0"), _GEN_4) @[TypeControl.scala 36:38 TypeControl.scala 25:13]
    node _GEN_9 = mux(_T_4, UInt<1>("h0"), _GEN_5) @[TypeControl.scala 36:38 TypeControl.scala 26:12]
    node _GEN_10 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[TypeControl.scala 34:38 TypeControl.scala 35:19 TypeControl.scala 23:15]
    node _GEN_11 = mux(_T_3, UInt<1>("h0"), _GEN_6) @[TypeControl.scala 34:38 TypeControl.scala 22:13]
    node _GEN_12 = mux(_T_3, UInt<1>("h0"), _GEN_7) @[TypeControl.scala 34:38 TypeControl.scala 24:12]
    node _GEN_13 = mux(_T_3, UInt<1>("h0"), _GEN_8) @[TypeControl.scala 34:38 TypeControl.scala 25:13]
    node _GEN_14 = mux(_T_3, UInt<1>("h0"), _GEN_9) @[TypeControl.scala 34:38 TypeControl.scala 26:12]
    node _GEN_15 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[TypeControl.scala 32:38 TypeControl.scala 33:18 TypeControl.scala 21:14]
    node _GEN_16 = mux(_T_2, UInt<1>("h0"), _GEN_10) @[TypeControl.scala 32:38 TypeControl.scala 23:15]
    node _GEN_17 = mux(_T_2, UInt<1>("h0"), _GEN_11) @[TypeControl.scala 32:38 TypeControl.scala 22:13]
    node _GEN_18 = mux(_T_2, UInt<1>("h0"), _GEN_12) @[TypeControl.scala 32:38 TypeControl.scala 24:12]
    node _GEN_19 = mux(_T_2, UInt<1>("h0"), _GEN_13) @[TypeControl.scala 32:38 TypeControl.scala 25:13]
    node _GEN_20 = mux(_T_2, UInt<1>("h0"), _GEN_14) @[TypeControl.scala 32:38 TypeControl.scala 26:12]
    node _GEN_21 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[TypeControl.scala 30:38 TypeControl.scala 31:19 TypeControl.scala 19:15]
    node _GEN_22 = mux(_T_1, UInt<1>("h0"), _GEN_15) @[TypeControl.scala 30:38 TypeControl.scala 21:14]
    node _GEN_23 = mux(_T_1, UInt<1>("h0"), _GEN_16) @[TypeControl.scala 30:38 TypeControl.scala 23:15]
    node _GEN_24 = mux(_T_1, UInt<1>("h0"), _GEN_17) @[TypeControl.scala 30:38 TypeControl.scala 22:13]
    node _GEN_25 = mux(_T_1, UInt<1>("h0"), _GEN_18) @[TypeControl.scala 30:38 TypeControl.scala 24:12]
    node _GEN_26 = mux(_T_1, UInt<1>("h0"), _GEN_19) @[TypeControl.scala 30:38 TypeControl.scala 25:13]
    node _GEN_27 = mux(_T_1, UInt<1>("h0"), _GEN_20) @[TypeControl.scala 30:38 TypeControl.scala 26:12]
    node _GEN_28 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[TypeControl.scala 28:32 TypeControl.scala 29:20 TypeControl.scala 20:15]
    node _GEN_29 = mux(_T, UInt<1>("h0"), _GEN_21) @[TypeControl.scala 28:32 TypeControl.scala 19:15]
    node _GEN_30 = mux(_T, UInt<1>("h0"), _GEN_22) @[TypeControl.scala 28:32 TypeControl.scala 21:14]
    node _GEN_31 = mux(_T, UInt<1>("h0"), _GEN_23) @[TypeControl.scala 28:32 TypeControl.scala 23:15]
    node _GEN_32 = mux(_T, UInt<1>("h0"), _GEN_24) @[TypeControl.scala 28:32 TypeControl.scala 22:13]
    node _GEN_33 = mux(_T, UInt<1>("h0"), _GEN_25) @[TypeControl.scala 28:32 TypeControl.scala 24:12]
    node _GEN_34 = mux(_T, UInt<1>("h0"), _GEN_26) @[TypeControl.scala 28:32 TypeControl.scala 25:13]
    node _GEN_35 = mux(_T, UInt<1>("h0"), _GEN_27) @[TypeControl.scala 28:32 TypeControl.scala 26:12]
    io_R_Type <= _GEN_29
    io_I_Type <= _GEN_28
    io_Store <= _GEN_30
    io_Load <= _GEN_32
    io_Branch <= _GEN_31
    io_Jal <= _GEN_33
    io_Jalr <= _GEN_34
    io_LUI <= _GEN_35

  module OperandA_sel :
    input clock : Clock
    input reset : UInt<1>
    input io_LUI : UInt<1>
    input io_Jal : UInt<1>
    input io_Jalr : UInt<1>
    output io_and0 : UInt<1>
    output io_and1 : UInt<1>
    output io_and2 : UInt<1>
    output io_and3 : UInt<1>
    output io_or : UInt<1>
    output io_oper_A : UInt<2>

    node _io_and0_T = eq(io_LUI, UInt<1>("h0")) @[OperandA_sel.scala 20:16]
    node _io_and0_T_1 = and(_io_and0_T, io_Jal) @[OperandA_sel.scala 20:24]
    node _io_and0_T_2 = eq(io_Jalr, UInt<1>("h0")) @[OperandA_sel.scala 20:37]
    node _io_and0_T_3 = and(_io_and0_T_1, _io_and0_T_2) @[OperandA_sel.scala 20:34]
    node _io_and1_T = eq(io_LUI, UInt<1>("h0")) @[OperandA_sel.scala 21:16]
    node _io_and1_T_1 = and(_io_and1_T, io_Jalr) @[OperandA_sel.scala 21:24]
    node _io_and1_T_2 = eq(io_Jal, UInt<1>("h0")) @[OperandA_sel.scala 21:38]
    node _io_and1_T_3 = and(_io_and1_T_1, _io_and1_T_2) @[OperandA_sel.scala 21:35]
    node _io_and2_T = eq(io_Jal, UInt<1>("h0")) @[OperandA_sel.scala 22:26]
    node _io_and2_T_1 = and(io_LUI, _io_and2_T) @[OperandA_sel.scala 22:23]
    node _io_and2_T_2 = eq(io_Jalr, UInt<1>("h0")) @[OperandA_sel.scala 22:37]
    node _io_and2_T_3 = and(_io_and2_T_1, _io_and2_T_2) @[OperandA_sel.scala 22:34]
    node _io_and3_T = eq(io_LUI, UInt<1>("h0")) @[OperandA_sel.scala 23:16]
    node _io_and3_T_1 = eq(io_Jal, UInt<1>("h0")) @[OperandA_sel.scala 23:27]
    node _io_and3_T_2 = and(_io_and3_T, _io_and3_T_1) @[OperandA_sel.scala 23:24]
    node _io_and3_T_3 = eq(io_Jalr, UInt<1>("h0")) @[OperandA_sel.scala 23:38]
    node _io_and3_T_4 = and(_io_and3_T_2, _io_and3_T_3) @[OperandA_sel.scala 23:35]
    node _io_or_T = or(io_and0, io_and1) @[OperandA_sel.scala 25:22]
    node _io_or_T_1 = or(_io_or_T, io_and2) @[OperandA_sel.scala 25:32]
    node _io_oper_A_T = cat(io_or, io_and3) @[Cat.scala 30:58]
    io_and0 <= _io_and0_T_3 @[OperandA_sel.scala 20:13]
    io_and1 <= _io_and1_T_3 @[OperandA_sel.scala 21:13]
    io_and2 <= _io_and2_T_3 @[OperandA_sel.scala 22:13]
    io_and3 <= _io_and3_T_4 @[OperandA_sel.scala 23:13]
    io_or <= _io_or_T_1 @[OperandA_sel.scala 25:11]
    io_oper_A <= _io_oper_A_T @[OperandA_sel.scala 29:15]

  module NextPc :
    input clock : Clock
    input reset : UInt<1>
    input io_Branch : UInt<1>
    input io_Jal : UInt<1>
    input io_Jalr : UInt<1>
    output io_next_Pc : UInt<2>

    node _T = or(io_Branch, io_Jalr) @[NextPc.scala 23:20]
    node _GEN_0 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[NextPc.scala 23:32 NextPc.scala 24:20 NextPc.scala 20:16]
    node _GEN_1 = mux(io_Jal, UInt<2>("h3"), _GEN_0) @[NextPc.scala 28:18 NextPc.scala 29:20]
    io_next_Pc <= _GEN_1

  module AluOpController :
    input clock : Clock
    input reset : UInt<1>
    input io_RType : UInt<1>
    input io_IType : UInt<1>
    input io_branch : UInt<1>
    input io_load : UInt<1>
    input io_store : UInt<1>
    input io_jal : UInt<1>
    input io_jalr : UInt<1>
    input io_LUI : UInt<1>
    output io_and5 : UInt<1>
    output io_and4 : UInt<1>
    output io_and1 : UInt<1>
    output io_aluopt : UInt<3>

    node _io_and5_T = eq(io_RType, UInt<1>("h0")) @[AluOpController.scala 26:16]
    node _io_and5_T_1 = eq(io_branch, UInt<1>("h0")) @[AluOpController.scala 27:16]
    node _io_and5_T_2 = and(_io_and5_T, _io_and5_T_1) @[AluOpController.scala 26:26]
    node _io_and5_T_3 = eq(io_IType, UInt<1>("h0")) @[AluOpController.scala 28:16]
    node _io_and5_T_4 = and(_io_and5_T_2, _io_and5_T_3) @[AluOpController.scala 27:27]
    node _io_and5_T_5 = eq(io_jalr, UInt<1>("h0")) @[AluOpController.scala 29:16]
    node _io_and5_T_6 = and(_io_and5_T_4, _io_and5_T_5) @[AluOpController.scala 28:26]
    node _io_and5_T_7 = eq(io_jal, UInt<1>("h0")) @[AluOpController.scala 30:16]
    node _io_and5_T_8 = and(_io_and5_T_6, _io_and5_T_7) @[AluOpController.scala 29:25]
    node _io_and4_T = eq(io_RType, UInt<1>("h0")) @[AluOpController.scala 32:16]
    node _io_and4_T_1 = eq(io_load, UInt<1>("h0")) @[AluOpController.scala 33:16]
    node _io_and4_T_2 = and(_io_and4_T, _io_and4_T_1) @[AluOpController.scala 32:26]
    node _io_and4_T_3 = eq(io_store, UInt<1>("h0")) @[AluOpController.scala 34:16]
    node _io_and4_T_4 = and(_io_and4_T_2, _io_and4_T_3) @[AluOpController.scala 33:25]
    node _io_and4_T_5 = eq(io_IType, UInt<1>("h0")) @[AluOpController.scala 35:16]
    node _io_and4_T_6 = and(_io_and4_T_4, _io_and4_T_5) @[AluOpController.scala 34:26]
    node _io_and1_T = eq(io_RType, UInt<1>("h0")) @[AluOpController.scala 37:16]
    node _io_and1_T_1 = eq(io_load, UInt<1>("h0")) @[AluOpController.scala 38:16]
    node _io_and1_T_2 = and(_io_and1_T, _io_and1_T_1) @[AluOpController.scala 37:26]
    node _io_and1_T_3 = eq(io_branch, UInt<1>("h0")) @[AluOpController.scala 39:16]
    node _io_and1_T_4 = and(_io_and1_T_2, _io_and1_T_3) @[AluOpController.scala 38:25]
    node _io_and1_T_5 = eq(io_LUI, UInt<1>("h0")) @[AluOpController.scala 40:16]
    node _io_and1_T_6 = and(_io_and1_T_4, _io_and1_T_5) @[AluOpController.scala 39:27]
    node io_aluopt_hi = cat(io_and5, io_and4) @[Cat.scala 30:58]
    node _io_aluopt_T = cat(io_aluopt_hi, io_and1) @[Cat.scala 30:58]
    io_and5 <= _io_and5_T_8 @[AluOpController.scala 26:13]
    io_and4 <= _io_and4_T_6 @[AluOpController.scala 32:13]
    io_and1 <= _io_and1_T_6 @[AluOpController.scala 37:13]
    io_aluopt <= _io_aluopt_T @[AluOpController.scala 42:15]

  module SignalControl :
    input clock : Clock
    input reset : UInt<1>
    input io_R_Type : UInt<1>
    input io_Load : UInt<1>
    input io_Store : UInt<1>
    input io_Branch : UInt<1>
    input io_I_Type : UInt<1>
    input io_Jalr : UInt<1>
    input io_Jal : UInt<1>
    input io_LUI : UInt<1>
    output io_mem_write : UInt<1>
    output io_branch : UInt<1>
    output io_mem_read : UInt<1>
    output io_RegWrite : UInt<1>
    output io_mem_to_Reg : UInt<1>
    output io_ALU_operation : UInt<3>
    output io_operand_A_sel : UInt<2>
    output io_operand_B_sel : UInt<1>
    output io_extend_sel : UInt<2>
    output io_next_pc_sel : UInt<2>

    inst op_A of OperandA_sel @[SignalControl.scala 39:22]
    inst next of NextPc @[SignalControl.scala 48:24]
    inst alOp of AluOpController @[SignalControl.scala 56:22]
    node _io_extend_sel_T = cat(io_Store, io_Load) @[Cat.scala 30:58]
    node _GEN_0 = mux(io_Load, UInt<1>("h1"), UInt<1>("h0")) @[SignalControl.scala 94:19 SignalControl.scala 96:21 SignalControl.scala 71:17]
    node _GEN_1 = mux(io_Store, UInt<1>("h1"), UInt<1>("h0")) @[SignalControl.scala 105:20 SignalControl.scala 107:22 SignalControl.scala 69:18]
    node _GEN_2 = mux(io_Store, UInt<1>("h0"), _GEN_0) @[SignalControl.scala 105:20 SignalControl.scala 109:26]
    node _GEN_3 = mux(io_R_Type, UInt<1>("h1"), _GEN_0) @[SignalControl.scala 114:21 SignalControl.scala 116:21]
    node _GEN_4 = mux(io_I_Type, UInt<1>("h1"), _GEN_3) @[SignalControl.scala 121:21 SignalControl.scala 123:21]
    node _GEN_5 = mux(io_I_Type, UInt<1>("h1"), _GEN_2) @[SignalControl.scala 121:21 SignalControl.scala 124:26]
    node _GEN_6 = mux(io_Branch, UInt<1>("h1"), UInt<1>("h0")) @[SignalControl.scala 129:21 SignalControl.scala 131:19 SignalControl.scala 70:15]
    node _GEN_7 = mux(io_Jal, UInt<1>("h1"), _GEN_4) @[SignalControl.scala 136:18 SignalControl.scala 138:21]
    node _GEN_8 = mux(io_Jalr, UInt<1>("h1"), _GEN_7) @[SignalControl.scala 143:19 SignalControl.scala 145:21]
    node _GEN_9 = mux(io_LUI, UInt<1>("h1"), _GEN_8) @[SignalControl.scala 150:18 SignalControl.scala 152:21]
    node _GEN_10 = mux(io_LUI, UInt<1>("h1"), _GEN_5) @[SignalControl.scala 150:18 SignalControl.scala 153:26]
    io_mem_write <= _GEN_1
    io_branch <= _GEN_6
    io_mem_read <= _GEN_0
    io_RegWrite <= _GEN_9
    io_mem_to_Reg <= _GEN_0
    io_ALU_operation <= alOp.io_aluopt @[SignalControl.scala 75:22]
    io_operand_A_sel <= op_A.io_oper_A @[SignalControl.scala 45:22]
    io_operand_B_sel <= _GEN_10
    io_extend_sel <= _io_extend_sel_T @[SignalControl.scala 88:19]
    io_next_pc_sel <= next.io_next_Pc @[SignalControl.scala 52:20]
    op_A.clock <= clock
    op_A.reset <= reset
    op_A.io_LUI <= io_LUI @[SignalControl.scala 41:18]
    op_A.io_Jal <= io_Jal @[SignalControl.scala 42:18]
    op_A.io_Jalr <= io_Jalr @[SignalControl.scala 43:18]
    next.clock <= clock
    next.reset <= reset
    next.io_Branch <= io_Branch @[SignalControl.scala 49:21]
    next.io_Jal <= io_Jal @[SignalControl.scala 50:18]
    next.io_Jalr <= io_Jalr @[SignalControl.scala 51:19]
    alOp.clock <= clock
    alOp.reset <= reset
    alOp.io_RType <= io_R_Type @[SignalControl.scala 58:20]
    alOp.io_IType <= io_I_Type @[SignalControl.scala 59:20]
    alOp.io_branch <= io_Branch @[SignalControl.scala 65:20]
    alOp.io_load <= io_Load @[SignalControl.scala 61:20]
    alOp.io_store <= io_Store @[SignalControl.scala 60:20]
    alOp.io_jal <= io_Jal @[SignalControl.scala 63:20]
    alOp.io_jalr <= io_Jalr @[SignalControl.scala 64:20]
    alOp.io_LUI <= io_LUI @[SignalControl.scala 62:20]

  module Controller :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_mem_write : UInt<1>
    output io_branch : UInt<1>
    output io_mem_read : UInt<1>
    output io_RegWrite : UInt<1>
    output io_mem_to_Reg : UInt<1>
    output io_ALU_operation : UInt<3>
    output io_operand_A_sel : UInt<2>
    output io_operand_B_sel : UInt<1>
    output io_extend_sel : UInt<2>
    output io_next_pc_sel : UInt<2>

    inst typeControl of TypeControl @[Controller.scala 32:29]
    inst signalControl of SignalControl @[Controller.scala 36:31]
    io_mem_write <= signalControl.io_mem_write @[Controller.scala 52:18]
    io_branch <= signalControl.io_branch @[Controller.scala 53:15]
    io_mem_read <= signalControl.io_mem_read @[Controller.scala 54:17]
    io_RegWrite <= signalControl.io_RegWrite @[Controller.scala 55:17]
    io_mem_to_Reg <= signalControl.io_mem_to_Reg @[Controller.scala 56:19]
    io_ALU_operation <= signalControl.io_ALU_operation @[Controller.scala 58:22]
    io_operand_A_sel <= signalControl.io_operand_A_sel @[Controller.scala 60:22]
    io_operand_B_sel <= signalControl.io_operand_B_sel @[Controller.scala 61:22]
    io_extend_sel <= signalControl.io_extend_sel @[Controller.scala 63:19]
    io_next_pc_sel <= signalControl.io_next_pc_sel @[Controller.scala 65:20]
    typeControl.clock <= clock
    typeControl.reset <= reset
    typeControl.io_opcode <= io_opcode @[Controller.scala 34:27]
    signalControl.clock <= clock
    signalControl.reset <= reset
    signalControl.io_R_Type <= typeControl.io_R_Type @[Controller.scala 41:29]
    signalControl.io_Load <= typeControl.io_Load @[Controller.scala 44:27]
    signalControl.io_Store <= typeControl.io_Store @[Controller.scala 43:28]
    signalControl.io_Branch <= typeControl.io_Branch @[Controller.scala 45:29]
    signalControl.io_I_Type <= typeControl.io_I_Type @[Controller.scala 42:29]
    signalControl.io_Jalr <= typeControl.io_Jalr @[Controller.scala 47:27]
    signalControl.io_Jal <= typeControl.io_Jal @[Controller.scala 46:26]
    signalControl.io_LUI <= typeControl.io_LUI @[Controller.scala 48:26]
