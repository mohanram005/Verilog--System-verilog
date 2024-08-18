module d_ff(input clk,reset,d,
            output reg q);
  
  always@(posedge clk or posedge reset) begin
    if(reset)
      q<=0;
    else 
      q<=d;
  end
endmodule


module siso(input clk,reset,in,
            output q3,q2,q1,q0
           );
  
//   wire[3:0]q_int;
  
  d_ff ff1(.clk(clk),
           .reset(reset),
           .d(in),
           .q(q3)
             );
   d_ff ff2(.clk(clk),
           .reset(reset),
            .d(q3),
            .q(q2)
             );
  d_ff ff3(.clk(clk),
           .reset(reset),
           .d(q2),
           .q(q1)
             );
  d_ff ff4(.clk(clk),
           .reset(reset),
           .d(q1),
           .q(q0)
          );
  
//   assign q = q_int[3];
  
endmodule

