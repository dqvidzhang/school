module alu4 (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] ALUctl,
    output reg [3:0] Y,
    output       Zero,
    output       Overflow
);

    wire [3:0] B_eff;
    wire [3:0] sum;
    wire       cin;

    // For SUB (ALUctl = 110), use A + (~B) + 1 = A - B
    assign cin   = (ALUctl == 3'b110);          // 1 for SUB, 0 otherwise
    assign B_eff = (ALUctl == 3'b110) ? ~B : B;
    assign sum   = A + B_eff + cin;             // 4-bit adder

    // Signed overflow detection for add/sub:
    // overflow when inputs have same sign, result has different sign
    wire Ov_addsub = (A[3] & B_eff[3] & ~sum[3]) |
                     (~A[3] & ~B_eff[3] & sum[3]);

    // Main ALU result
    always @* begin
        case (ALUctl)
            3'b000: Y = A & B;                  // AND
            3'b001: Y = A | B;                  // OR
            3'b010: Y = sum;                    // ADD
            3'b110: Y = sum;                    // SUB (same adder, different inputs)
            3'b111: Y = (A < B) ? 4'b0001 : 4'b0000; // SLT (unsigned compare)
            3'b011: Y = ~(A | B);               // NOR
            default: Y = 4'b0000;
        endcase
    end

    // Flags
    assign Zero     = (Y == 4'b0000);
    assign Overflow = (ALUctl == 3'b010 || ALUctl == 3'b110) ? Ov_addsub : 1'b0;

endmodule
