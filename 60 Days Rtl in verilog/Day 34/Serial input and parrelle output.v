

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


