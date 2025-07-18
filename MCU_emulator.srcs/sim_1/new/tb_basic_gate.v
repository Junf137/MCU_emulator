`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/18 16:30:09
// Design Name: 
// Module Name: tb_basic_gate
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


module tb_basic_gate();

reg [15:0]   a       ;

initial begin
    a           = 0;
end

always #10 a = a + 1;

// testing module unit
wire        a0n     ;

wire        and_a0_a1   ;
wire        or_a0_a1    ;

wire [15:0] and_a_b     ;
wire [15:0] or_a_b      ;
wire [15:0] not_a       ;

wire        or_8_way    ;

wire        xor_a0_a1   ;

wire        mux_a0_a1   ;
wire [15:0] mux16_a_b   ;
wire [15:0] mux4way16_a ;
wire [15:0] mux8way16_a ;

wire        dmux_a      ;
wire        dmux_b      ;
wire        dmux4way_a  ;
wire        dmux4way_b  ;
wire        dmux4way_c  ;
wire        dmux4way_d  ;
wire        dmux8way_a  ;
wire        dmux8way_b  ;
wire        dmux8way_c  ;
wire        dmux8way_d  ;
wire        dmux8way_e  ;
wire        dmux8way_f  ;
wire        dmux8way_g  ;
wire        dmux8way_h  ;

Not  u_Not_1(
    .out    (a0n ), 
    .in     (a[0]  )
    );

And u_And_1(
    .a      (a[0]),
    .b      (a[1]),
    .out    (and_a0_a1)
);

Or u_Or_1(
    .a      (a[0]),
    .b      (a[1]),
    .out    (or_a0_a1)
);

Not16 u_Not16_1(
    .in     (a      ),
    .out    (not_a  )
);

And16 u_And16_1(
    .a      (a      ),
    .b      (not_a  ),
    .out    (and_a_b)
);

Or16 u_Or16_1(
    .a      (a      ),
    .b      (not_a  ),
    .out    (or_a_b)
);

Or8Way u_Or8Way_1 (
    .in     (a[7:0]     ),
    .out    (or_8_way   )
);


Xor u_Xor_1 (
    .a      (a[0]       ),
    .b      (a[1]       ),
    .out    (xor_a0_a1  )
);

Mux u_Mux_1(
    .a      (a[0]       ),
    .b      (a[1]       ),
    .sel    (a[2]       ),
    .out    (mux_a0_a1  )
);

Mux16 u_Mux16_1(
    .a      (a          ),
    .b      (not_a      ),
    .sel    (a[15]      ),
    .out    (mux16_a_b  )
);

Mux4Way16 u_Mux4Way16_1 (
    .a      (a          ),
    .b      (not_a      ),
    .c      (not_a      ),
    .d      (a          ),
    .sel    (a[1:0]     ),
    .out    (mux4way16_a)
);

Mux8Way16 u_Mux8Way16_1 (
    .a      (a          ),
    .b      (not_a      ),
    .c      (not_a      ),
    .d      (a          ),
    .e      (a          ),
    .f      (not_a      ),
    .g      (not_a      ),
    .h      (a          ),
    .sel    (a[2:0]     ),
    .out    (mux8way16_a)
);

DMux u_DMux_1 (
    .in     (a[0]   ),
    .sel    (a[1]   ),
    .a      (dmux_a ),
    .b      (dmux_b )
);

DMux4Way u_DMux4Way_1 (
    .in     (a[0]       ),
    .sel    (a[1:0]     ),
    .a      (dmux4way_a ),
    .b      (dmux4way_b ),
    .c      (dmux4way_c ),
    .d      (dmux4way_d )
);

DMux8Way u_DMux8Way_1 (
    .in     (a[0]       ),
    .sel    (a[2:0]     ),
    .a      (dmux8way_a ),
    .b      (dmux8way_b ),
    .c      (dmux8way_c ),
    .d      (dmux8way_d ),
    .e      (dmux8way_e ),
    .f      (dmux8way_f ),
    .g      (dmux8way_g ),
    .h      (dmux8way_h )
);


endmodule
