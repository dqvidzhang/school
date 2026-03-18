    `timescale 1ns / 1ps
    //////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 02/12/2025 09:24:58 AM
    // Design Name: 
    // Module Name: main
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
    
    
    module main(
        input A, B, S, 
        output Y
        
        );
        wire s_in, o1, o2;  //since there 3 'wires' that connect the output of the gates
        not (s_in, S);  //the not gate is connected through S and s_in
        and (o1, A, S); //
        and (o2, B, s_in);
        or (Y, o1, o2);
        
        
    endmodule
