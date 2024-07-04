// Code your design here


module d_ff(input clk,reset,
            input d,
            output reg q);
  
  always@(negedge clk or negedge reset) begin
    
    if(reset)
      
      q <= 0;
    
    else
      
      q <= d;
  end
endmodule
       
  module dff_tb;
  
  reg clk,reset,d;
  wire q;
  
  d_ff df(clk,reset,d,q);
  
  initial begin
    
    clk=0;
    
    forever #5 clk =~ clk;
  end
  
  initial begin
    
    $monitor("Time = %0t | clk = %b | reset = %b |   D = %b | Q = %b", 
                  $time, clk,reset,d,q);
    
    reset=0; d=1; #10;
    
    reset=1; d=1; #10;
    
    
    d=1;#10;
    
    d=0;#10;
    
    d=1;#10;
    
    reset=1;  #10;
    
    reset=0; d=1; #10;
    
    $finish;
    
  end
  initial begin
    $dumpfile("d_ff.vcd");
    $dumpvars(0,dff_tb);
  end
endmodule
    
