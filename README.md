# 16-bit MCU Emulator

This project is a Verilog implementation of a 16-bit CPU, designed for emulation and simulation using Vivado. The CPU is built from the ground up, starting with basic logic gates and culminating in a functional ALU, registers, and RAM.

## Project Structure

The Verilog source files are located in the `MCU_emulator.srcs/sources_1/new/` directory. The project is organized hierarchically, with the top-level module being `CPU.v`.

### Key Modules

*   **CPU.v:** The top-level module that integrates all the components of the CPU.
*   **ALU.v:** The Arithmetic Logic Unit, which performs arithmetic and logical operations.
*   **Register.v:** A 16-bit register used for the A and D registers.
*   **PC.v:** The Program Counter, which keeps track of the next instruction to be executed.
*   **RAM16K.v:** A 16K RAM module, which is built from smaller RAM modules.
*   **And.v, Or.v, Not.v, Xor.v:** Basic logic gates.
*   **Add16.v, And16.v, Not16.v, Or16.v:** 16-bit versions of the basic logic gates.
*   **Mux.v, Mux16.v, Mux4Way16.v, Mux8Way16.v:** Multiplexers of various sizes.
*   **DMux.v, DMux4Way.v, DMux8Way.v:** Demultiplexers of various sizes.
*   **HalfAdder.v, FullAdder.v:** Basic building blocks for the adder.
*   **Inc16.v:** A 16-bit incrementer.
*   **Bit.v, DFF.v, D_Latch.v:** Basic memory elements.

## From RTL to CPU: A Step-by-Step Implementation

### 1. Elementary Logic Gates: The Foundation

The CPU is built upon a foundation of elementary logic gates. These are the most basic building blocks, from which all other components are constructed.

#### Basic Gates

These are the fundamental logic gates that perform boolean operations.

- **And Gate:** A & B
![And Gate](Img/Elementary_logic_gates/Elementary_logic_gates/And.png)
- **Or Gate:** A | B
![Or Gate](Img/Elementary_logic_gates/Elementary_logic_gates/Or.png)
- **Not Gate:** ~A
![Not Gate](Img/Elementary_logic_gates/Elementary_logic_gates/Not.png)
- **Xor Gate:** A ^ B
![Xor Gate](Img/Elementary_logic_gates/Elementary_logic_gates/Xor.png)

#### 16-Bit Variants

To handle 16-bit data, we create 16-bit versions of the basic gates.

- **And16 Gate:** A & B (16 bits)
![And16 Gate](Img/Elementary_logic_gates/16_bits_variants/And16.png)
- **Or16 Gate:** A | B (16 bits)
![Or16 Gate](Img/Elementary_logic_gates/16_bits_variants/Or16.png)
- **Not16 Gate:** ~A (16 bits)
![Not16 Gate](Img/Elementary_logic_gates/16_bits_variants/Not16.png)

#### Multiplexers and Demultiplexers

Multiplexers (Mux) and Demultiplexers (DMux) are used to select and route data within the CPU.

- **Multiplexers (Mux):** These select one of several inputs based on a control signal.
![Mux](Img/Elementary_logic_gates/Elementary_logic_gates/Mux.png)
- **Demultiplexers (DMux):** These route a single input to one of several outputs based on a control signal.
![DMux](Img/Elementary_logic_gates/Elementary_logic_gates/DMux.png)

We also have multi-way variants for more complex routing.

- **Mux4Way16:** Selects one of four 16-bit inputs.
![Mux4Way16](Img/Elementary_logic_gates/Multi_way_variants/Mux4Way16.png)
- **Mux8Way16:** Selects one of eight 16-bit inputs.
![Mux8Way16](Img/Elementary_logic_gates/Multi_way_variants/Mux8Way16.png)
- **DMux4Way:** Routes a single 16-bit input to one of four outputs.
![DMux4Way](Img/Elementary_logic_gates/Multi_way_variants/DMux4Way.png)
- **DMux8Way:** Routes a single 16-bit input to one of eight outputs.
![DMux8Way](Img/Elementary_logic_gates/Multi_way_variants/DMux8Way.png)

### 2. Arithmetic Logic Unit (ALU): The Brains of the Operation

The ALU is responsible for performing arithmetic and logical operations. It is constructed from the elementary gates.

#### Building Blocks of Addition

The foundation of our ALU's arithmetic capabilities is the adder.

- **Half Adder:** Adds two single bits and produces a sum and carry output.
![Half Adder](Img/ALU/HalfAdder.png)
- **Full Adder:** Adds three bits (two inputs and a carry) and produces a sum and carry output.
![Full Adder](Img/ALU/FullAdder.png)

