// Code your design here

// coversion sr flip flop to jk flip flop
module sr_ff(
  input s, r,
  input clk, reset,
  output reg q,
  output qbar
);
  
  assign qbar = ~q;
  
  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else begin
      case ({s, r})
        2'b00: q <= q;   
        2'b01: q <= 1'b0;
        2'b10: q <= 1'b1;
        2'b11: q <= 1'bx; // Invalid state
      endcase
    end
  end
endmodule

module jkff(
  input j,k,
  input clk,reset,
  output reg q,
  output qbar
);
  wire s,r;
   assign s = j & ~q; // the sr input is changed based on j value 
  assign r = k & q;// the sr input is changed based on k value 
  
  sr_ff uut(.s(s),.r(r),.clk(clk),.reset(reset),.q(q),.qbar(qbar));
  
endmodule
  
