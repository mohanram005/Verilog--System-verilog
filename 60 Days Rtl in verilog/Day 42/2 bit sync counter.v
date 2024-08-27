// Code your design here

module jk_ff (
    input clk, reset, j, k,
    output reg q,
    output q_bar
);

  assign q_bar = ~q;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      q <= 0;
    end else begin
      case ({j, k})
        2'b00: q <= q;        
        2'b01: q <= 1'b0;     
        2'b10: q <= 1'b1;    
        2'b11: q <= q_bar;   
      endcase
    end
  end
endmodule


module sync_counter (
    input clk, reset,
    output [1:0] count
);

  wire [1:0] q; //tempeory value

  assign count = q; 

  jk_ff ff0 (.clk(clk), .reset(reset), .j(q[1]), .k(q[1]), .q(q[0]));
  jk_ff ff1 (.clk(clk), .reset(reset), .j(1'b1), .k(1'b1), .q(q[1]));

endmodule

