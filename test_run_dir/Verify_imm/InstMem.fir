;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit InstMem : 
  module InstMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip addr : UInt<32>, inst : UInt<32>}
    
    cmem imem : UInt<32>[64] @[InstMem.scala 20:17]
    node _io_inst_T = bits(io.addr, 7, 2) @[InstMem.scala 26:26]
    infer mport io_inst_MPORT = imem[_io_inst_T], clock @[InstMem.scala 26:18]
    io.inst <= io_inst_MPORT @[InstMem.scala 26:11]
    
