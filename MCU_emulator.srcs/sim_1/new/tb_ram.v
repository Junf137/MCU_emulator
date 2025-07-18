`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/27 12:41:29
// Design Name: 
// Module Name: tb_ram
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


module tb_ram();

reg             sys_clk ;
reg     [15:0]  D_in    ;

wire            latch_q ;
// wire            latch_q_;

wire            dff_q   ;
// wire            dff_q_  ;

wire            bit_o   ;
reg             bit_in  ;
reg             bit_load;

wire    [15:0]  register_o;

reg     [15:0]  ram_in  ;
reg     [15:0]  ram_in_m1  ;
reg             ram_load;
wire    [15:0]  ram8_o;
wire    [15:0]  ram64_o;
wire    [15:0]  ram512_o;
wire    [15:0]  ram4K_o;
wire    [15:0]  ram16K_o;

reg             pc_load, pc_inc, pc_rst;
wire    [15:0]  pc_o;


initial begin
    sys_clk     = 1 ;
    D_in        = 0 ;
    bit_in      = 0 ;
    bit_load    = 1 ;
    ram_in      = 0 ;
    ram_in_m1   = -1 ;
    #100;
    bit_load    = 0 ;
    #200;
    bit_load    = 1 ;
end

// testbench RAM
initial begin
    ram_load    = 1 ;
    #81920
    ram_load    = 0 ;
end

// testbench PC
initial begin
    pc_load     = 0 ;
    pc_inc      = 0 ;
    pc_rst      = 1 ;
    #20
    pc_load     = 1 ;
    pc_rst      = 0 ;
    #100
    pc_load     = 0 ;
    pc_rst      = 1 ;
    #20
    pc_rst      = 0 ;
    pc_inc      = 1 ;
    #100
    pc_inc      = 0 ;
end

always #10 sys_clk = ~sys_clk;   // 50MHz 系统时钟
always #3 D_in = D_in + 1 ;
always #20 ram_in = ram_in + 1;
always #20 ram_in_m1 = ram_in_m1 + 1;

D_Latch u_D_Latch_1 (
    .D      (D_in[0]    ),
    .clk    (sys_clk    ),
    .Q      (latch_q    ),
    // .Q_     (latch_q_   )
    .Q_     (   )
);

DFF u_DFF_1 (
    .D      (D_in[0]    ),
    .clk    (sys_clk    ),
    .S_     (1     ),
    .R_     (1     ),
    .Q      (dff_q      ),
    // .Q_     (dff_q_     )      
    .Q_     (     )      
);

Bit u_Bit_1 (
    .in     (D_in[0]    ),
    .load   (bit_load   ),
    .clk    (sys_clk    ),
    .out    (bit_o      )
);

PC u_PC_1 (
    .in     (ram_in     ),
    .load   (pc_load    ),
    .inc    (pc_inc     ),
    .rst    (pc_rst     ),
    .clk    (sys_clk    ),
    .out    (pc_o       )
);

Register u_Register_1 (
    .in     (D_in       ),
    .load   (bit_load   ),
    .clk    (sys_clk    ),
    .out    (register_o )
);

RAM8 u_RAM8_1 (
    .in     (ram_in         ),
    .load   (ram_load       ),
    .addr   (ram_in_m1[2:0]    ),
    .clk    (sys_clk        ),
    .out    (ram8_o         )
);

RAM64 u_RAM64_1 (
    .in     (ram_in         ),
    .load   (ram_load       ),
    .addr   (ram_in_m1[5:0]    ),
    .clk    (sys_clk        ),
    .out    (ram64_o        )
);

RAM512 u_RAM512_1 (
    .in     (ram_in         ),
    .load   (ram_load       ),
    .addr   (ram_in_m1[8:0]    ),
    .clk    (sys_clk        ),
    .out    (ram512_o       )
);

RAM4K u_RAM4K_1 (
    .in     (ram_in         ),
    .load   (ram_load       ),
    .addr   (ram_in_m1[11:0]   ),
    .clk    (sys_clk        ),
    .out    (ram4K_o        )
);

RAM16K u_RAM16K_1 (
    .in     (ram_in         ),
    .load   (ram_load       ),
    .addr   (ram_in_m1[11:0]   ),
    .clk    (sys_clk        ),
    .out    (ram16K_o        )
);

endmodule
