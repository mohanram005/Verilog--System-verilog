module basic_gates(
  input a,b,
  output and_out,
  output or_out,
  output not_out,
  output nand_out,
  output xor_out
);
  
  assign and_out = a & b; // assign means a continous assignment 
  assign or_out = a | b;
  assign not_out = ~b;
  assign nand_out = ~(a & b);
  assign xor_out = a ^ b;
  
endmodule
  
  