These are combined to create a 16-bit adder and a 16-bit incrementer.

- **16-bit Adder:** Combines two 16-bit inputs using a series of full adders.
![16-bit Adder](Img/ALU/Add16.png)
- **16-bit Incrementer:** Adds 1 to a 16-bit input, effectively incrementing it.
![16-bit Incrementer](Img/ALU/Inc16.png)

#### The Complete ALU

The final ALU combines these components to perform a variety of operations based on a set of control bits. The specification below details the operations the ALU can perform.

- **ALU Specification:** The ALU can perform operations such as addition, subtraction, bitwise AND, OR, NOT, and more.
![ALU Specification](Img/ALU/ALU_spec.png)
- **ALU Implementation**
![ALU Type 1](Img/ALU/ALU_type_1.png)
![ALU Type 2](Img/ALU/ALU_type_2.png)

### 3. Memory: Storing the Data

The CPU needs memory to store data and instructions. We build our memory system from the ground up, starting with the most basic memory element.

#### The D-Latch and D-Flip-Flop (DFF)

The D-latch is a basic memory element, but it has a "transparency" issue. The D-Flip-Flop (DFF) solves this by being edge-triggered.

![D-Latch from NAND gates](Img/Memory(RAM)/D_latch-nand.png)

##### D-Latch vs. DFF

*   **D-latch:** Has a race-around problem. When the clock is high, the output Q changes with the input D (level-sensitive).
    ![D-Latch Waveform](Img/Memory(RAM)/wave/D_latch.png)
*   **D-Flip-Flop (DFF):** Solves the race-around problem. It is rising-edge sensitive and has asynchronous set and reset capabilities.
    ![DFF Waveform](Img/Memory(RAM)/wave/DFF.png)

Here is the positive-edge-triggered DFF used in this project:
![Positive-Edge-Triggered DFF](Img/Memory(RAM)/DFF_posedge.png)

#### Registers

Registers are used to store data within the CPU. They are built from DFFs.

- **Register:** A 16-bit register that can load data and reset to zero.
![Register](Img/Memory(RAM)/Register.png)
- **Register with Load and Reset:** This register can load a value and reset to zero when the reset signal is high.
![Register with Load and Reset](Img/Memory(RAM)/Register_full.png)

#### RAM

The RAM is built hierarchically from smaller RAM modules.

- **RAM8:** An 8-word RAM module, each word being 16 bits.
![RAM8](Img/Memory(RAM)/RAM8.png)
- **RAM64:** A 64-word RAM module, built from eight RAM8 modules.
![RAM64](Img/Memory(RAM)/RAM64.png)
- **RAM512:** A 512-word RAM module, built from eight RAM64 modules.
![RAM512](Img/Memory(RAM)/RAM512.png)
- **RAM4K:** A 4096-word RAM module, built from eight RAM512 modules.
![RAM4K](Img/Memory(RAM)/RAM4K.png)
- **RAM16K:** A 16384-word RAM module, built from four RAM4K modules.
![RAM16K](Img/Memory(RAM)/RAM16K.png)

#### Program Counter (PC)

The Program Counter keeps track of the next instruction to be executed.

![Program Counter](Img/Memory(RAM)/PC.png)

### 4. The CPU: Putting It All Together

Finally, we integrate the ALU, registers, RAM, and PC to create the complete CPU.

#### CPU Architecture

The following diagram shows the architecture of our 16-bit CPU.

- **CPU Architecture Specification:** This diagram outlines the connections between the ALU, registers, RAM, and PC.
![CPU Architecture Specification](Img/CPU/CPU_arch_spec.png)
- **CPU Implementation:** The actual implementation of the CPU, showing how the components are connected and interact with each other.
![CPU Implementation](Img/CPU/CPU.png)

#### Machine Language

The CPU understands a specific machine language, as defined in the following specification.

![Machine Language Specification](Img/CPU/machine_language_spec.png)

## How to Use

This project is intended to be used with Vivado. To simulate the CPU, you will need to create a testbench that provides a clock signal, a reset signal, and a stream of instructions. The output of the CPU can be observed in the Vivado simulator.

## Further Development

This project provides a solid foundation for a 16-bit CPU. Here are some potential areas for further development:

*   **Instruction Set Documentation:** Create a document that formally defines the instruction set.
*   **Assembler:** Write an assembler that can convert assembly code into machine code that can be executed by the CPU.
*   **Compiler:** Write a compiler for a high-level language that can target this CPU.
*   **Peripherals:** Add peripherals such as a UART, timers, and GPIO to the CPU.
