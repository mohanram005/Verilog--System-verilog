// Code your design here


module halfsub(input a,b,
               output result,barrow);
  
  assign result = a ^ b;
  assign barrow = ~a & b;
  
endmodule
  

module fullsub(input a,b,cin,
              output result,barrow);
  
  wire r,b1,b2;
  
  halfsub dut1(.a(a),.b(b),.result(r),.barrow(b2));
  
  halfsub dut2(.a(r),.b(cin),.result(result),.barrow(b1));
  
  assign barrow = b2 | b1;
  
endmodule
              
              
                                                
  
  // Code your testbench here
// or browse Examples

module fullsub_tb;
  
  reg a,b,cin;
  wire result,barrow;
  
  fullsub dut(a,b,cin,result,barrow);
  
  initial begin
    
    $monitor("time = %0t | a = %b | b = %b |c = %b| result = %b | barrow = %b ",$time,a,b,cin,result,barrow);
    
    a = 0; b  =0; cin = 0; #10;
    a = 0; b  =0; cin = 1; #10;
    a = 0; b  =1; cin = 0; #10;
    a = 0; b  =1; cin = 1; #10;
    a = 1; b  =0; cin = 0; #10;
    a = 1; b  =0; cin = 1; #10;
    a = 1; b  =1; cin = 0; #10;
    a = 1; b  =1; cin = 1; #10;
    
    #100$finish;
  end
endmodule
    
    
