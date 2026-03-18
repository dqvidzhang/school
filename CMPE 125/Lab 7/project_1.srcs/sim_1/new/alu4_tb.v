`timescale 1ns/1ps

module alu4_tb;

    // DUT inputs
    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] ALUctl;

    // DUT outputs
    wire [3:0] Y;
    wire       Zero;
    wire       Overflow;

    // Instantiate the DUT (Device Under Test)
    alu4 dut (
        .A(A),
        .B(B),
        .ALUctl(ALUctl),
        .Y(Y),
        .Zero(Zero),
        .Overflow(Overflow)
    );

    // Task to apply one test vector and print result
    task apply_vec;
        input [2:0] op;
        input [3:0] a_in;
        input [3:0] b_in;
        input [3:0] y_exp;
        input       z_exp;
        input       ov_exp;
        begin
            ALUctl = op;
            A      = a_in;
            B      = b_in;

            #5;  // wait for combinational logic to settle

            $display("op=%b  A=%b  B=%b  |  Y=%b Z=%b Ov=%b  ||  expY=%b expZ=%b expOv=%b  -> %s",
                     ALUctl, A, B, Y, Zero, Overflow,
                     y_exp, z_exp, ov_exp,
                     (Y==y_exp && Zero==z_exp && Overflow==ov_exp) ? "OK" : "MISMATCH!");
        end
    endtask

    initial begin
        // Init
        A = 4'b0000;
        B = 4'b0000;
        ALUctl = 3'b000;
        #5;

        // ALUctl  Op   A      B      expY    expZ expOv   Comment

        apply_vec(3'b000, 4'b1010, 4'b1100, 4'b1000, 1'b0, 1'b0); // AND: 1010 & 1100 = 1000
        apply_vec(3'b001, 4'b1010, 4'b0101, 4'b1111, 1'b0, 1'b0); // OR : 1010 | 0101 = 1111

        apply_vec(3'b010, 4'b0010, 4'b0011, 4'b0101, 1'b0, 1'b0); // ADD: 2 + 3 = 5
        apply_vec(3'b010, 4'b0111, 4'b0011, 4'b1010, 1'b0, 1'b1); // ADD: 7 + 3 = 10 (overflow)
        apply_vec(3'b010, 4'b0101, 4'b1011, 4'b0000, 1'b1, 1'b0); // ADD: 5 + (-5) = 0, Zero=1

        apply_vec(3'b110, 4'b0101, 4'b0011, 4'b0010, 1'b0, 1'b0); // SUB: 5 - 3 = 2
        apply_vec(3'b110, 4'b0011, 4'b0101, 4'b1110, 1'b0, 1'b0); // SUB: 3 - 5 = -2 (1110)

        apply_vec(3'b111, 4'b0011, 4'b0101, 4'b0001, 1'b0, 1'b0); // SLT: 3 < 5 -> 0001
        apply_vec(3'b111, 4'b0101, 4'b0011, 4'b0000, 1'b1, 1'b0); // SLT: 5 !< 3 -> 0000, Zero=1

        apply_vec(3'b011, 4'b0000, 4'b0000, 4'b1111, 1'b0, 1'b0); // NOR: ~(0 | 0) = 1111
        apply_vec(3'b000, 4'b0101, 4'b1010, 4'b0000, 1'b1, 1'b0); // AND: Zero=1 case

        $display("All vectors applied.");
        $stop;   // end simulation (ModelSim/questa) / $finish also ok
    end

endmodule
