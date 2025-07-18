`timescale 1ns / 1ps

module DMux4Way (
    input           in  ,
    input   [1:0]   sel ,
    output          a   ,
    output          b   ,
    output          c   ,
    output          d   );

    wire res0, res1;

    DMux u_DMux_0 ( .in(in), .sel(sel[1]), .a(res0), .b(res1) );
    DMux u_DMux_1 ( .in(res0), .sel(sel[0]), .a(a), .b(b) );
    DMux u_DMux_2 ( .in(res1), .sel(sel[0]), .a(c), .b(d) );


endmodule