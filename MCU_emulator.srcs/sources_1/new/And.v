`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/18 16:12:34
// Design Name: 
// Module Name: And
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


module And(
    input   a   ,
    input   b   ,
    output  out );
    
    wire    out_nand    ;
    
    nand    (out_nand, a, b);

    Not u_Not(
        .in     (out_nand   ),
        .out    (out        )
    );

endmodule
