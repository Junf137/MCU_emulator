`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/27 15:17:54
// Design Name: 
// Module Name: D_Latch
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


module D_Latch(
    input   D       ,
    input   clk     ,
    output  Q_      ,
    output  Q       );
    
    wire o1, o2;

    nand(o1, D, clk);
    nand(o2, o1, clk);
    nand(Q, o1, Q_);
    nand(Q_, o2, Q);
endmodule
