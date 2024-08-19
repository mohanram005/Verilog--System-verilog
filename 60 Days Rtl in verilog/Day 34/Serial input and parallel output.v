// Code your testbench here
// or browse Examples



module sipo_tb;
  
  reg clk,reset;
  reg [3:0] serial_in;
  wire [3:0] parallel_out;
  
  sipo dut(clk,reset,serial_in,parallel_out);
  
  initial begin
    
    clk = 0;
    
    forever #5 clk = ~clk;
  end
  initial begin
    
     // Initialize
        reset = 1;
        serial_in = 0;
        #15;//important initialize the reset =1 otherwise it will show xx 

    
    reset = 0; #10;
    
    serial_in = 1; #10 ;
    
    serial_in = 0; #10;
    
    serial_in = 1; #10;
    
    serial_in = 0; #10; 
    
    
   #100 $finish;
  end
  initial begin
    $monitor("time = %0t  | reset = %b | serial_in = %b | parallel_out = %b",$time,reset,serial_in,parallel_out);//if the o/p double remove the clk
  end
  initial begin
    $dumpfile("sipo.vcd");
    $dumpvars(1,sipo_tb);
  end
  
endmodule
    
      
 
