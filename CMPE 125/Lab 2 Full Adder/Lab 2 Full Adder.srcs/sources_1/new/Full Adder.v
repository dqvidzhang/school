module full_adder (
    input A, B, Cin,
    output Cout, Sum  
);
    assign Sum = A ^ B ^ Cin;                    // Sum
    assign Cout = (A & B) | (B & Cin) | (A & Cin); // Carry
endmodule
