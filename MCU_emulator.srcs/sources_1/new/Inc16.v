`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/20 14:40:50
// Design Name: 
// Module Name: Inc16
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


module Inc16(
    input   [15:0]  in  ,
    output  [15:0]  out );

    Add16 u_Add16_1( .a(in), .b(1), .out(out) );

endmodule
