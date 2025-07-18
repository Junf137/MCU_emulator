`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/28 13:35:28
// Design Name: 
// Module Name: RAM64
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


module RAM64(
    input   [15:0]  in  ,
    input           load,
    input   [5:0]   addr,
    input           clk ,
    output  [15:0]  out );

    wire            la, lb, lc,  ld, le, lf, lg, lh;
    wire  [15:0]    oa, ob, oc, od, oe, of, og, oh;

    DMux8Way u_DMux8Way_1 ( .in(load), .sel(addr[5:3]), .a(la), .b(lb), .c(lc), .d(ld), .e(le), .f(lf), .g(lg), .h(lh) );

    RAM8 u_RAM8_0 ( .in(in), .load(la), .addr(addr[2:0]), .clk(clk), .out(oa) );
    RAM8 u_RAM8_1 ( .in(in), .load(lb), .addr(addr[2:0]), .clk(clk), .out(ob) );
    RAM8 u_RAM8_2 ( .in(in), .load(lc), .addr(addr[2:0]), .clk(clk), .out(oc) );
    RAM8 u_RAM8_3 ( .in(in), .load(ld), .addr(addr[2:0]), .clk(clk), .out(od) );
    RAM8 u_RAM8_4 ( .in(in), .load(le), .addr(addr[2:0]), .clk(clk), .out(oe) );
    RAM8 u_RAM8_5 ( .in(in), .load(lf), .addr(addr[2:0]), .clk(clk), .out(of) );
    RAM8 u_RAM8_6 ( .in(in), .load(lg), .addr(addr[2:0]), .clk(clk), .out(og) );
    RAM8 u_RAM8_7 ( .in(in), .load(lh), .addr(addr[2:0]), .clk(clk), .out(oh) );

    Mux8Way16 u_Mux8Way16_1 ( .a(oa), .b(ob), .c(oc), .d(od), .e(oe), .f(of), .g(og), .h(oh), .sel(addr[5:3]), .out(out) );

endmodule
