// Code your design here

module demux(input sel,i,output reg  y0,y1,y2,y3);

  
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

// Code your testbench here
// or browse Examples
module demux_tb;

reg sel,i;
wire y0,y1,y2,y3;

  demux de(sel,i,y0,y1,y2,y3);

initial begin
  $monitor("sel=%h,i=%h,--->y0=%d,y1=%d,y2=%d,y3=%d",sel,i, y0,y1,y2,y3);

sel=0; i=0; #1;
sel=1; i=0; #1;
sel=1; i=1; #1;

end
  
  initial begin
    $dumpfile("demux.vcd");
    $dumpvars(0,demux_tb);
  end
endmodule
