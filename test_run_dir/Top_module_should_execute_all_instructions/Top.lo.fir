circuit Top :
  module ProgramCounter :
    input clock : Clock
    input reset : UInt<1>
    input io_input : UInt<32>
    output io_pc : UInt<32>
    output io_pc4 : UInt<32>

    reg pcReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pcReg) @[ProgramCounter.scala 13:22]
    node _io_pc4_T = add(pcReg, UInt<3>("h4")) @[ProgramCounter.scala 16:19]
    node _io_pc4_T_1 = tail(_io_pc4_T, 1) @[ProgramCounter.scala 16:19]
    io_pc <= pcReg @[ProgramCounter.scala 15:10]
    io_pc4 <= _io_pc4_T_1 @[ProgramCounter.scala 16:10]
    pcReg <= mux(reset, UInt<32>("h0"), io_input) @[ProgramCounter.scala 13:22 ProgramCounter.scala 13:22 ProgramCounter.scala 18:9]

  module InstMem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<32>
    output io_inst : UInt<32>

    mem imem : @[InstMem.scala 20:17]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    node _io_inst_T = bits(io_addr, 11, 2) @[InstMem.scala 24:26]
    io_inst <= imem.io_inst_MPORT.data @[InstMem.scala 24:11]
    imem.io_inst_MPORT.addr <= _io_inst_T @[InstMem.scala 24:18]
    imem.io_inst_MPORT.en <= UInt<1>("h1") @[InstMem.scala 24:18]
    imem.io_inst_MPORT.clk <= clock @[InstMem.scala 24:18]

  module RegFile :
    input clock : Clock
    input reset : UInt<1>
    input io_raddr1 : UInt<5>
    input io_raddr2 : UInt<5>
    output io_rdata1 : SInt<32>
    output io_rdata2 : SInt<32>
    input io_wen : UInt<1>
    input io_waddr : UInt<5>
    input io_wdata : SInt<32>

    reg reg_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_0) @[RegFile.scala 25:20]
    reg reg_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_1) @[RegFile.scala 25:20]
    reg reg_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_2) @[RegFile.scala 25:20]
    reg reg_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_3) @[RegFile.scala 25:20]
    reg reg_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_4) @[RegFile.scala 25:20]
    reg reg_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_5) @[RegFile.scala 25:20]
    reg reg_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_6) @[RegFile.scala 25:20]
    reg reg_7 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_7) @[RegFile.scala 25:20]
    reg reg_8 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_8) @[RegFile.scala 25:20]
    reg reg_9 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_9) @[RegFile.scala 25:20]
    reg reg_10 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_10) @[RegFile.scala 25:20]
    reg reg_11 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_11) @[RegFile.scala 25:20]
    reg reg_12 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_12) @[RegFile.scala 25:20]
    reg reg_13 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_13) @[RegFile.scala 25:20]
    reg reg_14 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_14) @[RegFile.scala 25:20]
    reg reg_15 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_15) @[RegFile.scala 25:20]
    reg reg_16 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_16) @[RegFile.scala 25:20]
    reg reg_17 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_17) @[RegFile.scala 25:20]
    reg reg_18 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_18) @[RegFile.scala 25:20]
    reg reg_19 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_19) @[RegFile.scala 25:20]
    reg reg_20 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_20) @[RegFile.scala 25:20]
    reg reg_21 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_21) @[RegFile.scala 25:20]
    reg reg_22 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_22) @[RegFile.scala 25:20]
    reg reg_23 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_23) @[RegFile.scala 25:20]
    reg reg_24 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_24) @[RegFile.scala 25:20]
    reg reg_25 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_25) @[RegFile.scala 25:20]
    reg reg_26 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_26) @[RegFile.scala 25:20]
    reg reg_27 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_27) @[RegFile.scala 25:20]
    reg reg_28 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_28) @[RegFile.scala 25:20]
    reg reg_29 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_29) @[RegFile.scala 25:20]
    reg reg_30 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_30) @[RegFile.scala 25:20]
    reg reg_31 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_31) @[RegFile.scala 25:20]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_raddr1), reg_0) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_raddr1), reg_1, _GEN_0) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_raddr1), reg_2, _GEN_1) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_raddr1), reg_3, _GEN_2) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_raddr1), reg_4, _GEN_3) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_raddr1), reg_5, _GEN_4) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_raddr1), reg_6, _GEN_5) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_raddr1), reg_7, _GEN_6) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_raddr1), reg_8, _GEN_7) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_raddr1), reg_9, _GEN_8) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_raddr1), reg_10, _GEN_9) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_raddr1), reg_11, _GEN_10) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_raddr1), reg_12, _GEN_11) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_raddr1), reg_13, _GEN_12) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_raddr1), reg_14, _GEN_13) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_raddr1), reg_15, _GEN_14) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_raddr1), reg_16, _GEN_15) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_raddr1), reg_17, _GEN_16) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_raddr1), reg_18, _GEN_17) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_raddr1), reg_19, _GEN_18) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_raddr1), reg_20, _GEN_19) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_raddr1), reg_21, _GEN_20) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_raddr1), reg_22, _GEN_21) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_raddr1), reg_23, _GEN_22) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_raddr1), reg_24, _GEN_23) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_raddr1), reg_25, _GEN_24) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_raddr1), reg_26, _GEN_25) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_raddr1), reg_27, _GEN_26) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_raddr1), reg_28, _GEN_27) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_raddr1), reg_29, _GEN_28) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_raddr1), reg_30, _GEN_29) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_raddr1), reg_31, _GEN_30) @[RegFile.scala 28:13 RegFile.scala 28:13]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_raddr2), reg_0) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_raddr2), reg_1, _GEN_32) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_raddr2), reg_2, _GEN_33) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_raddr2), reg_3, _GEN_34) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_raddr2), reg_4, _GEN_35) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_raddr2), reg_5, _GEN_36) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_raddr2), reg_6, _GEN_37) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_raddr2), reg_7, _GEN_38) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_raddr2), reg_8, _GEN_39) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_raddr2), reg_9, _GEN_40) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_raddr2), reg_10, _GEN_41) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_raddr2), reg_11, _GEN_42) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_raddr2), reg_12, _GEN_43) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_raddr2), reg_13, _GEN_44) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_raddr2), reg_14, _GEN_45) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_raddr2), reg_15, _GEN_46) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_raddr2), reg_16, _GEN_47) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_raddr2), reg_17, _GEN_48) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_raddr2), reg_18, _GEN_49) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_raddr2), reg_19, _GEN_50) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_raddr2), reg_20, _GEN_51) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_raddr2), reg_21, _GEN_52) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_raddr2), reg_22, _GEN_53) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_raddr2), reg_23, _GEN_54) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_raddr2), reg_24, _GEN_55) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_raddr2), reg_25, _GEN_56) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_raddr2), reg_26, _GEN_57) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_raddr2), reg_27, _GEN_58) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_raddr2), reg_28, _GEN_59) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_raddr2), reg_29, _GEN_60) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_raddr2), reg_30, _GEN_61) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_raddr2), reg_31, _GEN_62) @[RegFile.scala 29:13 RegFile.scala 29:13]
    node _T = neq(io_waddr, UInt<1>("h0")) @[RegFile.scala 32:28]
    node _T_1 = and(io_wen, _T) @[RegFile.scala 32:16]
    node _reg_io_waddr = io_wdata @[RegFile.scala 33:19 RegFile.scala 33:19]
    node _GEN_64 = mux(eq(UInt<1>("h0"), io_waddr), _reg_io_waddr, reg_0) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_waddr), _reg_io_waddr, reg_1) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_waddr), _reg_io_waddr, reg_2) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_waddr), _reg_io_waddr, reg_3) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_waddr), _reg_io_waddr, reg_4) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_waddr), _reg_io_waddr, reg_5) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_waddr), _reg_io_waddr, reg_6) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_waddr), _reg_io_waddr, reg_7) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_waddr), _reg_io_waddr, reg_8) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_waddr), _reg_io_waddr, reg_9) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_waddr), _reg_io_waddr, reg_10) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_waddr), _reg_io_waddr, reg_11) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_waddr), _reg_io_waddr, reg_12) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_waddr), _reg_io_waddr, reg_13) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_waddr), _reg_io_waddr, reg_14) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_waddr), _reg_io_waddr, reg_15) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_waddr), _reg_io_waddr, reg_16) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_waddr), _reg_io_waddr, reg_17) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_waddr), _reg_io_waddr, reg_18) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_waddr), _reg_io_waddr, reg_19) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_waddr), _reg_io_waddr, reg_20) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_waddr), _reg_io_waddr, reg_21) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_waddr), _reg_io_waddr, reg_22) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_waddr), _reg_io_waddr, reg_23) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_waddr), _reg_io_waddr, reg_24) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_waddr), _reg_io_waddr, reg_25) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_waddr), _reg_io_waddr, reg_26) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_waddr), _reg_io_waddr, reg_27) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_waddr), _reg_io_waddr, reg_28) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_waddr), _reg_io_waddr, reg_29) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_waddr), _reg_io_waddr, reg_30) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_waddr), _reg_io_waddr, reg_31) @[RegFile.scala 33:19 RegFile.scala 33:19 RegFile.scala 25:20]
    node _GEN_96 = mux(_T_1, _GEN_64, reg_0) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_97 = mux(_T_1, _GEN_65, reg_1) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_98 = mux(_T_1, _GEN_66, reg_2) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_99 = mux(_T_1, _GEN_67, reg_3) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_100 = mux(_T_1, _GEN_68, reg_4) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_101 = mux(_T_1, _GEN_69, reg_5) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_102 = mux(_T_1, _GEN_70, reg_6) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_103 = mux(_T_1, _GEN_71, reg_7) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_104 = mux(_T_1, _GEN_72, reg_8) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_105 = mux(_T_1, _GEN_73, reg_9) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_106 = mux(_T_1, _GEN_74, reg_10) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_107 = mux(_T_1, _GEN_75, reg_11) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_108 = mux(_T_1, _GEN_76, reg_12) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_109 = mux(_T_1, _GEN_77, reg_13) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_110 = mux(_T_1, _GEN_78, reg_14) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_111 = mux(_T_1, _GEN_79, reg_15) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_112 = mux(_T_1, _GEN_80, reg_16) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_113 = mux(_T_1, _GEN_81, reg_17) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_114 = mux(_T_1, _GEN_82, reg_18) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_115 = mux(_T_1, _GEN_83, reg_19) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_116 = mux(_T_1, _GEN_84, reg_20) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_117 = mux(_T_1, _GEN_85, reg_21) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_118 = mux(_T_1, _GEN_86, reg_22) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_119 = mux(_T_1, _GEN_87, reg_23) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_120 = mux(_T_1, _GEN_88, reg_24) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_121 = mux(_T_1, _GEN_89, reg_25) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_122 = mux(_T_1, _GEN_90, reg_26) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_123 = mux(_T_1, _GEN_91, reg_27) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_124 = mux(_T_1, _GEN_92, reg_28) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_125 = mux(_T_1, _GEN_93, reg_29) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_126 = mux(_T_1, _GEN_94, reg_30) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _GEN_127 = mux(_T_1, _GEN_95, reg_31) @[RegFile.scala 32:37 RegFile.scala 25:20]
    node _reg_WIRE_0 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_1 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_2 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_3 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_4 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_5 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_6 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_7 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_8 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_9 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_10 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_11 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_12 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_13 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_14 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_15 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_16 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_17 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_18 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_19 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_20 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_21 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_22 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_23 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_24 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_25 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_26 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_27 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_28 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_29 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_30 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_WIRE_31 = asSInt(UInt<32>("h0")) @[RegFile.scala 25:28 RegFile.scala 25:28]
    node _reg_io_raddr1 = _GEN_31 @[RegFile.scala 28:13]
    node _reg_io_raddr2 = _GEN_63 @[RegFile.scala 29:13]
    io_rdata1 <= _reg_io_raddr1 @[RegFile.scala 28:13]
    io_rdata2 <= _reg_io_raddr2 @[RegFile.scala 29:13]
    reg_0 <= mux(reset, _reg_WIRE_0, asSInt(UInt<1>("h0"))) @[RegFile.scala 25:20 RegFile.scala 25:20 RegFile.scala 37:10]
    reg_1 <= mux(reset, _reg_WIRE_1, _GEN_97) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_2 <= mux(reset, _reg_WIRE_2, _GEN_98) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_3 <= mux(reset, _reg_WIRE_3, _GEN_99) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_4 <= mux(reset, _reg_WIRE_4, _GEN_100) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_5 <= mux(reset, _reg_WIRE_5, _GEN_101) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_6 <= mux(reset, _reg_WIRE_6, _GEN_102) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_7 <= mux(reset, _reg_WIRE_7, _GEN_103) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_8 <= mux(reset, _reg_WIRE_8, _GEN_104) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_9 <= mux(reset, _reg_WIRE_9, _GEN_105) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_10 <= mux(reset, _reg_WIRE_10, _GEN_106) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_11 <= mux(reset, _reg_WIRE_11, _GEN_107) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_12 <= mux(reset, _reg_WIRE_12, _GEN_108) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_13 <= mux(reset, _reg_WIRE_13, _GEN_109) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_14 <= mux(reset, _reg_WIRE_14, _GEN_110) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_15 <= mux(reset, _reg_WIRE_15, _GEN_111) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_16 <= mux(reset, _reg_WIRE_16, _GEN_112) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_17 <= mux(reset, _reg_WIRE_17, _GEN_113) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_18 <= mux(reset, _reg_WIRE_18, _GEN_114) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_19 <= mux(reset, _reg_WIRE_19, _GEN_115) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_20 <= mux(reset, _reg_WIRE_20, _GEN_116) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_21 <= mux(reset, _reg_WIRE_21, _GEN_117) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_22 <= mux(reset, _reg_WIRE_22, _GEN_118) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_23 <= mux(reset, _reg_WIRE_23, _GEN_119) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_24 <= mux(reset, _reg_WIRE_24, _GEN_120) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_25 <= mux(reset, _reg_WIRE_25, _GEN_121) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_26 <= mux(reset, _reg_WIRE_26, _GEN_122) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_27 <= mux(reset, _reg_WIRE_27, _GEN_123) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_28 <= mux(reset, _reg_WIRE_28, _GEN_124) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_29 <= mux(reset, _reg_WIRE_29, _GEN_125) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_30 <= mux(reset, _reg_WIRE_30, _GEN_126) @[RegFile.scala 25:20 RegFile.scala 25:20]
    reg_31 <= mux(reset, _reg_WIRE_31, _GEN_127) @[RegFile.scala 25:20 RegFile.scala 25:20]

  module Imm_gen :
    input clock : Clock
    input reset : UInt<1>
    input io_instruction : UInt<32>
    output io_imm : UInt<32>

    node _T = bits(io_instruction, 6, 0) @[Imm_gen.scala 17:24]
    node _T_1 = eq(UInt<5>("h13"), _T) @[Conditional.scala 37:30]
    node _io_imm_T = bits(io_instruction, 31, 31) @[Imm_gen.scala 22:32]
    node _io_imm_T_1 = bits(_io_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi = mux(_io_imm_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_imm_lo = bits(io_instruction, 31, 20) @[Imm_gen.scala 23:23]
    node _io_imm_T_2 = cat(io_imm_hi, io_imm_lo) @[Cat.scala 30:58]
    node _T_2 = eq(UInt<2>("h3"), _T) @[Conditional.scala 37:30]
    node _io_imm_T_3 = bits(io_instruction, 31, 31) @[Imm_gen.scala 30:32]
    node _io_imm_T_4 = bits(_io_imm_T_3, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_1 = mux(_io_imm_T_4, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_imm_lo_1 = bits(io_instruction, 31, 20) @[Imm_gen.scala 31:23]
    node _io_imm_T_5 = cat(io_imm_hi_1, io_imm_lo_1) @[Cat.scala 30:58]
    node _T_3 = eq(UInt<7>("h67"), _T) @[Conditional.scala 37:30]
    node _io_imm_T_6 = bits(io_instruction, 31, 31) @[Imm_gen.scala 38:32]
    node _io_imm_T_7 = bits(_io_imm_T_6, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_2 = mux(_io_imm_T_7, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_imm_lo_2 = bits(io_instruction, 31, 20) @[Imm_gen.scala 39:23]
    node _io_imm_T_8 = cat(io_imm_hi_2, io_imm_lo_2) @[Cat.scala 30:58]
    node _T_4 = eq(UInt<6>("h23"), _T) @[Conditional.scala 37:30]
    node _io_imm_T_9 = bits(io_instruction, 31, 31) @[Imm_gen.scala 46:32]
    node _io_imm_T_10 = bits(_io_imm_T_9, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_hi = mux(_io_imm_T_10, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_imm_hi_lo = bits(io_instruction, 31, 25) @[Imm_gen.scala 47:23]
    node io_imm_lo_3 = bits(io_instruction, 11, 7) @[Imm_gen.scala 48:23]
    node io_imm_hi_3 = cat(io_imm_hi_hi, io_imm_hi_lo) @[Cat.scala 30:58]
    node _io_imm_T_11 = cat(io_imm_hi_3, io_imm_lo_3) @[Cat.scala 30:58]
    node _T_5 = eq(UInt<7>("h63"), _T) @[Conditional.scala 37:30]
    node _io_imm_T_12 = bits(io_instruction, 31, 31) @[Imm_gen.scala 55:32]
    node _io_imm_T_13 = bits(_io_imm_T_12, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_hi_hi = mux(_io_imm_T_13, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_imm_hi_hi_lo = bits(io_instruction, 31, 31) @[Imm_gen.scala 56:23]
    node io_imm_hi_lo_1 = bits(io_instruction, 7, 7) @[Imm_gen.scala 57:23]
    node io_imm_lo_hi_hi = bits(io_instruction, 30, 25) @[Imm_gen.scala 58:23]
    node io_imm_lo_hi_lo = bits(io_instruction, 11, 8) @[Imm_gen.scala 59:23]
    node io_imm_lo_hi = cat(io_imm_lo_hi_hi, io_imm_lo_hi_lo) @[Cat.scala 30:58]
    node io_imm_lo_4 = cat(io_imm_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_imm_hi_hi_1 = cat(io_imm_hi_hi_hi, io_imm_hi_hi_lo) @[Cat.scala 30:58]
    node io_imm_hi_4 = cat(io_imm_hi_hi_1, io_imm_hi_lo_1) @[Cat.scala 30:58]
    node _io_imm_T_14 = cat(io_imm_hi_4, io_imm_lo_4) @[Cat.scala 30:58]
    node _T_6 = eq(UInt<6>("h37"), _T) @[Conditional.scala 37:30]
    node io_imm_hi_5 = bits(io_instruction, 31, 12) @[Imm_gen.scala 67:23]
    node _io_imm_T_15 = cat(io_imm_hi_5, UInt<12>("h0")) @[Cat.scala 30:58]
    node _T_7 = eq(UInt<5>("h17"), _T) @[Conditional.scala 37:30]
    node io_imm_hi_6 = bits(io_instruction, 31, 12) @[Imm_gen.scala 75:23]
    node _io_imm_T_16 = cat(io_imm_hi_6, UInt<12>("h0")) @[Cat.scala 30:58]
    node _T_8 = eq(UInt<7>("h6f"), _T) @[Conditional.scala 37:30]
    node _io_imm_T_17 = bits(io_instruction, 31, 31) @[Imm_gen.scala 83:32]
    node _io_imm_T_18 = bits(_io_imm_T_17, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_hi_hi_1 = mux(_io_imm_T_18, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_imm_hi_hi_lo_1 = bits(io_instruction, 31, 31) @[Imm_gen.scala 84:23]
    node io_imm_hi_lo_2 = bits(io_instruction, 19, 12) @[Imm_gen.scala 85:23]
    node io_imm_lo_hi_hi_1 = bits(io_instruction, 20, 20) @[Imm_gen.scala 86:23]
    node io_imm_lo_hi_lo_1 = bits(io_instruction, 30, 21) @[Imm_gen.scala 87:23]
    node io_imm_lo_hi_1 = cat(io_imm_lo_hi_hi_1, io_imm_lo_hi_lo_1) @[Cat.scala 30:58]
    node io_imm_lo_5 = cat(io_imm_lo_hi_1, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_imm_hi_hi_2 = cat(io_imm_hi_hi_hi_1, io_imm_hi_hi_lo_1) @[Cat.scala 30:58]
    node io_imm_hi_7 = cat(io_imm_hi_hi_2, io_imm_hi_lo_2) @[Cat.scala 30:58]
    node _io_imm_T_19 = cat(io_imm_hi_7, io_imm_lo_5) @[Cat.scala 30:58]
    node _GEN_0 = mux(_T_8, _io_imm_T_19, UInt<1>("h0")) @[Conditional.scala 39:67 Imm_gen.scala 82:14 Imm_gen.scala 15:10]
    node _GEN_1 = mux(_T_7, _io_imm_T_16, _GEN_0) @[Conditional.scala 39:67 Imm_gen.scala 74:14]
    node _GEN_2 = mux(_T_6, _io_imm_T_15, _GEN_1) @[Conditional.scala 39:67 Imm_gen.scala 66:14]
    node _GEN_3 = mux(_T_5, _io_imm_T_14, _GEN_2) @[Conditional.scala 39:67 Imm_gen.scala 54:14]
    node _GEN_4 = mux(_T_4, _io_imm_T_11, _GEN_3) @[Conditional.scala 39:67 Imm_gen.scala 45:14]
    node _GEN_5 = mux(_T_3, _io_imm_T_8, _GEN_4) @[Conditional.scala 39:67 Imm_gen.scala 37:14]
    node _GEN_6 = mux(_T_2, _io_imm_T_5, _GEN_5) @[Conditional.scala 39:67 Imm_gen.scala 29:14]
    node _GEN_7 = mux(_T_1, _io_imm_T_2, _GEN_6) @[Conditional.scala 40:58 Imm_gen.scala 21:14]
    io_imm <= _GEN_7

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

    inst op_A of OperandA_sel @[SignalControl.scala 37:20]
    inst next of NextPc @[SignalControl.scala 44:20]
    inst alOp of AluOpController @[SignalControl.scala 51:20]
    node _io_extend_sel_T = cat(io_Store, io_Load) @[Cat.scala 30:58]
    node _GEN_0 = mux(io_Load, UInt<1>("h1"), UInt<1>("h0")) @[SignalControl.scala 72:17 SignalControl.scala 73:22 SignalControl.scala 64:20]
    node _GEN_1 = mux(io_Store, UInt<1>("h1"), UInt<1>("h0")) @[SignalControl.scala 80:18 SignalControl.scala 81:22 SignalControl.scala 62:20]
    node _GEN_2 = mux(io_Store, UInt<1>("h1"), _GEN_0) @[SignalControl.scala 80:18 SignalControl.scala 82:22]
    node _GEN_3 = mux(io_R_Type, UInt<1>("h1"), _GEN_0) @[SignalControl.scala 86:19 SignalControl.scala 87:17]
    node _GEN_4 = mux(io_I_Type, UInt<1>("h1"), _GEN_3) @[SignalControl.scala 91:19 SignalControl.scala 92:22]
    node _GEN_5 = mux(io_I_Type, UInt<1>("h1"), _GEN_2) @[SignalControl.scala 91:19 SignalControl.scala 93:22]
    node _GEN_6 = mux(io_Branch, UInt<1>("h1"), UInt<1>("h0")) @[SignalControl.scala 97:19 SignalControl.scala 98:15 SignalControl.scala 63:20]
    node _GEN_7 = mux(io_Jal, UInt<1>("h1"), _GEN_4) @[SignalControl.scala 102:16 SignalControl.scala 103:17]
    node _GEN_8 = mux(io_Jalr, UInt<1>("h1"), _GEN_7) @[SignalControl.scala 105:17 SignalControl.scala 106:17]
    node _GEN_9 = mux(io_LUI, UInt<1>("h1"), _GEN_8) @[SignalControl.scala 110:16 SignalControl.scala 111:22]
    node _GEN_10 = mux(io_LUI, UInt<1>("h1"), _GEN_5) @[SignalControl.scala 110:16 SignalControl.scala 112:22]
    io_mem_write <= _GEN_1
    io_branch <= _GEN_6
    io_mem_read <= _GEN_0
    io_RegWrite <= _GEN_9
    io_mem_to_Reg <= _GEN_0
    io_ALU_operation <= alOp.io_aluopt @[SignalControl.scala 67:20]
    io_operand_A_sel <= op_A.io_oper_A @[SignalControl.scala 41:20]
    io_operand_B_sel <= _GEN_10
    io_extend_sel <= _io_extend_sel_T @[SignalControl.scala 69:20]
    io_next_pc_sel <= next.io_next_Pc @[SignalControl.scala 48:18]
    op_A.clock <= clock
    op_A.reset <= reset
    op_A.io_LUI <= io_LUI @[SignalControl.scala 38:16]
    op_A.io_Jal <= io_Jal @[SignalControl.scala 39:16]
    op_A.io_Jalr <= io_Jalr @[SignalControl.scala 40:16]
    next.clock <= clock
    next.reset <= reset
    next.io_Branch <= io_Branch @[SignalControl.scala 45:18]
    next.io_Jal <= io_Jal @[SignalControl.scala 46:18]
    next.io_Jalr <= io_Jalr @[SignalControl.scala 47:18]
    alOp.clock <= clock
    alOp.reset <= reset
    alOp.io_RType <= io_R_Type @[SignalControl.scala 52:18]
    alOp.io_IType <= io_I_Type @[SignalControl.scala 53:18]
    alOp.io_branch <= io_Branch @[SignalControl.scala 59:18]
    alOp.io_load <= io_Load @[SignalControl.scala 55:18]
    alOp.io_store <= io_Store @[SignalControl.scala 54:18]
    alOp.io_jal <= io_Jal @[SignalControl.scala 57:18]
    alOp.io_jalr <= io_Jalr @[SignalControl.scala 58:18]
    alOp.io_LUI <= io_LUI @[SignalControl.scala 56:18]

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

  module ALUControl :
    input clock : Clock
    input reset : UInt<1>
    input io_aluOp : UInt<3>
    input io_funct3 : UInt<3>
    input io_funct7 : UInt<1>
    output io_aluCtrl : UInt<5>

    node isR = eq(io_aluOp, UInt<1>("h0")) @[ALUControl.scala 18:23]
    node isI = eq(io_aluOp, UInt<1>("h1")) @[ALUControl.scala 19:23]
    node isBr = eq(io_aluOp, UInt<2>("h2")) @[ALUControl.scala 20:23]
    node _f7_T = eq(io_funct3, UInt<3>("h5")) @[ALUControl.scala 25:33]
    node _f7_T_1 = and(isI, _f7_T) @[ALUControl.scala 25:20]
    node _f7_T_2 = mux(_f7_T_1, io_funct7, UInt<1>("h0")) @[ALUControl.scala 25:15]
    node f7 = mux(isR, io_funct7, _f7_T_2) @[ALUControl.scala 24:15]
    node _io_aluCtrl_T = or(isR, isI) @[ALUControl.scala 30:12]
    node io_aluCtrl_hi = cat(UInt<1>("h0"), f7) @[Cat.scala 30:58]
    node _io_aluCtrl_T_1 = cat(io_aluCtrl_hi, io_funct3) @[Cat.scala 30:58]
    node _io_aluCtrl_T_2 = cat(UInt<2>("h1"), io_funct3) @[Cat.scala 30:58]
    node _io_aluCtrl_T_3 = mux(isBr, _io_aluCtrl_T_2, UInt<5>("h0")) @[Mux.scala 98:16]
    node _io_aluCtrl_T_4 = mux(_io_aluCtrl_T, _io_aluCtrl_T_1, _io_aluCtrl_T_3) @[Mux.scala 98:16]
    io_aluCtrl <= _io_aluCtrl_T_4 @[ALUControl.scala 27:14]

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_in1 : SInt<32>
    input io_in2 : SInt<32>
    input io_aluControl : UInt<5>
    output io_out : SInt<32>
    output io_Branch : UInt<1>

    node aU = asUInt(io_in1) @[ALU.scala 27:14]
    node bU = asUInt(io_in2) @[ALU.scala 28:14]
    node shamt = bits(io_in2, 4, 0) @[ALU.scala 31:21]
    node _T = eq(UInt<1>("h0"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T = add(io_in1, io_in2) @[ALU.scala 38:34]
    node _io_out_T_1 = tail(_io_out_T, 1) @[ALU.scala 38:34]
    node _io_out_T_2 = asSInt(_io_out_T_1) @[ALU.scala 38:34]
    node _T_1 = eq(UInt<4>("h8"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T_3 = sub(io_in1, io_in2) @[ALU.scala 39:34]
    node _io_out_T_4 = tail(_io_out_T_3, 1) @[ALU.scala 39:34]
    node _io_out_T_5 = asSInt(_io_out_T_4) @[ALU.scala 39:34]
    node _T_2 = eq(UInt<1>("h1"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T_6 = dshl(aU, shamt) @[ALU.scala 40:36]
    node _io_out_T_7 = bits(_io_out_T_6, 31, 0) @[ALU.scala 40:45]
    node _io_out_T_8 = asSInt(_io_out_T_7) @[ALU.scala 40:53]
    node _T_3 = eq(UInt<2>("h2"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T_9 = lt(io_in1, io_in2) @[ALU.scala 41:38]
    node _io_out_T_10 = mux(_io_out_T_9, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[ALU.scala 41:35]
    node _T_4 = eq(UInt<2>("h3"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T_11 = lt(aU, bU) @[ALU.scala 42:39]
    node _io_out_T_12 = mux(_io_out_T_11, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[ALU.scala 42:35]
    node _T_5 = eq(UInt<3>("h4"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T_13 = xor(aU, bU) @[ALU.scala 43:36]
    node _io_out_T_14 = asSInt(_io_out_T_13) @[ALU.scala 43:42]
    node _T_6 = eq(UInt<3>("h5"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T_15 = dshr(aU, shamt) @[ALU.scala 44:36]
    node _io_out_T_16 = asSInt(_io_out_T_15) @[ALU.scala 44:46]
    node _T_7 = eq(UInt<4>("hd"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T_17 = dshr(io_in1, shamt) @[ALU.scala 45:35]
    node _T_8 = eq(UInt<3>("h6"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T_18 = or(aU, bU) @[ALU.scala 46:36]
    node _io_out_T_19 = asSInt(_io_out_T_18) @[ALU.scala 46:42]
    node _T_9 = eq(UInt<3>("h7"), io_aluControl) @[Conditional.scala 37:30]
    node _io_out_T_20 = and(aU, bU) @[ALU.scala 47:36]
    node _io_out_T_21 = asSInt(_io_out_T_20) @[ALU.scala 47:42]
    node _T_10 = eq(UInt<5>("h10"), io_aluControl) @[Conditional.scala 37:30]
    node _io_Branch_T = eq(io_in1, io_in2) @[ALU.scala 50:38]
    node _T_11 = eq(UInt<5>("h11"), io_aluControl) @[Conditional.scala 37:30]
    node _io_Branch_T_1 = neq(io_in1, io_in2) @[ALU.scala 51:38]
    node _T_12 = eq(UInt<5>("h14"), io_aluControl) @[Conditional.scala 37:30]
    node _io_Branch_T_2 = lt(io_in1, io_in2) @[ALU.scala 52:38]
    node _T_13 = eq(UInt<5>("h15"), io_aluControl) @[Conditional.scala 37:30]
    node _io_Branch_T_3 = geq(io_in1, io_in2) @[ALU.scala 53:38]
    node _T_14 = eq(UInt<5>("h16"), io_aluControl) @[Conditional.scala 37:30]
    node _io_Branch_T_4 = lt(aU, bU) @[ALU.scala 54:39]
    node _T_15 = eq(UInt<5>("h17"), io_aluControl) @[Conditional.scala 37:30]
    node _io_Branch_T_5 = geq(aU, bU) @[ALU.scala 55:39]
    node _GEN_0 = mux(_T_15, _io_Branch_T_5, UInt<1>("h0")) @[Conditional.scala 39:67 ALU.scala 55:32 ALU.scala 34:13]
    node _GEN_1 = mux(_T_14, _io_Branch_T_4, _GEN_0) @[Conditional.scala 39:67 ALU.scala 54:32]
    node _GEN_2 = mux(_T_13, _io_Branch_T_3, _GEN_1) @[Conditional.scala 39:67 ALU.scala 53:32]
    node _GEN_3 = mux(_T_12, _io_Branch_T_2, _GEN_2) @[Conditional.scala 39:67 ALU.scala 52:32]
    node _GEN_4 = mux(_T_11, _io_Branch_T_1, _GEN_3) @[Conditional.scala 39:67 ALU.scala 51:32]
    node _GEN_5 = mux(_T_10, _io_Branch_T, _GEN_4) @[Conditional.scala 39:67 ALU.scala 50:32]
    node _GEN_6 = mux(_T_9, _io_out_T_21, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 ALU.scala 47:29 ALU.scala 33:13]
    node _GEN_7 = mux(_T_9, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 ALU.scala 34:13]
    node _GEN_8 = mux(_T_8, _io_out_T_19, _GEN_6) @[Conditional.scala 39:67 ALU.scala 46:29]
    node _GEN_9 = mux(_T_8, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67 ALU.scala 34:13]
    node _GEN_10 = mux(_T_7, _io_out_T_17, _GEN_8) @[Conditional.scala 39:67 ALU.scala 45:29]
    node _GEN_11 = mux(_T_7, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 ALU.scala 34:13]
    node _GEN_12 = mux(_T_6, _io_out_T_16, _GEN_10) @[Conditional.scala 39:67 ALU.scala 44:29]
    node _GEN_13 = mux(_T_6, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67 ALU.scala 34:13]
    node _GEN_14 = mux(_T_5, _io_out_T_14, _GEN_12) @[Conditional.scala 39:67 ALU.scala 43:29]
    node _GEN_15 = mux(_T_5, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67 ALU.scala 34:13]
    node _GEN_16 = mux(_T_4, _io_out_T_12, _GEN_14) @[Conditional.scala 39:67 ALU.scala 42:29]
    node _GEN_17 = mux(_T_4, UInt<1>("h0"), _GEN_15) @[Conditional.scala 39:67 ALU.scala 34:13]
    node _GEN_18 = mux(_T_3, _io_out_T_10, _GEN_16) @[Conditional.scala 39:67 ALU.scala 41:29]
    node _GEN_19 = mux(_T_3, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 ALU.scala 34:13]
    node _GEN_20 = mux(_T_2, _io_out_T_8, _GEN_18) @[Conditional.scala 39:67 ALU.scala 40:29]
    node _GEN_21 = mux(_T_2, UInt<1>("h0"), _GEN_19) @[Conditional.scala 39:67 ALU.scala 34:13]
    node _GEN_22 = mux(_T_1, _io_out_T_5, _GEN_20) @[Conditional.scala 39:67 ALU.scala 39:29]
    node _GEN_23 = mux(_T_1, UInt<1>("h0"), _GEN_21) @[Conditional.scala 39:67 ALU.scala 34:13]
    node _GEN_24 = mux(_T, _io_out_T_2, _GEN_22) @[Conditional.scala 40:58 ALU.scala 38:29]
    node _GEN_25 = mux(_T, UInt<1>("h0"), _GEN_23) @[Conditional.scala 40:58 ALU.scala 34:13]
    io_out <= _GEN_24
    io_Branch <= _GEN_25

  module DataMem :
    input clock : Clock
    input reset : UInt<1>
    input io_data_in_0 : UInt<32>
    input io_data_in_1 : UInt<32>
    input io_data_in_2 : UInt<32>
    input io_data_in_3 : UInt<32>
    input io_data_selector : UInt<2>
    output io_data_out : UInt<32>
    input io_addr : UInt<8>
    input io_wr_en : UInt<1>

    mem memory : @[DataMem.scala 17:19]
      data-type => UInt<32>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_data_out_MPORT
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_data_selector), io_data_in_0) @[DataMem.scala 22:21 DataMem.scala 22:21]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_data_selector), io_data_in_1, _GEN_0) @[DataMem.scala 22:21 DataMem.scala 22:21]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_data_selector), io_data_in_2, _GEN_1) @[DataMem.scala 22:21 DataMem.scala 22:21]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_data_selector), io_data_in_3, _GEN_2) @[DataMem.scala 22:21 DataMem.scala 22:21]
    node _GEN_4 = validif(io_wr_en, io_addr) @[DataMem.scala 21:18 DataMem.scala 22:11]
    node _GEN_5 = validif(io_wr_en, clock) @[DataMem.scala 21:18 DataMem.scala 22:11]
    node _GEN_6 = mux(io_wr_en, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 21:18 DataMem.scala 22:11 DataMem.scala 17:19]
    node _GEN_7 = validif(io_wr_en, UInt<1>("h1")) @[DataMem.scala 21:18 DataMem.scala 22:21]
    node _io_data_in_io_data_selector = _GEN_3 @[DataMem.scala 22:21]
    node _GEN_8 = validif(io_wr_en, _io_data_in_io_data_selector) @[DataMem.scala 21:18 DataMem.scala 22:21]
    io_data_out <= memory.io_data_out_MPORT.data @[DataMem.scala 19:15]
    memory.io_data_out_MPORT.addr <= io_addr @[DataMem.scala 19:24]
    memory.io_data_out_MPORT.en <= UInt<1>("h1") @[DataMem.scala 19:24]
    memory.io_data_out_MPORT.clk <= clock @[DataMem.scala 19:24]
    memory.MPORT.addr <= _GEN_4
    memory.MPORT.en <= _GEN_6
    memory.MPORT.clk <= _GEN_5
    memory.MPORT.data <= _GEN_8
    memory.MPORT.mask <= _GEN_7

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io_Reg_Out : SInt<32>
    output io_PC_Out : UInt<32>
    output io_instruction : UInt<32>
    output io_aluResult : UInt<32>
    output io_writeBackData : SInt<32>

    inst Pc of ProgramCounter @[Top.scala 19:26]
    inst InsMem of InstMem @[Top.scala 20:26]
    inst Regfile of RegFile @[Top.scala 21:26]
    inst ImmGen of Imm_gen @[Top.scala 22:26]
    inst controller of Controller @[Top.scala 23:26]
    inst AluControl of ALUControl @[Top.scala 24:26]
    inst ALU of ALU @[Top.scala 25:26]
    inst DataMem of DataMem @[Top.scala 26:26]
    inst TypeDecode of TypeControl @[Top.scala 27:26]
    node opcode = bits(InsMem.io_inst, 6, 0) @[Top.scala 36:27]
    node rd = bits(InsMem.io_inst, 11, 7) @[Top.scala 37:27]
    node funct3 = bits(InsMem.io_inst, 14, 12) @[Top.scala 38:27]
    node rs1 = bits(InsMem.io_inst, 19, 15) @[Top.scala 39:27]
    node rs2 = bits(InsMem.io_inst, 24, 20) @[Top.scala 40:27]
    node aluOut = asUInt(ALU.io_out) @[Top.scala 46:32]
    node isLink = or(TypeDecode.io_Jal, TypeDecode.io_Jalr) @[Top.scala 52:23]
    node isLui = eq(opcode, UInt<6>("h37")) @[Top.scala 53:24]
    node isAuipc = eq(opcode, UInt<5>("h17")) @[Top.scala 54:24]
    node _Regfile_io_wen_T = or(controller.io_RegWrite, isLink) @[Top.scala 84:47]
    node _Regfile_io_wen_T_1 = or(_Regfile_io_wen_T, isLui) @[Top.scala 84:57]
    node _Regfile_io_wen_T_2 = or(_Regfile_io_wen_T_1, isAuipc) @[Top.scala 84:66]
    node _AluControl_io_funct7_T = eq(funct3, UInt<3>("h5")) @[Top.scala 95:61]
    node _AluControl_io_funct7_T_1 = and(TypeDecode.io_I_Type, _AluControl_io_funct7_T) @[Top.scala 95:51]
    node _AluControl_io_funct7_T_2 = or(TypeDecode.io_R_Type, _AluControl_io_funct7_T_1) @[Top.scala 95:26]
    node _AluControl_io_funct7_T_3 = bits(InsMem.io_inst, 30, 30) @[Top.scala 96:16]
    node _AluControl_io_funct7_T_4 = mux(_AluControl_io_funct7_T_2, _AluControl_io_funct7_T_3, UInt<1>("h0")) @[Top.scala 94:30]
    node _operandA_T = eq(controller.io_operand_A_sel, UInt<2>("h2")) @[Top.scala 106:33]
    node _operandA_T_1 = asSInt(Pc.io_pc) @[Top.scala 107:13]
    node _operandA_T_2 = eq(controller.io_operand_A_sel, UInt<2>("h3")) @[Top.scala 108:37]
    node _operandA_T_3 = mux(_operandA_T_2, asSInt(UInt<1>("h0")), Regfile.io_rdata1) @[Top.scala 108:8]
    node _operandA_T_4 = mux(_operandA_T, _operandA_T_1, _operandA_T_3) @[Top.scala 105:18]
    node _operandB_T = asSInt(ImmGen.io_imm) @[Top.scala 111:58]
    node _operandB_T_1 = mux(controller.io_operand_B_sel, _operandB_T, Regfile.io_rdata2) @[Top.scala 111:18]
    node _DataMem_io_addr_T = bits(aluOut, 9, 2) @[Top.scala 120:28]
    node _DataMem_io_data_in_0_T = asUInt(Regfile.io_rdata2) @[Top.scala 122:35]
    node _DataMem_io_data_in_1_T = asUInt(Regfile.io_rdata2) @[Top.scala 123:35]
    node _DataMem_io_data_in_2_T = asUInt(Regfile.io_rdata2) @[Top.scala 124:35]
    node _DataMem_io_data_in_3_T = asUInt(Regfile.io_rdata2) @[Top.scala 125:35]
    node _auipcResult_T = asSInt(Pc.io_pc) @[Top.scala 134:30]
    node _auipcResult_T_1 = asSInt(ImmGen.io_imm) @[Top.scala 134:49]
    node _auipcResult_T_2 = add(_auipcResult_T, _auipcResult_T_1) @[Top.scala 134:37]
    node _auipcResult_T_3 = tail(_auipcResult_T_2, 1) @[Top.scala 134:37]
    node auipcResult = asSInt(_auipcResult_T_3) @[Top.scala 134:37]
    node _writeBackData_T = asSInt(aluOut) @[Top.scala 137:12]
    node _writeBackData_T_1 = asSInt(Pc.io_pc4) @[Top.scala 139:45]
    node _writeBackData_T_2 = asSInt(ImmGen.io_imm) @[Top.scala 140:47]
    node _writeBackData_T_3 = asSInt(DataMem.io_data_out) @[Top.scala 142:49]
    node _writeBackData_T_4 = mux(controller.io_mem_to_Reg, _writeBackData_T_3, _writeBackData_T) @[Mux.scala 98:16]
    node _writeBackData_T_5 = mux(isAuipc, auipcResult, _writeBackData_T_4) @[Mux.scala 98:16]
    node _writeBackData_T_6 = mux(isLui, _writeBackData_T_2, _writeBackData_T_5) @[Mux.scala 98:16]
    node _writeBackData_T_7 = mux(isLink, _writeBackData_T_1, _writeBackData_T_6) @[Mux.scala 98:16]
    node brTaken = bits(ALU.io_Branch, 0, 0) @[Top.scala 149:35]
    node branchTaken = and(controller.io_branch, brTaken) @[Top.scala 150:42]
    node _branchTarget_T = asSInt(Pc.io_pc) @[Top.scala 152:31]
    node _branchTarget_T_1 = asSInt(ImmGen.io_imm) @[Top.scala 152:50]
    node _branchTarget_T_2 = add(_branchTarget_T, _branchTarget_T_1) @[Top.scala 152:38]
    node _branchTarget_T_3 = tail(_branchTarget_T_2, 1) @[Top.scala 152:38]
    node _branchTarget_T_4 = asSInt(_branchTarget_T_3) @[Top.scala 152:38]
    node branchTarget = asUInt(_branchTarget_T_4) @[Top.scala 152:58]
    node _jalTarget_T = asSInt(Pc.io_pc) @[Top.scala 153:31]
    node _jalTarget_T_1 = asSInt(ImmGen.io_imm) @[Top.scala 153:50]
    node _jalTarget_T_2 = add(_jalTarget_T, _jalTarget_T_1) @[Top.scala 153:38]
    node _jalTarget_T_3 = tail(_jalTarget_T_2, 1) @[Top.scala 153:38]
    node _jalTarget_T_4 = asSInt(_jalTarget_T_3) @[Top.scala 153:38]
    node jalTarget = asUInt(_jalTarget_T_4) @[Top.scala 153:58]
    node _jalrTarget_T = asUInt(Regfile.io_rdata1) @[Top.scala 154:30]
    node _jalrTarget_T_1 = add(_jalrTarget_T, ImmGen.io_imm) @[Top.scala 154:37]
    node _jalrTarget_T_2 = tail(_jalrTarget_T_1, 1) @[Top.scala 154:37]
    node jalrTarget = and(_jalrTarget_T_2, UInt<32>("hfffffffe")) @[Top.scala 154:57]
    node _nextPC_T = mux(branchTaken, branchTarget, Pc.io_pc4) @[Top.scala 158:16]
    node _nextPC_T_1 = mux(TypeDecode.io_Jal, jalTarget, _nextPC_T) @[Top.scala 157:16]
    node _nextPC_T_2 = mux(TypeDecode.io_Jalr, jalrTarget, _nextPC_T_1) @[Top.scala 156:16]
    node writeBackData = _writeBackData_T_7 @[Top.scala 59:27 Top.scala 136:17]
    node operandA = _operandA_T_4 @[Top.scala 60:27 Top.scala 105:12]
    node operandB = _operandB_T_1 @[Top.scala 61:27 Top.scala 111:12]
    node nextPC = _nextPC_T_2 @[Top.scala 62:27 Top.scala 156:10]
    io_Reg_Out <= Regfile.io_rdata1 @[Top.scala 167:20]
    io_PC_Out <= Pc.io_pc @[Top.scala 163:20]
    io_instruction <= InsMem.io_inst @[Top.scala 164:20]
    io_aluResult <= aluOut @[Top.scala 165:20]
    io_writeBackData <= writeBackData @[Top.scala 166:20]
    Pc.clock <= clock
    Pc.reset <= reset
    Pc.io_input <= nextPC @[Top.scala 67:17]
    InsMem.clock <= clock
    InsMem.reset <= reset
    InsMem.io_addr <= Pc.io_pc @[Top.scala 68:18]
    Regfile.clock <= clock
    Regfile.reset <= reset
    Regfile.io_raddr1 <= rs1 @[Top.scala 80:21]
    Regfile.io_raddr2 <= rs2 @[Top.scala 81:21]
    Regfile.io_wen <= _Regfile_io_wen_T_2 @[Top.scala 84:21]
    Regfile.io_waddr <= rd @[Top.scala 82:21]
    Regfile.io_wdata <= writeBackData @[Top.scala 85:21]
    ImmGen.clock <= clock
    ImmGen.reset <= reset
    ImmGen.io_instruction <= InsMem.io_inst @[Top.scala 75:25]
    controller.clock <= clock
    controller.reset <= reset
    controller.io_opcode <= opcode @[Top.scala 74:25]
    AluControl.clock <= clock
    AluControl.reset <= reset
    AluControl.io_aluOp <= controller.io_ALU_operation @[Top.scala 92:24]
    AluControl.io_funct3 <= funct3 @[Top.scala 93:24]
    AluControl.io_funct7 <= _AluControl_io_funct7_T_4 @[Top.scala 94:24]
    ALU.clock <= clock
    ALU.reset <= reset
    ALU.io_in1 <= operandA @[Top.scala 113:21]
    ALU.io_in2 <= operandB @[Top.scala 114:21]
    ALU.io_aluControl <= AluControl.io_aluCtrl @[Top.scala 115:21]
    DataMem.clock <= clock
    DataMem.reset <= reset
    DataMem.io_data_in_0 <= _DataMem_io_data_in_0_T @[Top.scala 122:25]
    DataMem.io_data_in_1 <= _DataMem_io_data_in_1_T @[Top.scala 123:25]
    DataMem.io_data_in_2 <= _DataMem_io_data_in_2_T @[Top.scala 124:25]
    DataMem.io_data_in_3 <= _DataMem_io_data_in_3_T @[Top.scala 125:25]
    DataMem.io_data_selector <= UInt<1>("h0") @[Top.scala 126:28]
    DataMem.io_addr <= _DataMem_io_addr_T @[Top.scala 120:19]
    DataMem.io_wr_en <= controller.io_mem_write @[Top.scala 128:20]
    TypeDecode.clock <= clock
    TypeDecode.reset <= reset
    TypeDecode.io_opcode <= opcode @[Top.scala 73:25]
