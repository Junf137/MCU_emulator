`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/29 14:03:54
// Design Name: 
// Module Name: RAM16K
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


module RAM16K(
    input   [15:0]  in  ,
    input           load,
    input   [13:0]  addr,
    input           clk ,
    output  [15:0]  out );

    wire            la, lb, lc,  ld;
    wire  [15:0]    oa, ob, oc, od;

    DMux4Way u_DMux4Way_1 ( .in(load), .sel(addr[13:12]), .a(la), .b(lb), .c(lc), .d(ld));

    RAM4K u_RAM4K_0 ( .in(in), .load(la), .addr(addr[11:0]), .clk(clk), .out(oa) );
    RAM4K u_RAM4K_1 ( .in(in), .load(lb), .addr(addr[11:0]), .clk(clk), .out(ob) );
    RAM4K u_RAM4K_2 ( .in(in), .load(lc), .addr(addr[11:0]), .clk(clk), .out(oc) );
    RAM4K u_RAM4K_3 ( .in(in), .load(ld), .addr(addr[11:0]), .clk(clk), .out(od) );

    Mux4Way16 u_Mux4Way16_1 ( .a(oa), .b(ob), .c(oc), .d(od), .sel(addr[13:12]), .out(out) );

endmodule
