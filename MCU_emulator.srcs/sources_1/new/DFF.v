`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/28 09:56:21
// Design Name: 
// Module Name: DFF
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


module DFF(
    input   D       ,
    input   clk     ,
    input   S_      ,
    input   R_      ,
    output  Q_      ,
    output  Q       );

    wire M, N, o1, o2;

    nand(o1, D, R_, N);
    nand(N, o1, clk, M);

    nand(M, clk, R_, o2);
    nand(o2, M, o1, S_);

    nand(Q_, R_, N, Q);
    nand(Q, Q_, M, S_);

endmodule
