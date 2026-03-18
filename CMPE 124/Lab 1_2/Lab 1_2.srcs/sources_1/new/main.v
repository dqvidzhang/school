`timescale 1ns / 1ps

module main (
    input A, B, C,
    input sel1, sel2,
    output Y
);

    wire s1n, s2n, o1, o2, o3;
    
    not (s1n, sel1);  
    not (s2n, sel2); 
    
    and (o1, A, s1n, s2n);  
    and (o2, B, s1n, sel2);  
    and (o3, C, sel1);       
    or (Y, o1, o2, o3); 

endmodule

