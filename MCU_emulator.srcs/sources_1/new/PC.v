`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/28 13:35:28
// Design Name: 
// Module Name: PC
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


module PC(
    input   [15:0]  in  ,
    input           load,
    input           inc ,
    input           rst ,
    input           clk ,
    output  [15:0]  out );

    wire    [15:0]  fb, fbInc, temp1, temp2, temp3;

    Inc16 u_Inc16_1 ( .in(fb), .out(fbInc) );

    Mux16 u_Mux16_1 ( .a(fb), .b(fbInc), .sel(inc), .out(temp1) );
    Mux16 u_Mux16_2 ( .a(temp1), .b(in), .sel(load), .out(temp2) );
    Mux16 u_Mux16_3 ( .a(temp2), .b(0), .sel(rst), .out(temp3) );

    Register u_Register_1 ( .in(temp3), .load(1), .clk(clk), .out(fb) );

    assign out = fb;

endmodule
