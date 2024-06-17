module multi2x1_tb;

reg sel,i1,i0;
wire y;

multi2x1 mu(.sel(sel),.i1(i1),.i0(i0),.y(y));

initial begin
i0=0;
i1=1;
sel=0 ;

#1;
sel=1;
end
endmodule
