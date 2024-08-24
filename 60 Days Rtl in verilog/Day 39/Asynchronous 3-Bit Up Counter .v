// Code your design here
// Code your design here


module jk_ff(input clk,reset,j,k,
             output reg q,q_bar);
  
  assign q_bar = ~q;
  
  always@(posedge clk or posedge reset ) begin
    if(reset) begin
      
      q <= 0;
    end else begin
      
      case({j,k})
        
        2'b00 : q = q;
        2'b01 : q = 1'b0;
        2'b10 : q = 1'b1;
        2'b11 : q = q_bar;
      endcase
    end
  end
endmodule

module up_counter(input clk,reset,
                  output[3:0] count);
  
  wire[2:0] j; 
  wire[2:0] k;
  wire [2:0]q;
  
  
  assign count =  q;
  
  jk_ff ff0 (.clk(clk), .reset(reset), .j(1'b1), .k(1'b1), .q(q[0]));
  jk_ff ff1 (.clk(~q[0]), .reset(reset), .j(1'b1), .k(1'b1), .q(q[1]));
  jk_ff ff2 (.clk(~q[1]), .reset(reset), .j(1'b1), .k(1'b1), .q(q[2]));
  
endmodule



