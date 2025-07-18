`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/29 14:03:54
// Design Name: 
// Module Name: RAM4K
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


module RAM4K(
    input   [15:0]  in  ,
    input           load,
    input   [11:0]   addr,
    input           clk ,
    output  [15:0]  out );

    wire            la, lb, lc,  ld, le, lf, lg, lh;
    wire  [15:0]    oa, ob, oc, od, oe, of, og, oh;

    DMux8Way u_DMux8Way_1 ( .in(load), .sel(addr[11:9]), .a(la), .b(lb), .c(lc), .d(ld), .e(le), .f(lf), .g(lg), .h(lh) );

    RAM512 u_RAM512_0 ( .in(in), .load(la), .addr(addr[8:0]), .clk(clk), .out(oa) );
    RAM512 u_RAM512_1 ( .in(in), .load(lb), .addr(addr[8:0]), .clk(clk), .out(ob) );
    RAM512 u_RAM512_2 ( .in(in), .load(lc), .addr(addr[8:0]), .clk(clk), .out(oc) );
    RAM512 u_RAM512_3 ( .in(in), .load(ld), .addr(addr[8:0]), .clk(clk), .out(od) );
    RAM512 u_RAM512_4 ( .in(in), .load(le), .addr(addr[8:0]), .clk(clk), .out(oe) );
    RAM512 u_RAM512_5 ( .in(in), .load(lf), .addr(addr[8:0]), .clk(clk), .out(of) );
    RAM512 u_RAM512_6 ( .in(in), .load(lg), .addr(addr[8:0]), .clk(clk), .out(og) );
    RAM512 u_RAM512_7 ( .in(in), .load(lh), .addr(addr[8:0]), .clk(clk), .out(oh) );

    Mux8Way16 u_Mux8Way16_1 ( .a(oa), .b(ob), .c(oc), .d(od), .e(oe), .f(of), .g(og), .h(oh), .sel(addr[11:9]), .out(out) );

endmodule
