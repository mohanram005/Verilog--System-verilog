// Code your testbench here
// or browse Examples
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
