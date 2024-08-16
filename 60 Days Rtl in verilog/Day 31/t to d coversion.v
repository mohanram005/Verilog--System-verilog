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

module d_ff (
    input d,           
    input clk,        
    input reset,       
    output reg q
);
  
  wire t;
  assign t = d ^ q;
  
  tff uut(.t(t),.clk(clk),.reset(reset),.q(q));
  
endmodule
  
  
 
