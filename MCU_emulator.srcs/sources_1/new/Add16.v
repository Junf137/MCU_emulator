`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/20 14:40:50
// Design Name: 
// Module Name: Add16
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


module Add16(
    input   [15:0]  a   ,
    input   [15:0]  b   ,
    output  [15:0]  out );

wire c0 , c1 , c2 , c3 , c4 , c5 , c6 , c7 , c8 , c9 , c10, c11, c12, c13, c14, c15;

FullAdder u_FullAdder_0  ( .a(a[0 ]), .b(b[0 ]), .c(0  ), .sum(out[0 ]), .carry(c0 ) );
FullAdder u_FullAdder_1  ( .a(a[1 ]), .b(b[1 ]), .c(c0 ), .sum(out[1 ]), .carry(c1 ) );
FullAdder u_FullAdder_2  ( .a(a[2 ]), .b(b[2 ]), .c(c1 ), .sum(out[2 ]), .carry(c2 ) );
FullAdder u_FullAdder_3  ( .a(a[3 ]), .b(b[3 ]), .c(c2 ), .sum(out[3 ]), .carry(c3 ) );
FullAdder u_FullAdder_4  ( .a(a[4 ]), .b(b[4 ]), .c(c3 ), .sum(out[4 ]), .carry(c4 ) );
FullAdder u_FullAdder_5  ( .a(a[5 ]), .b(b[5 ]), .c(c4 ), .sum(out[5 ]), .carry(c5 ) );
FullAdder u_FullAdder_6  ( .a(a[6 ]), .b(b[6 ]), .c(c5 ), .sum(out[6 ]), .carry(c6 ) );
FullAdder u_FullAdder_7  ( .a(a[7 ]), .b(b[7 ]), .c(c6 ), .sum(out[7 ]), .carry(c7 ) );
FullAdder u_FullAdder_8  ( .a(a[8 ]), .b(b[8 ]), .c(c7 ), .sum(out[8 ]), .carry(c8 ) );
FullAdder u_FullAdder_9  ( .a(a[9 ]), .b(b[9 ]), .c(c8 ), .sum(out[9 ]), .carry(c9 ) );
FullAdder u_FullAdder_10 ( .a(a[10]), .b(b[10]), .c(c9 ), .sum(out[10]), .carry(c10) );
FullAdder u_FullAdder_11 ( .a(a[11]), .b(b[11]), .c(c10), .sum(out[11]), .carry(c11) );
FullAdder u_FullAdder_12 ( .a(a[12]), .b(b[12]), .c(c11), .sum(out[12]), .carry(c12) );
FullAdder u_FullAdder_13 ( .a(a[13]), .b(b[13]), .c(c12), .sum(out[13]), .carry(c13) );
FullAdder u_FullAdder_14 ( .a(a[14]), .b(b[14]), .c(c13), .sum(out[14]), .carry(c14) );
FullAdder u_FullAdder_15 ( .a(a[15]), .b(b[15]), .c(c14), .sum(out[15]), .carry(c15) );

endmodule
