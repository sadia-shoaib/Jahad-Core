circuit InstMem :
  module InstMem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<32>
    output io_inst : UInt<32>

    mem imem : @[InstMem.scala 20:17]
      data-type => UInt<32>
      depth => 64
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    node _io_inst_T = bits(io_addr, 7, 2) @[InstMem.scala 26:26]
    io_inst <= imem.io_inst_MPORT.data @[InstMem.scala 26:11]
    imem.io_inst_MPORT.addr <= _io_inst_T @[InstMem.scala 26:18]
    imem.io_inst_MPORT.en <= UInt<1>("h1") @[InstMem.scala 26:18]
    imem.io_inst_MPORT.clk <= clock @[InstMem.scala 26:18]
