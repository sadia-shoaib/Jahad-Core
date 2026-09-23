# ⚡ Jahad-Core

### A Clean, Single-Cycle RV32I Processor Built with Chisel

<p align="center">

**Jahad-Core** is a single-cycle **RV32I RISC-V processor** designed and implemented using **Scala + Chisel**.

It provides a complete processor datapath with instruction memory, register file, ALU, control logic, data memory, branch handling, and next-PC generation — with support for cycle-by-cycle verification through **GTKWave**.

</p>

<p align="center">

[![RISC-V](https://img.shields.io/badge/ISA-RV32I-blue?style=for-the-badge)](https://riscv.org/)
[![Chisel](https://img.shields.io/badge/HDL-Chisel-orange?style=for-the-badge)](https://www.chisel-lang.org/)
[![Scala](https://img.shields.io/badge/Language-Scala-red?style=for-the-badge)](https://www.scala-lang.org/)
[![GTKWave](https://img.shields.io/badge/Waveform-GTKWave-green?style=for-the-badge)](https://gtkwave.sourceforge.net/)

</p>

---

## 🧠 About Jahad-Core

Jahad-Core is designed as a **single-cycle RISC-V processor**, where an instruction passes through the processor datapath within a single clock cycle.

The core follows the classic RISC-V execution flow:

> **Fetch → Decode → Execute → Memory → Write Back → Next PC**

The project is implemented completely in **Chisel**, making the processor hardware describable, testable, and suitable for RTL generation.

---

## 🏗️ RISC-V Single-Cycle Datapath

<p align="center">

<img src="images/RiscV DataPath.jpeg" alt="RISC-V Single Cycle Architecture" width="850"/>

</p>

The datapath connects the major processor components to execute RISC-V instructions.

### Core Flow

```text
             ┌─────────────┐
             │     PC      │
             └──────┬──────┘
                    ↓
          ┌──────────────────┐
          │ Instruction Mem │
          └────────┬─────────┘
                   ↓
          ┌──────────────────┐
          │     Decode       │
          └────────┬─────────┘
                   ↓
       ┌───────────┴───────────┐
       ↓                       ↓
 ┌─────────────┐       ┌──────────────┐
 │ Register    │       │ Immediate    │
 │ File        │       │ Generator    │
 └──────┬──────┘       └──────┬───────┘
        └──────────┬───────────┘
                   ↓
             ┌──────────┐
             │   ALU    │
             └────┬─────┘
                  ↓
        ┌─────────┴─────────┐
        ↓                   ↓
 ┌─────────────┐      ┌─────────────┐
 │ Data Memory │      │   Next PC   │
 └──────┬──────┘      └──────┬──────┘
        └──────────┬─────────┘
                   ↓
            ┌────────────┐
            │ Write Back │
            └────────────┘
```

---

# 🔩 Processor Components

Jahad-Core is divided into modular hardware components:

| Component                  | Responsibility                             |
| -------------------------- | ------------------------------------------ |
| 🧭 **Program Counter**     | Holds the current instruction address      |
| 📖 **Instruction Memory**  | Fetches instructions                       |
| 🧩 **Instruction Decoder** | Identifies the instruction type            |
| 🎛️ **Controller**         | Generates processor control signals        |
| 🗃️ **Register File**      | Reads and writes RISC-V registers          |
| 🔢 **Immediate Generator** | Generates instruction immediates           |
| ⚙️ **ALU Control**         | Selects the required ALU operation         |
| 🧮 **ALU**                 | Performs arithmetic and logical operations |
| 💾 **Data Memory**         | Handles load/store operations              |
| 🔀 **Branch Logic**        | Determines branch conditions               |
| 🏃 **JAL/JALR Logic**      | Handles jump instructions                  |
| ➡️ **Next-PC Logic**       | Determines the next instruction address    |

---

# 📂 Repository Structure

```text
Jahad-Core/
│
├── 📁 images/
│   └── RISC-V architecture images
│
├── 📁 project/
│   └── SBT project configuration
│
├── 📁 src/
│   ├── main/
│   │   └── scala/
│   │       └── core/
│   │           ├── ALU.scala
│   │           ├── InstMem.scala
│   │           ├── Top.scala
│   │           ├── RegFile.scala
│   │           ├── DataMem.scala
│   │           ├── Controller.scala
│   │           ├── Imm_gen.scala
│   │           └── ...
│   │
│   └── test/
│       └── scala/
│           └── core/
│
├── 📁 target/
│
├── 📁 test_run_dir/
│   └── Generated test / VCD files
│
├── 📄 Assembly instructions.txt
├── 📄 fibonaciAssembly.txt
├── 📄 instruction.txt
├── 📄 build.sbt
├── 📄 LICENSE
└── 📄 README.md
```

---

# 📝 Instruction Programs

Jahad-Core supports loading different instruction programs through the Instruction Memory.

The repository currently contains:

### 📘 Assembly Program

```text
Assembly instructions.txt
```

Contains the assembly instructions for the main program.

### 🌀 Fibonacci Program

```text
fibonaciAssembly.txt
```

Contains the assembly implementation of the Fibonacci program.

### 🔢 Machine Instructions

```text
instruction.txt
```

Contains the instruction data used by the processor.

---

# 🔄 Selecting a Program

The instruction file executed by Jahad-Core is selected through `InstMem.scala` and `Top.scala`.

## 1️⃣ Configure Instruction Memory

Open:

```text
src/main/scala/core/InstMem.scala
```

Find:

```scala
class InstMem(initFile: String = "fibonaciAssembly.txt") extends Module with Config4
```

Change the filename to the program you want to execute.

### Fibonacci

```scala
class InstMem(initFile: String = "fibonaciAssembly.txt") extends Module with Config4
```

### Assembly Program

```scala
class InstMem(initFile: String = "Assembly instructions.txt") extends Module with Config4
```

---

## 2️⃣ Configure the Top Module

Open:

```text
src/main/scala/core/Top.scala
```

Find:

```scala
class Top(initFile: String = "fibonaciAssembly.txt") extends Module
```

Change the filename to match the selected program.

For example:

```scala
class Top(initFile: String = "Assembly instructions.txt") extends Module
```

---

# 🚀 Running Jahad-Core

Move into the project:

```bash
cd /home/vboxuser/Desktop/RISCV
```

Start SBT:

```bash
sbt
```

You should see:

```text
sbt:RISCV_Project>
```

---

# 🧪 Run a Test

To execute a processor test:

```bash
testOnly core.TopTest
```

The general format is:

```bash
testOnly core.<TestName>
```

For example:

```bash
testOnly core.TopTest
```

---

# 📈 Generate a GTKWave VCD

To generate a waveform while running the test:

```bash
testOnly core.TopTest -- -DwriteVcd=1
```

The important option is:

```text
-DwriteVcd=1
```

This enables VCD waveform generation.

---

# 🌊 GTKWave

After the test finishes, open:

```text
test_run_dir/
```

Inside this directory, locate the directory generated for the test.

The generated verification directory contains the waveform file.

Open the VCD using:

```bash
gtkwave <generated-vcd-file>
```

For example:

```bash
gtkwave TopTest.vcd
```

---

# 🔬 What Can Be Observed?

GTKWave makes it possible to inspect the processor **cycle-by-cycle**.

Useful signals include:

```text
⏱ Clock
📍 PC
📖 Instruction
🧮 ALU
🗃 Register File
💾 Data Memory
🎛 Control Signals
🔀 Branch Signals
➡ Next PC
📤 Register Output
```

You can follow the complete execution of the program by moving through the clock cycles.

For example:

```text
Clock Cycle 1  → Instruction 1
Clock Cycle 2  → Instruction 2
Clock Cycle 3  → Instruction 3
Clock Cycle 4  → Instruction 4
       ...
Clock Cycle N  → Instruction N
```

This provides a hardware-level view of how the RISC-V processor executes a program.

---

# 🌀 Fibonacci Demonstration

One of the programs included with Jahad-Core is a Fibonacci implementation.

The program is stored in:

```text
fibonaciAssembly.txt
```

To execute it, configure both:

```text
InstMem.scala
Top.scala
```

to use:

```text
fibonaciAssembly.txt
```

Then:

```bash
sbt
```

Run the test:

```bash
testOnly core.TopTest
```

Or generate a waveform:

```bash
testOnly core.TopTest -- -DwriteVcd=1
```

Then inspect the generated VCD in GTKWave.

---

# 🧪 Verification Workflow

The verification flow is intentionally simple:

```text
        ┌─────────────────────┐
        │ Select Program      │
        └──────────┬──────────┘
                   ↓
        ┌─────────────────────┐
        │ Update InstMem.scala│
        └──────────┬──────────┘
                   ↓
        ┌─────────────────────┐
        │ Update Top.scala    │
        └──────────┬──────────┘
                   ↓
        ┌─────────────────────┐
        │       sbt            │
        └──────────┬──────────┘
                   ↓
        ┌─────────────────────┐
        │    testOnly ...     │
        └──────────┬──────────┘
                   ↓
        ┌─────────────────────┐
        │    Generate VCD     │
        └──────────┬──────────┘
                   ↓
        ┌─────────────────────┐
        │    test_run_dir     │
        └──────────┬──────────┘
                   ↓
        ┌─────────────────────┐
        │      GTKWave        │
        └─────────────────────┘
```

---

# ⚡ Quick Start

### Clone

```bash
git clone https://github.com/sadia-shoaib/Jahad-Core.git
```

### Enter Project

```bash
cd Jahad-Core
```

### Start SBT

```bash
sbt
```

### Run Test

```bash
testOnly core.TopTest
```

### Generate Waveform

```bash
testOnly core.TopTest -- -DwriteVcd=1
```

### Open GTKWave

```bash
gtkwave <generated-vcd-file>
```

---

# 🛠️ Technologies

<p align="center">

|      Technology     | Used For                     |
| :-----------------: | ---------------------------- |
|    🟠 **Chisel**    | Hardware Construction        |
|     🔴 **Scala**    | Hardware Description         |
| 🟢 **RISC-V RV32I** | Instruction Set Architecture |
|      🔵 **SBT**     | Build & Testing              |
|  🟣 **ChiselTest**  | Hardware Verification        |
|    🌊 **GTKWave**   | Waveform Analysis            |

</p>

---

# 🎯 Project Goals

Jahad-Core was developed to explore the design and implementation of a RISC-V processor at the hardware level.

The project focuses on:

* 🧠 Understanding RISC-V architecture
* ⚙️ Designing a single-cycle datapath
* 🔧 Implementing processor components using Chisel
* 🧩 Connecting datapath and control logic
* 🧪 Testing hardware modules
* 📊 Generating VCD waveforms
* 🌊 Debugging processor execution using GTKWave

---

# 📚 RISC-V

Jahad-Core is based on the **RISC-V RV32I instruction-set architecture**.

The processor is designed around the fundamental RISC-V concepts of:

```text
Registers
   +
ALU
   +
Memory
   +
Control
   +
Program Counter
   ↓
Instruction Execution
```

---

# 👨‍💻 Project

**Jahad-Core**

> *A clean and simple single-cycle RV32I processor implemented in Chisel.*

<p align="center">

⭐ If you find this project useful, consider giving the repository a star!

</p>
