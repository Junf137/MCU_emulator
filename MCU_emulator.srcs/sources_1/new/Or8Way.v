`timescale 1ns / 1ps

module Or8Way (
    input   [7:0]   in  ,
    output          out );

    wire    or_1        ,
            or_2        ,            
            or_3        ,
            or_4        ,
            or_5        ,
            or_6        ;

    // Method-1
    or (or_1, in[0], in[1]);
    or (or_2, or_1 , in[2]);
    or (or_3, or_2 , in[3]);
    or (or_4, or_3 , in[4]);
    or (or_5, or_4 , in[5]);
    or (or_6, or_5 , in[6]);
    or (out , or_6 , in[7]);


    // Method-2
    // or(out, in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0] );


endmodule