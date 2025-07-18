`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/29 14:03:54
// Design Name: 
// Module Name: RAM512
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


module RAM512(
    input   [15:0]  in  ,
    input           load,
    input   [8:0]   addr,
    input           clk ,
    output  [15:0]  out );

    wire            la, lb, lc,  ld, le, lf, lg, lh;
    wire  [15:0]    oa, ob, oc, od, oe, of, og, oh;

    DMux8Way u_DMux8Way_1 ( .in(load), .sel(addr[8:6]), .a(la), .b(lb), .c(lc), .d(ld), .e(le), .f(lf), .g(lg), .h(lh) );

    RAM64 u_RAM64_0 ( .in(in), .load(la), .addr(addr[5:0]), .clk(clk), .out(oa) );
    RAM64 u_RAM64_1 ( .in(in), .load(lb), .addr(addr[5:0]), .clk(clk), .out(ob) );
    RAM64 u_RAM64_2 ( .in(in), .load(lc), .addr(addr[5:0]), .clk(clk), .out(oc) );
    RAM64 u_RAM64_3 ( .in(in), .load(ld), .addr(addr[5:0]), .clk(clk), .out(od) );
    RAM64 u_RAM64_4 ( .in(in), .load(le), .addr(addr[5:0]), .clk(clk), .out(oe) );
    RAM64 u_RAM64_5 ( .in(in), .load(lf), .addr(addr[5:0]), .clk(clk), .out(of) );
    RAM64 u_RAM64_6 ( .in(in), .load(lg), .addr(addr[5:0]), .clk(clk), .out(og) );
    RAM64 u_RAM64_7 ( .in(in), .load(lh), .addr(addr[5:0]), .clk(clk), .out(oh) );

    Mux8Way16 u_Mux8Way16_1 ( .a(oa), .b(ob), .c(oc), .d(od), .e(oe), .f(of), .g(og), .h(oh), .sel(addr[8:6]), .out(out) );

endmodule
