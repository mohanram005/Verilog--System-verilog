// Code your design here

module d_ff(
  input d,
  input clk,
  input reset,
  output reg q
);
  
  always@(posedge clk or posedge reset) begin
    
    if(reset)
      
      q <= 0;
    else
      
      q <= d;
  end
  
endmodule
    
    
