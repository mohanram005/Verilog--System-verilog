// Code your design here


module d_ff(input clk,reset,d,
       output reg q);
  
  always@(posedge clk or posedge reset) begin
    
    if(reset)
      q <= 1'b0;
    else 
      q <= d;
  end
endmodule


module pipo(input clk, reset,
            input [3:0]parallel_in,
            output reg [3:0]parallel_out);
  
  reg[3:0] pipo;
  
  d_ff ff1(.clk(clk),.reset(reset),.d(parallel_in[0]),.q(pipo[0]));
  d_ff ff2(.clk(clk),.reset(reset),.d(parallel_in[1]),.q(pipo[1]));
  d_ff ff3(.clk(clk),.reset(reset),.d(parallel_in[2]),.q(pipo[2]));
  d_ff ff4(.clk(clk),.reset(reset),.d(parallel_in[3]),.q(pipo[3]));
  
  always@(*) begin
  
   parallel_out = pipo;
  end
  
endmodule


// Code your testbench here
// or browse Examples


module pipo_tb;
  
  reg clk, reset;
  reg  [3:0]parallel_in;
  wire [3:0] parallel_out;
  
  pipo dut(clk, reset,parallel_in,parallel_out);
  
  initial  begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    
    reset = 1;
        parallel_in = 4'b0000;
        #15;

        // Release reset
        reset = 0;
        #50;

        // Input parallel data
        parallel_in = 4'b1010; #10;
    
        parallel_in =4'b1110; #10; // use this like clk pluse if not it will not shows stimulation
        
    #100 $finish;
  end
  initial  begin
    $monitor("time%0t | reset = %b | parallel_in = %b | parallel_out %b ",$time,reset,parallel_in,parallel_out);
  end
  
  initial begin
    $dumpfile("pipo.vcd");
    $dumpvars(1,pipo_tb);
  end
endmodule
    
    
    
