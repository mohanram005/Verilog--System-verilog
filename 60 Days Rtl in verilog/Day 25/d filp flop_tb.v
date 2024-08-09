// Code your testbench here
// or browse Examples

module dff_tb;
  
  reg d,clk,reset;
  wire q;
  
  dff df(d,clk,reset,q);
  
  initial begin
    
    clk=0;
    
    forever #5 clk =~ clk;
  end
  
  initial begin
    
     $monitor("Time = %0t | D = %b | clk = %b | reset = %b | Q = %b", 
                  $time, d,clk,reset,q);
    
    reset=1; d=1; #10;
    
    reset=0; d=1; #10;
    
    
    d=1;#10;
    
    d=0;#10;
    
    d=1;#10;
    
    reset=1;  #10;
    
    reset=0; d=1; #10;
    
    $finish;
    
  end
  initial begin
    $dumpfile("dff");
    $dumpvars(0,dff_tb);
  end
endmodule
    
    
