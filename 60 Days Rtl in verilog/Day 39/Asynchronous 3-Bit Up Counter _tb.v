

module upcounter_tb;
  
  reg clk,reset;
  wire[2:0] count;
  
  up_counter dut(.clk(clk),
        .reset(reset),
        .count(count));
  
  initial begin
        clk = 0;
        forever #10 clk = ~clk; // Clock with a period of 10 time units
    end
  initial begin
    $monitor("time =%0t | clk=%b  |reset=%b | count=%d",$time,clk,reset,count);
    
    
    reset = 1; #10;
    reset = 0; 
    
    
    #300$finish;
  
  end
  initial begin
    $dumpfile("jk_ff.vcd");
    $dumpvars(1,upcounter_tb);
  end
   
endmodule
  
    
    


                  
                  
                  
