// Code your design here

// 3 bit up/down counter without flipflop
module updown(input clk,reset,updown,
              output reg [3:0] count);
  
 
  
  always@(posedge clk or posedge reset) begin
    
    if(reset)
      count <=0;
  else
    if(updown == 1)
      if(count == 15)
        count <= 0;
  	  else
        count <= count + 1;
    else
    
      if(count == 0)
        count <= 15;
      else
        count <= count - 1;
  end
endmodule
  

