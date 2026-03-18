`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2025 10:03:01 AM
// Design Name: 
// Module Name: part2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 2-to-1 Multiplexer Testbench
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module part2;
    reg A, B, S;
    wire Y;

    // Instantiate the 2-to-1 Multiplexer
    main muxtb(
        .Y(Y),
        .A(A),
        .B(B),
        .S(S)
    );

    // Test cases
    initial begin
        A = 0; B = 0; S = 0; #10;
        A = 0; B = 0; S = 1; #10;
        A = 0; B = 1; S = 0; #10;
        A = 0; B = 1; S = 1; #10;
        A = 1; B = 0; S = 0; #10;
        A = 1; B = 0; S = 1; #10;
        A = 1; B = 1; S = 0; #10;
        A = 1; B = 1; S = 1; #10;

        // Uncomment for exhaustive testing
        /*
        for(A = 0; A <= 1; A = A + 1) begin
            for(B = 0; B <= 1; B = B + 1) begin
                for(S = 0; S <= 1; S = S + 1) begin
                    #10; 
                end
            end
        end
        */

        $finish;
    end

    // Monitor output values
    initial begin
        $monitor("At time = %t | A = %b | B = %b | S = %b | Y = %b", $time, A, B, S, Y);
    end

endmodule
