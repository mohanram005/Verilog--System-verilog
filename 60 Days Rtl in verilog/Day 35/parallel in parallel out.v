// Code your design here


module d_ff(input clk,reset,d,
       output reg q);
  
  always@(posedge clk or posedge reset) begin
    
    if(reset)
      q <= 1'b0;
    else 
      q <= d;
  end
endmodule


module pipo(input clk, reset,
            input [3:0]parallel_in,
            output reg parallel_out_a,
           parallel_out_b,
           parallel_out_c,
           
           parallel_out_d
           );
  
  reg[3:0] pipo;
  
  d_ff ff1(.clk(clk),.reset(reset),.d(parallel_in[0]),.q(pipo[0]));
  d_ff ff2(.clk(clk),.reset(reset),.d(parallel_in[1]),.q(pipo[1]));
  d_ff ff3(.clk(clk),.reset(reset),.d(parallel_in[2]),.q(pipo[2]));
  d_ff ff4(.clk(clk),.reset(reset),.d(parallel_in[3]),.q(pipo[3]));
  
  always@(*) begin
  
    parallel_out_a = pipo[0];
    parallel_out_b = pipo[1];
    parallel_out_c = pipo[2];
    parallel_out_d = pipo[3];
  end
  
endmodule


