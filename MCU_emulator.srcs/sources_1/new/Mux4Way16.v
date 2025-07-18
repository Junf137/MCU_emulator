`timescale 1ns / 1ps

module Mux4Way16 (
    input   [15:0]  a   ,
    input   [15:0]  b   ,
    input   [15:0]  c   ,
    input   [15:0]  d   ,
    input   [1:0]   sel ,
    output  [15:0]  out );

wire [15:0] res0, res1;

Mux16 u_mux_0 ( .a(a), .b(b), .sel(sel[0]), .out(res0) );
Mux16 u_mux_1 ( .a(c), .b(d), .sel(sel[0]), .out(res1) );
Mux16 u_mux_2 ( .a(res0), .b(res1), .sel(sel[1]), .out(out) );
    
endmodule