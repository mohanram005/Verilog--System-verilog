// Code your design here


module upcount(input clk,reset,
               output reg [3:0] count);
  
  always@(posedge clk or posedge reset)begin
    
    if(reset)
      count <=4'b0000;
    else
      count <= count + 1;
  end
endmodule

// Code your testbench here
// or browse Examples

module upcount_tb;
  
  reg clk,reset;
  wire[3:0] count;
  
  upcount dut(.clk(clk),
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
   
endmodule
  
    
    
