// Code your testbench here
// or browse Examples


module down_counter_tb;
  
  reg clk,reset;
  wire[2:0] count;
  
  down_counter dut(.clk(clk),
        .reset(reset),
        .count(count));
  
  initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end
  initial begin
    $monitor("time =%0t | clk=%b  |reset=%b | count=%d",$time,clk,reset,count);
    
    
    reset = 1; #10;
    reset = 0; 
    
    
    #300$finish;
  
  end
  initial begin
    $dumpfile("tff.vcd");
    $dumpvars(1,down_counter_tb);
  end
   
endmodule
  
    
   
