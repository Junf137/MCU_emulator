`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/20 14:40:50
// Design Name: 
// Module Name: ALU
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


module ALU(
    input   [15:0]  x   ,
    input   [15:0]  y   ,
    input           zx  ,
    input           nx  ,
    input           zy  ,
    input           ny  ,
    input           f   ,
    input           no  ,
    output  [15:0]  out ,
    output          zr  ,
    output          ng  );

    wire [15:0] x1, nx1, x2, y1, ny1, y2, xAndy, xAddy, out0, nout0 ,tempOut;
    wire [7:0]  temp1, temp2;
    wire or1, or2, resOr;

    Mux16 u_Mux16_1 ( .a(x), .b(0), .sel(zx), .out(x1) );  //zx
    Not16 u_Not16_1 ( .in(x1), .out(nx1) );
    Mux16 u_Mux16_2 ( .a(x1), .b(nx1), .sel(nx), .out(x2) );  //nx

    Mux16 u_Mux16_3 ( .a(y), .b(0), .sel(zy), .out(y1) );  //zy
    Not16 u_Not16_2 ( .in(y1), .out(ny1) );
    Mux16 u_Mux16_4 ( .a(y1), .b(ny1), .sel(ny), .out(y2) );  //ny

    And16 u_And16_1 ( .a(x2), .b(y2), .out(xAndy) );
    Add16 u_Add16_1 ( .a(x2), .b(y2), .out(xAddy) );
    Mux16 u_Mux16_5 ( .a(xAndy), .b(xAddy), .sel(f), .out(out0) );  //f

    Not16 u_Not16_3 ( .in(out0), .out(nout0) );
    Mux16 u_Mux16_6 ( .a(out0), .b(nout0), .sel(no), .out(tempOut) );  //no
    assign temp1 = tempOut[7:0];
    assign temp2 = tempOut[15:8];
    assign out = tempOut;

    // method-1
    Or8Way u_Or8Way_1 ( .in(temp1), .out(or1) );
    Or8Way u_Or8Way_2 ( .in(temp2), .out(or2) );
    or(resOr, or1, or2);
    // method-2
    // or(resOr,   
    //     tempOut[0 ] ,
    //     tempOut[1 ] ,
    //     tempOut[2 ] ,
    //     tempOut[3 ] ,
    //     tempOut[4 ] ,
    //     tempOut[5 ] ,
    //     tempOut[6 ] ,
    //     tempOut[7 ] ,
    //     tempOut[8 ] ,
    //     tempOut[9 ] ,
    //     tempOut[10] ,
    //     tempOut[11] ,
    //     tempOut[12] ,
    //     tempOut[13] ,
    //     tempOut[14] ,
    //     tempOut[15] );
    Mux u_Mux_1 ( .a(1), .b(0), .sel(resOr), .out(zr) );  // output zr state 
    
    Mux u_Mux_2 ( .a(0), .b(1), .sel(tempOut[15]), .out(ng) );  // output ng state 

endmodule
