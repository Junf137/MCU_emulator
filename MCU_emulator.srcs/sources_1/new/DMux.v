`timescale 1ns / 1ps

module DMux (
    input   in  ,
    input   sel ,
    output  a   ,
    output  b   );

    wire notSel;

    not(notSel, sel);
    and(a, in, notSel);
    and(b, in, sel);
    
endmodule