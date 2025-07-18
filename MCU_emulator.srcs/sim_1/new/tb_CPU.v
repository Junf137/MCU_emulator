`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/26 14:53:39
// Design Name: 
// Module Name: tb_CPU
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


module tb_CPU();

CPU u_CPU_1 (
    .inRegM     (),
    .instruction(),
    .reset      (),
    .clk        (),
    .outRegM    (),
    .writeRegM  (),
    .addressRegM(),
    .pc         ()
);
endmodule
