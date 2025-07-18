`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/20 14:40:50
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
    input   a       , 
    input   b       ,
    input   c       ,
    output  sum     ,
    output  carry   );

    wire s1, c1, c2;

    HalfAdder u_HalfAdder_1 ( .a(a), .b(b), .sum(s1), .carry(c1) );
    HalfAdder u_HalfAdder_2 ( .a(s1), .b(c), .sum(sum), .carry(c2) );
    or(carry, c1, c2);

endmodule
