`timescale 1ns / 1ps

module Mux8Way16 (
    input   [15:0]  a   ,
    input   [15:0]  b   ,
    input   [15:0]  c   ,
    input   [15:0]  d   ,
    input   [15:0]  e   ,
    input   [15:0]  f   ,
    input   [15:0]  g   ,
    input   [15:0]  h   ,
    input   [2:0]   sel ,
    output  [15:0]  out );

wire [15:0] res0, res1;

Mux4Way16 u_mux_0 ( .a(a), .b(b), .c(c), .d(d), .sel(sel[1:0]), .out(res0) );
Mux4Way16 u_mux_1 ( .a(e), .b(f), .c(g), .d(h), .sel(sel[1:0]), .out(res1) );
Mux16 u_mux_2 ( .a(res0), .b(res1), .sel(sel[2]), .out(out) );
    
endmodule
