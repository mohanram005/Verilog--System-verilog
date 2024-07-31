// Code your design here


module demux_4x1(
    input din,
    input s1, s0,
    output y0, y1, y2, y3
);

  assign y0 = (din & ~s1 & ~s0);  // y0 is selected when s1s0 = 00 // based on atruth table
assign y1 = (din & ~s1 & s0);   // y1 is selected when s1s0 = 01
assign y2 = (din & s1 & ~s0);   // y2 is selected when s1s0 = 10
assign y3 = (din & s1 & s0);    // y3 is selected when s1s0 = 11

endmodule


module tb_demux_4x1;

reg din;
reg s1, s0;
wire y0, y1, y2, y3;

demux_4x1 demux(.din(din), .s1(s1), .s0(s0), .y0(y0), .y1(y1), .y2(y2), .y3(y3));

initial begin
    
  $monitor("time = %0t: din = %b, s1 = %b, s0 = %b | y0 = %b, y1 = %b, y2 = %b, y3 = %b", 
             $time, din, s1, s0, y0, y1, y2, y3);

    din = 1;
    s0 = 0; s1 = 0; #10;  // y0 should be 1
    s0 = 1; s1 = 0; #10;  // y1 should be 1
    s0 = 0; s1 = 1; #10;  // y2 should be 1
    s0 = 1; s1 = 1; #10;  // y3 should be 1
    $finish;
end

endmodule
