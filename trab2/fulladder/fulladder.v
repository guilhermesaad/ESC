//
// Somador completo de 1 bit reusando o meio somador combinacional
//
`include "halfadder.v"

module fulladder(input a, input b, input carry_in, output sum, output carry_out);
  
  wire s1, c1, c2;
  
  halfadder h1(a, b, s1, c1);
  halfadder h2(s1, carry_in, sum, c2);

  assign carry_out = c1 | c2;

endmodule

