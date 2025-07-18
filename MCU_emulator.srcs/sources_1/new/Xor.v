`timescale 1ns / 1ps

module Xor (
    input   a   ,
    input   b   ,
    output  out );

    wire nota, notb, res1, res2;

    not(nota, a);
    not(notb, b);

    and(res1, nota, b);
    and(res2, notb, a);

    or(out, res1, res2);

    
endmodule