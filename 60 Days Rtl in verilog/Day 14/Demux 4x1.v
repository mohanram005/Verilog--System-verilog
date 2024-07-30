
// Code your design here

module demux(input [1:0]sel,
             input i,
             output reg  y0,y1,y2,y3);

  
  always@(*)begin
    case(sel)
      2'b00:{y0,y1,y2,y3} = {i,3'b0};
      2'b01:{y0,y1,y2,y3} = {1'b0,i,2'b0};
      2'b10:{y0,y1,y2,y3} = {2'b0,i,1'b0};
      2'b11:{y0,y1,y2,y3} = {3'b0,i};
      default:$display("invalid no.");
    endcase
  end

endmodule

