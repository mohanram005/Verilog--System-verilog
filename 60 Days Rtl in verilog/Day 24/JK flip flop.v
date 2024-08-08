module jkff(input j, k, clk,
            input reset,
            output reg q,qbar);
  
  assign qbar =~q;
  
  always@(posedge clk)
    
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
