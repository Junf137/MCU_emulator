`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/20 15:13:08
// Design Name: 
// Module Name: tb_ALU
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


module tb_ALU();

reg  [15:0] a       ;
wire [15:0] not_a   ;

reg  [15:0] x       ;
reg  [15:0] y       ;
reg  zx, nx, zy, ny, f, no;
wire [15:0] alu_output; 
wire zr, ng;

initial begin
    a           = 0;
    
    // ALU TEST
    // ------------------------------
    // Compute 0
    x           = 16'h0000;
    y           = 16'hffff;
    zx          = 1 ;
    nx          = 0 ;
    zy          = 1 ;
    ny          = 0 ;
    f           = 1 ;
    no          = 0 ;
    
    // Compute 1
    #20;
    zx          = 1 ;
    nx          = 1 ;
    zy          = 1 ;
    ny          = 1 ;
    f           = 1 ;
    no          = 1 ;

    // Compute -1
    #20;
    zx          = 1 ;
    nx          = 1 ;
    zy          = 1 ;
    ny          = 0 ;
    f           = 1 ;
    no          = 0 ;

    // Compute x
    #20;
    zx          = 0 ;
    nx          = 0 ;
    zy          = 1 ;
    ny          = 1 ;
    f           = 0 ;
    no          = 0 ;

    // Compute y
    #20;
    zx          = 1 ;
    nx          = 1 ;
    zy          = 0 ;
    ny          = 0 ;
    f           = 0 ;
    no          = 0 ;

    // Compute !x
    #20;
    zx          = 0 ;
    nx          = 0 ;
    zy          = 1 ;
    ny          = 1 ;
    f           = 0 ;
    no          = 1 ;

    // Compute !y
    #20;
    zx          = 1 ;
    nx          = 1 ;
    zy          = 0 ;
    ny          = 0 ;
    f           = 0 ;
    no          = 1 ;

    // Compute -x
    #20;
    zx          = 0 ;
    nx          = 0 ;
    zy          = 1 ;
    ny          = 1 ;
    f           = 1 ;
    no          = 1 ;

    // Compute -y
    #20;
    zx          = 1 ;
    nx          = 1 ;
    zy          = 0 ;
    ny          = 0 ;
    f           = 1 ;
    no          = 1 ;

    // Compute x+1
    #20;
    zx          = 0 ;
    nx          = 1 ;
    zy          = 1 ;
    ny          = 1 ;
    f           = 1 ;
    no          = 1 ;

    // Compute y+1
    #20;
    zx          = 1 ;
    nx          = 1 ;
    zy          = 0 ;
    ny          = 1 ;
    f           = 1 ;
    no          = 1 ;

    // Compute x-1
    #20;
    zx          = 0 ;
    nx          = 0 ;
    zy          = 1 ;
    ny          = 1 ;
    f           = 1 ;
    no          = 0 ;


    // Compute y-1
    #20;
    zx          = 1 ;
    nx          = 1 ;
    zy          = 0 ;
    ny          = 0 ;
    f           = 1 ;
    no          = 0 ;

    // Compute x+y
    #20;
    zx          = 0 ;
    nx          = 0 ;
    zy          = 0 ;
    ny          = 0 ;
    f           = 1 ;
    no          = 0 ;

    // Compute x-y
    #20;
    zx    = 0 ;
    nx    = 1 ;
    zy    = 0 ;
    ny    = 0 ;
    f     = 1 ;
    no    = 1 ;

    // Compute y-x
    #20;
    zx          = 0 ;
    nx          = 0 ;
    zy          = 0 ;
    ny          = 1 ;
    f           = 1 ;
    no          = 1 ;

    // Compute x&y
    #20;
    zx          = 0 ;
    nx          = 0 ;
    zy          = 0 ;
    ny          = 0 ;
    f           = 0 ;
    no          = 0 ;

    // Compute x|y
    #20;
    zx          = 0 ;
    nx          = 1 ;
    zy          = 0 ;
    ny          = 1 ;
    f           = 0 ;
    no          = 1 ;

end

always #10 a = a + 1;

wire half_adder_sum, half_adder_carry;
wire full_adder_sum, full_adder_carry;

wire [15:0] add16   ;
wire [15:0] inc16_a ;


Not16 u_Not16_1(
    .in     (a      ),
    .out    (not_a  )
);


HalfAdder u_HalfAdder_1(
    .a      (a[0]           ),
    .b      (a[1]           ),
    .sum    (half_adder_sum ),
    .carry  (half_adder_carry)
);

FullAdder u_FullAdder_1(
    .a      (a[0]           ),
    .b      (a[1]           ),
    .c      (a[2]           ),
    .sum    (full_adder_sum ),
    .carry  (full_adder_carry)
);

Add16 u_Add16_1 (
    .a      (a              ),
    .b      (not_a          ),
    .out    (add16          )
);

Inc16 u_Inc16_1 (
    .in     (a              ),
    .out    (inc16_a        )
);

ALU u_ALU_1 (
    .x      (x          ),
    .y      (y          ),
    .zx     (zx         ),
    .nx     (nx         ),
    .zy     (zy         ),
    .ny     (ny         ),
    .f      (f          ),
    .no     (no         ),
    .out    (alu_output ),
    .zr     (zr         ),
    .ng     (ng         )
);

endmodule
