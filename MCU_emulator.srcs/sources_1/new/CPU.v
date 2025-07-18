`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/26 11:46:02
// Design Name: 
// Module Name: CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU(
    input   [15:0]  inRegM         ,  // M value input  (M = contents of RAM[A])
    input   [15:0]  instruction ,  // Instruction for execution
    input           reset       ,  // Signals whether to re-start the current
    // program (reset==1) or continue executing
    // the current program (reset==0).
    input           clk         ,
    output  [15:0]  outRegM        ,  // M value output
    output          writeRegM      ,  // whether write to M
    output  [14:0]  addressRegM    ,  // Address in data memory (of M)
    output  [14:0]  pc          ); // address of next instruction

    wire    [15:0]  outALU, inRegA, outRegA, outRegD, inALU, outPC;
    wire            ins15_;
    wire            loadRegA, writeRegD, writeRegA;
    wire            writeRegMTemp, writeRegDTemp, writeRegATemp;
    wire            zrALU, ngALU, zr_, ng_, gt, eq, lt, zr_ng_;
    wire            jmp1, jmp2, jmp3, jmp123, jmp;

    // RegisterA
    Mux16 u_Mux16_1 ( .a(instruction), .b(outALU), .sel(instruction[15]), .out(inRegA) );
    not(ins15_, instruction[15]);
    or(loadRegA, writeRegA, ins15_);
    Register u_Register_A ( .in(inRegA), .load(loadRegA), .out(outRegA), .clk(clk) );
    assign addressRegM = outRegA[14:0];

    // RegisterD
    Register u_Register_D ( .in(outALU), .load(writeRegD), .out(outRegD), .clk(clk) );

    // ALU
    Mux16 u_Mux16_2 ( .a(outRegA), .b(inRegM), .sel(instruction[12]), .out(inALU) );
    ALU u_ALU_1 (   .x(outRegD), .y(inALU), .zx(instruction[11]), .nx(instruction[10]), 
                    .zy(instruction[9]), .ny(instruction[8]), .f(instruction[7]), 
                    .no(instruction[6]), .out(outALU), .zr(zrALU), .ng (ngALU));
    assign outRegM = outALU;

    Mux u_Mux_1 ( .a(0), .b(1), .sel(instruction[3]), .out(writeRegMTemp) );
    and(writeRegM, instruction[15], writeRegMTemp);
    Mux u_Mux_2 ( .a(0), .b(1), .sel(instruction[4]), .out(writeRegDTemp) );
    and(writeRegD, instruction[15], writeRegDTemp);
    Mux u_Mux_3 ( .a(0), .b(1), .sel(instruction[5]), .out(writeRegATemp) );
    and(writeRegA, instruction[15], writeRegATemp);

    Mux u_Mux_4 ( .a(0), .b(1), .sel(instruction[0]), .out(gt) );
    Mux u_Mux_5 ( .a(0), .b(1), .sel(instruction[1]), .out(eq) );
    Mux u_Mux_6 ( .a(0), .b(1), .sel(instruction[2]), .out(lt) );

    not(zr_, zrALU);
    not(ng_, ngALU);

    and(jmp1, zrALU, eq);
    and(jmp2, ngALU, lt);
    and(zr_ng_, zr_, ng_);
    and(jmp3, zr_ng_, gt);
    
    or(jmp123, jmp1, jmp2, jmp3);
    and(jmp, instruction[15], jmp123);

    // PC
    PC ( .in(outRegA), .load(jmp), .inc(1), .rst(reset), .clk(clk), .out(outPC) );
    assign pc = outPC[14:0];

endmodule
