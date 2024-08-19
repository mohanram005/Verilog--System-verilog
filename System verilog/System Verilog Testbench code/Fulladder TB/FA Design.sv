// Code your design here

module fulladder(
  x,y,z,sum,carry);
  
  input x,y,z;
  
  output wire sum,carry;
  
  assign sum = x^y^z;
  assign carry = (x&y) | (y&z) |(x&z);
  
endmodule
  
  
  
