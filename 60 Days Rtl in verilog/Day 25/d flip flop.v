// Code your design here
module dff(input d,clk,
           input reset,
           output reg q);
           
  always@(posedge clk)
    
    if(reset) begin
      
      
      q<=0;
    end else begin
      
      q<=d;
      
    end
endmodule
