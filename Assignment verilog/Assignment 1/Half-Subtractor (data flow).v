// Code your design here


module halfsub(input a,b,
               output result,barrow);
  
  assign result = a ^ b;
  assign barrow = ~a & b;
  
endmodule

// Code your testbench here
// or browse Examples

module halfsub_tb;
  
  reg a,b;
  wire result,barrow;
  
  halfsub dut(a,b,result,barrow);
  
  initial begin
    
    $monitor("time = %0t | a = %b | b = %b | result = %b | barrow = %b ",$time,a,b,result,barrow);
    
    a = 0; b  =0; #10;
    a = 0; b  =1; #10;
    a = 1; b  =0; #10;
    a = 1; b  =1; #10;
    
    
  end
endmodule
    
    
