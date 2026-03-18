`timescale 1ns/1ps
module tb_sevenSegment;
  reg  [3:0] sw;
  wire [6:0] sg;
  wire [3:0] an;

  
  sevenSegment dut(
    .sw(sw),
    .sg(sg),
    .an(an)
  );

  initial begin
   
    $display(" time  sw  | sg[g..a]  lit[g..a]  an");
    sw = 4'h0; #5;
    repeat (16) begin
      $display("%4t  0x%0h |   %07b     %07b   %04b",
               $time, sw, sg, sg_on_mask(sg), an);
      #20;
      sw = sw + 1;
    end

    $finish;
  end
endmodule
