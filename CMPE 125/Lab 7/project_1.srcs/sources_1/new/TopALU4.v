module top_basys3_alu4 (
    input  [15:0] sw,   // Basys3 switches
    output [15:0] led   // Basys3 LEDs
);

    // Input mapping from switches
    wire [3:0] A      = sw[3:0];    // A = SW0..SW3
    wire [3:0] B      = sw[7:4];    // B = SW4..SW7
    wire [2:0] ALUctl = sw[10:8];   // ALU control = SW8..SW10

    wire [3:0] Y;
    wire       Zero;
    wire       Overflow;

    // Instantiate the ALU
    alu4 dut (
        .A(A),
        .B(B),
        .ALUctl(ALUctl),
        .Y(Y),
        .Zero(Zero),
        .Overflow(Overflow)
    );

    // Output mapping to LEDs
    assign led[3:0]   = Y;          // result
    assign led[4]     = Zero;       // zero flag
    assign led[5]     = Overflow;   // overflow flag

    assign led[9:6]   = A;          // show A
    assign led[13:10] = B;          // show B

    assign led[15:14] = 2'b00;      // unused

endmodule
