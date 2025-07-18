`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/28 13:35:28
// Design Name: 
// Module Name: Register
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


module Register(
    input   [15:0]  in      ,
    input           load    ,
    input           clk     ,
    output  [15:0]  out     );

Bit u_Bit_0  ( .in(in[0 ]), .load(load), .clk(clk), .out(out[0 ]) );
Bit u_Bit_1  ( .in(in[1 ]), .load(load), .clk(clk), .out(out[1 ]) );
Bit u_Bit_2  ( .in(in[2 ]), .load(load), .clk(clk), .out(out[2 ]) );
Bit u_Bit_3  ( .in(in[3 ]), .load(load), .clk(clk), .out(out[3 ]) );
Bit u_Bit_4  ( .in(in[4 ]), .load(load), .clk(clk), .out(out[4 ]) );
Bit u_Bit_5  ( .in(in[5 ]), .load(load), .clk(clk), .out(out[5 ]) );
Bit u_Bit_6  ( .in(in[6 ]), .load(load), .clk(clk), .out(out[6 ]) );
Bit u_Bit_7  ( .in(in[7 ]), .load(load), .clk(clk), .out(out[7 ]) );
Bit u_Bit_8  ( .in(in[8 ]), .load(load), .clk(clk), .out(out[8 ]) );
Bit u_Bit_9  ( .in(in[9 ]), .load(load), .clk(clk), .out(out[9 ]) );
Bit u_Bit_10 ( .in(in[10]), .load(load), .clk(clk), .out(out[10]) );
Bit u_Bit_11 ( .in(in[11]), .load(load), .clk(clk), .out(out[11]) );
Bit u_Bit_12 ( .in(in[12]), .load(load), .clk(clk), .out(out[12]) );
Bit u_Bit_13 ( .in(in[13]), .load(load), .clk(clk), .out(out[13]) );
Bit u_Bit_14 ( .in(in[14]), .load(load), .clk(clk), .out(out[14]) );
Bit u_Bit_15 ( .in(in[15]), .load(load), .clk(clk), .out(out[15]) );

endmodule
