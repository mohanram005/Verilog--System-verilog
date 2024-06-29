// Code your design here

//no d flipflop required


module sipo(input clk,reset,
            input serial_in,
            output reg [3:0] parallel_out);
  
  reg [3:0]shifter;
  
  always@(posedge clk or posedge reset) begin
    if(reset)
      shifter <= 4'b0000;
    else 
      shifter <= {shifter[2:0],serial_in};// serial_in = 1 o/p =0001
    
    
  end
  always@(*) begin
    parallel_out =  shifter;
  end
endmodule


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
endmodule
    
      
  
