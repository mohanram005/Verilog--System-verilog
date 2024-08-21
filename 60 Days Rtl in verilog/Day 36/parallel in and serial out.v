// Code your design here
// Code your design here

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



    
  
  
  
  
