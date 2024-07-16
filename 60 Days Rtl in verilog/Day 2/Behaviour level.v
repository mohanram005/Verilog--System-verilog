//Behaviour level using  procedural block
module gate(input a,b,
            output reg c);
  always@(*) begin
    
    c = a & b;
  end
  
endmodule
