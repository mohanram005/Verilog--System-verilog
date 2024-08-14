// Code your design here
module jkff(input j, k, clk,
            input reset,
            output reg q);
  
  wire qbar; // output connection
  assign qbar =~q;
  
  always@(posedge clk or posedge reset) // output only change when the clk is on otherwise it shows  privious state
    
    if(reset) begin
      
      q<=0;
    end else begin
      case({j ,k})
        
        2'b00: q<=q;
        2'b01: q<=0;
        2'b10: q<=1;
        2'b11: q<=qbar;
        
        
      endcase
      end
      
endmodule

module tff(
  input t,clk,reset,
  output q
);
  wire j,k;
  assign j = t; // this was as per the k map from the table
  assign k = t;
  
  jkff uut(.j(j),.k(k),.clk(clk),.reset(reset),.q(q));
  
endmodule
