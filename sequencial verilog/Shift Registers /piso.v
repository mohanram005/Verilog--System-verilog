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





module piso(input clk,reset,load,
            input [3:0]parallel_in,
            output reg serial_out);
  
  reg[3:0]q; // tempory storage
  always@(posedge clk or posedge reset) begin
    if(reset)
      
      q <= 4'b0000;
    else if(load)
      
      q <= parallel_in;
    else
      
      q <= {1'b0,q[3:1]};//right shift in  = 1010 o/p 0,010 serial_out = 0 ,1010 the last 0 is  shifted as serialout
    
    
  end
  always@(*) begin
      serial_out = q[0];
  end
endmodule


// Code your testbench here
// or browse Examples


module piso_tb;
  
  reg clk,reset,load;
  reg[3:0]parallel_in;
  wire serial_out;
  
  piso ps(clk,reset,load,parallel_in,serial_out);
  
  initial begin
    
    clk = 1;
    forever #5 clk = ~clk;
    
  end
  
  initial begin
    
    reset =0;
    load = 1;
    parallel_in = 4'b1010;
    #10;
    
    reset = 0;
    load = 0;
    #40;
    
    reset =0;
    load = 1;
    parallel_in = 4'b1110;
    #10;
    
    
    reset = 0;
    load = 0;
    #40;
    $finish;
    
  end
  
  initial begin
     $monitor("Time=%0d, Reset=%b, Load=%b, Parallel In=%b, Serial Out=%b", $time, reset, load, parallel_in, serial_out);
    end
  initial begin
    $dumpfile("piso.vcd");
    $dumpvars(0,piso_tb);
  end
endmodule
    
  
  
  
  
