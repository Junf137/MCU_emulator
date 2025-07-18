`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/28 13:35:28
// Design Name: 
// Module Name: Bit
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


module Bit(
    input   in      ,
    input   load    ,
    input   clk     ,
    output  out     );

    wire    outDff, temp, outDff_;

    DFF u_DFF_1 ( .D(temp), .clk(clk), .S_(1), .R_(1), .Q(outDff), .Q_(outDff_) );
    Mux u_Mux_1 ( .a(outDff), .b(in), .sel(load), .out(temp) );

    assign out = outDff;

endmodule
