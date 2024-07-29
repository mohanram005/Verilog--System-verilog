module mux2x1(input sel,i1,i0,output y);

assign y = sel? i1:i0;
endmodule

module mux4x1(input s1,s0,i3,i2,i1,i0,output out);

wire y1,y0;

mux2x1 m1(s1,i1,i0,y0);
mux2x1 m2(s1,i3,i2,y1);
mux2x1 m3(s0,y1,y0,out);

endmodule

module mux4x1_tb;

reg s1,s0,i3,i2,i1,i0;
wire out;

mux4x1 mx(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s1(s1),.s0(s0),.out(out));

initial begin
  $monitor("time = %0t | i0 = %b | i1 = %b | i2 = %b | i3 =%b | s1 =%b |s0 = %b | out = %b",$time,i0,i1,i2,i3,s1,s0,out);


i0=1;
i1=0;
i2=1;
i3=0;
s0=0; s1=0; #10;
s0=0; s1=1; #10;
s0=1; s1=0; #10;
s0=1; s1=1; #10;


end
  initial begin
  $dumpfile("mux4x1.vcd");
  $dumpvars(0,mux4x1_tb);
  end
  
endmodule
