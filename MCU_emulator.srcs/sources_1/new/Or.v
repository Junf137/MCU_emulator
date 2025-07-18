`timescale 1ns / 1ps

module Or (
    input   a   ,
    input   b   ,
    output  out );

    Not u_Not_1(
        .in     (a  ),
        .out    (an )
    );

    Not u_Not_2(
        .in     (b  ),
        .out    (bn )
    );

    nand (out, an, bn);
    
endmodule