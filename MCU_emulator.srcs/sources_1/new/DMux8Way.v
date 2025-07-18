`timescale 1ns / 1ps

module DMux8Way (
    input           in  ,
    input   [2:0]   sel ,
    output          a   ,
    output          b   ,
    output          c   ,
    output          d   ,
    output          e   ,
    output          f   ,
    output          g   ,
    output          h   );

    wire res0, res1;

    DMux u_DMux_0 ( .in(in), .sel(sel[2]), .a(res0), .b(res1) );
    DMux4Way u_DMux4Way_1( .in(res0), .sel(sel[1:0]), .a(a), .b(b), .c(c), .d(d) );
    DMux4Way u_DMux4Way_2( .in(res1), .sel(sel[1:0]), .a(e), .b(f), .c(g), .d(h) );


endmodule