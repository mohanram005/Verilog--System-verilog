module halfsub(input a,b,
               output sum,carry);
  
  assign sum = a ^ b;
  assign carry = ~a & b;
  
endmodule


module halfsub_tb;
  
  reg a,b;
  wire sum,carry;
  
  halfsub uut(a,b,sum,carry);
  
  initial begin
    
    $monitor("time = %0t | a = %b |b = %b |sum = %b |result = %b",$time,a,b,sum,carry);
    
    a =0 ; b = 0; #10;
    
    a =0 ; b = 1; #10;
    
    a =1 ; b = 0; #10;
    
    a =1; b = 1; #10;
  end
  initial begin
    $dumpfile("halfsub.vcd");
    $dumpvars(1,halfsub_tb);
  end
endmodule
