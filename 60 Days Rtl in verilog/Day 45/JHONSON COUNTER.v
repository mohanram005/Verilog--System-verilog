
// JHONSON counter 
//no. of flip flop(n)= 2^n states
module d_ff(input clk,reset,d,
            output reg q,
            output q_bar);
  
  assign q_bar = ~q;
  
  always@(posedge clk or posedge reset)
    
    if(reset)
      
      q <= 0;
  else begin
    
    q<=d;
    
  end
endmodule

module  jhonson_counter(input clk,reset,
                        output Q0,
                        output Q1,
                        output Q2,
                        output Q3);
  
  wire [3:0]q;
  wire [3:0]q_bar;
  
  
  
  d_ff dd0(.clk(clk),.reset(reset),.d(q_bar[3]),.q(q[0]),.q_bar(q_bar[0]));
  d_ff dd1(.clk(clk),.reset(reset),.d(q[0]),.q(q[1]),.q_bar(q_bar[1]));
  d_ff dd2(.clk(clk),.reset(reset),.d(q[1]),.q(q[2]),.q_bar(q_bar[2]));
  
  d_ff dd3(.clk(clk),.reset(reset),.d(q[2]),.q(q[3]),.q_bar(q_bar[3]));
  
  
  assign Q0 = q[0];
  assign Q1 = q[1];
  assign Q2 = q[2];
  assign Q3 = q[3];// dont use the assign inside the always block
  
endmodule

