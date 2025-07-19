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

## CPU Architecture

The CPU is a 16-bit machine with the following components:

*   **A Register:** A 16-bit address register.
*   **D Register:** A 16-bit data register (accumulator).
*   **Program Counter (PC):** A 15-bit program counter, allowing for a 32K instruction space.
*   **ALU:** A 16-bit ALU that can perform a variety of arithmetic and logical operations.
*   **RAM:** A 16K RAM module for data storage.

### Instruction Set

The instruction set is not explicitly defined in a separate document, but can be inferred from the `CPU.v` and `ALU.v` modules. The 16-bit instruction word is decoded to control the various components of the CPU.

## How to Use

This project is intended to be used with Vivado. To simulate the CPU, you will need to create a testbench that provides a clock signal, a reset signal, and a stream of instructions. The output of the CPU can be observed in the Vivado simulator.

## Further Development

This project provides a solid foundation for a 16-bit CPU. Here are some potential areas for further development:

*   **Instruction Set Documentation:** Create a document that formally defines the instruction set.
*   **Assembler:** Write an assembler that can convert assembly code into machine code that can be executed by the CPU.
*   **Compiler:** Write a compiler for a high-level language that can target this CPU.
*   **Peripherals:** Add peripherals such as a UART, timers, and GPIO to the CPU.
