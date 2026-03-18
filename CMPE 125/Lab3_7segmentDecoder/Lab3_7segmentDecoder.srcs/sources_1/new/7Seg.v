module sevenSegment (
  input  [3:0] sw,
  output [6:0] seg,
  output [3:0] an
);
  wire D3=sw[3], D2=sw[2], D1=sw[1], D0=sw[0];

  assign seg[6] = (~D3 & ~D2 & ~D1) | (~D3 &  D2 &  D1 &  D0);
  assign seg[5] = ( D3 &  D2 & ~D1) | (~D3 & ~D2 &  D0) | (~D3 &  D1 &  D0) | (~D3 & ~D2 &  D1);
  assign seg[4] = (~D3 &  D2 & ~D1) | (~D3 &  D0) | ( D3 & ~D2 & ~D1 & D0);
  assign seg[3] = (~D3 &  D2 & ~D1 & ~D0) | (~D2 & ~D1 &  D0) | ( D2 &  D1 &  D0) | ( D3 & ~D2 &  D1 & ~D0);
  assign seg[2] = ( D3 &  D2 & ~D0) | ( D3 &  D2 &  D1) | (~D3 & ~D2 &  D1 & ~D0);
  assign seg[1] = ( D3 &  D2 & ~D0) | (~D3 &  D2 & ~D1 & D0) | ( D3 &  D1 &  D0) | ( D3 &  D2 &  D1) | ( D2 &  D1 & ~D0);
  assign seg[0] = ( D2 & ~D1 & ~D0) | ( D3 &  D2 & ~D1) | (~D3 & ~D2 & ~D1 & D0) | ( D3 & ~D2 &  D1 & D0);

  assign an = 4'b1110; 
endmodule