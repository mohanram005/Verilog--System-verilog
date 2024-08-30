module ring;
  
  reg clk;
  reg reset;
  wire [3:0] q;
  
  ring_counter uut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );
  
  initial begin
    
    clk = 0;
    reset = 1;
    
    #10 reset = 0;
    
   
    #100 $finish;
  end
  
  
  always #5 clk = ~clk; 
  

  initial begin
    $monitor("time = %0d | clk = %b | reset = %b | q = %b", $time, clk, reset, q);
   
  end
  initial begin
    $dumpfile("ring_counter.vcd");
    $dumpvars(1,ring);
  end
  
  
endmodule
