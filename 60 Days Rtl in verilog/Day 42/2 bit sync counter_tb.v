module sync_counter_tb;
  
  reg clk;
  reg reset;
  wire [1:0] count;
  
  sync_counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
  );
  
  initial begin
   
    clk = 0;
    reset = 1;
    
    #10 reset = 0;
    
    
    #100 $finish;
  end
  
  // Clock generation
  always #5 clk = ~clk; // instead of forever clk
  
  
  initial begin
    $monitor("time = %0d | clk = %b | reset = %b | count = %b", $time, clk, reset, count);
  end
  initial begin
    $dumpfile(" sync_counter.vcd");
    $dumpvars(1,sync_counter_tb);
  end
  
endmodule
