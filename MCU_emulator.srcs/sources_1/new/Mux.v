`timescale 1ns / 1ps


module Mux (
    input   a       ,
    input   b       , 
    input   sel     ,
    output  out     );
    
    wire notSel, res1, res2;

    not(notSel, sel);
    and(res1, notSel, a);
    and(res2, sel, b);
    or(out, res1, res2);


endmodule