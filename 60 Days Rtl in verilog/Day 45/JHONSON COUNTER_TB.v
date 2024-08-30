// Code your testbench here
// or browse Examples

module jhonson_counter_tb;
  
  reg clk,reset;
  
 
  wire Q0,Q1,Q2,Q3;
  
  jhonson_counter jc(clk,reset,Q0,Q1,Q2,Q3);
  
  initial begin
    
    clk=0;
    forever #5 clk = ~clk ;
    
  end
  initial begin
    
    $monitor("time = %0t | clk = %b | reset = %b  | Q0 = %b | Q1 = %b | Q2 = %b | Q3 = %b",$time,clk,reset,Q0,Q1,Q2,Q3);
    
    
    reset = 1; 
    #10;
    
    reset = 0;
    
    #200 $finish;
    
  end
  initial begin 
    $dumpfile("jhonson_counter.vcd ");
    $dumpvars(0,jhonson_counter_tb);
  end
endmodule
  
  
