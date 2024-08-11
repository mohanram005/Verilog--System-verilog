// Code your design here
module jk_ff (input clk,reset,j,k,
        output reg q,q_bar);
  
  assign q_bar = ~q;
  
  always@(posedge clk or posedge reset) begin
    
    if(reset) 
      q<=0;
    else begin
    case({j,k})
      2'b00 : q <= q;
      2'b01 :q <= 0;
      2'b10 :q <= 1;
      2'b11 :q <= ~q;
    endcase
    end
  end
endmodule

module master_slave(input clk,reset,j,k,
        output q,q_bar);
  
  wire master_q,master_qbar;
  
  jk_ff master(.clk(clk),.reset(reset),.j(j),.k(k),.q(master_q),.q_bar(master_qbar));//clk = 1 master on
  
  jk_ff slave(.clk(~clk),.reset(reset),.j(master_q),.k(master_qbar),.q(q),.q_bar(q_bar)); // clk =1 slave off
    
  
endmodule
 
