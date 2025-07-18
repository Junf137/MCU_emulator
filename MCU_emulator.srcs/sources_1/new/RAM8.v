`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/28 13:35:28
// Design Name: 
// Module Name: RAM8
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


module RAM8(
    input   [15:0]  in  ,
    input           load,
    input   [2:0]   addr,
    input           clk ,
    output  [15:0]  out );

wire            la, lb, lc,  ld, le, lf, lg, lh;
wire  [15:0]    oa, ob, oc, od, oe, of, og, oh;

    DMux8Way u_DMux8Way_1 ( .in(load), .sel(addr), .a(la), .b(lb), .c(lc), .d(ld), .e(le), .f(lf), .g(lg), .h(lh) );

    Register u_Register_0 ( .in(in), .load(la), .clk(clk), .out(oa) );
    Register u_Register_1 ( .in(in), .load(lb), .clk(clk), .out(ob) );
    Register u_Register_2 ( .in(in), .load(lc), .clk(clk), .out(oc) );
    Register u_Register_3 ( .in(in), .load(ld), .clk(clk), .out(od) );
    Register u_Register_4 ( .in(in), .load(le), .clk(clk), .out(oe) );
    Register u_Register_5 ( .in(in), .load(lf), .clk(clk), .out(of) );
    Register u_Register_6 ( .in(in), .load(lg), .clk(clk), .out(og) );
    Register u_Register_7 ( .in(in), .load(lh), .clk(clk), .out(oh) );

    Mux8Way16 u_Mux8Way16_1 ( .a(oa), .b(ob), .c(oc), .d(od), .e(oe), .f(of), .g(og), .h(oh), .sel(addr), .out(out) );

endmodule
