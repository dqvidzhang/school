`timescale 1ns/1ps

module full_adder_tb;
    // Inputs
    reg A, B, Cin;

    // Outputs
    wire Cout, Sum;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout),
        .Sum(Sum)
    );

    integer i;

    initial begin
        $display(" A  B  Cin | Sum Cout ");
        $display("----------------------");

        // Loop through all 8 input cases
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i[2:0];  // assign A, B, Cin
            #10; // wait 10 ns
            $display(" %b  %b   %b  |  %b    %b", A, B, Cin, Sum, Cout);
        end

        $stop; // end simulation
    end
endmodule
