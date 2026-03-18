`timescale 1ns/1ps

module top_basys3_alu4_tb;

  reg  [15:0] sw;
  wire [15:0] led;

  top_basys3_alu4 dut (
    .sw(sw),
    .led(led)
  );

  initial begin
    // Case: A=3 (0011), B=5 (0101), ALUctl=ADD (010)
    sw = 16'b0000_0000_0000_0000;
    #10;

    // ALUctl = 010 on sw[10:8]
    sw[10:8] = 3'b010;
    // A = 0011 on sw[3:0]
    sw[3:0]  = 4'b0011;
    // B = 0101 on sw[7:4]
    sw[7:4]  = 4'b0101;

    #20;   // let you see it in the waveform

    // Add more test cases here if you want...

    #100;
    $stop;
  end

endmodule
