// Code your design here
module tff (
    input t,           
    input clk,        
    input reset,       
    output reg q      
);

    
  always@(posedge clk) begin //synchronous now to change it to asynchronous give posedge reset
    if(!reset) q <= 0;
          else begin
           q <= (t?~q:q);
           end
      end
 

endmodule
