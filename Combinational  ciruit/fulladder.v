module fulladder (
  input a,
  input b,
  input c,
  output sum,
  output cout
);
  assign sum = a ^ b ^ c;
  assign cout = (a & b) | (b & c) | (a & c);
endmodule
