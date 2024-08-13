module full_sub(input a,b,c, output result,borrow);

assign result= a ^ b ^ c;
assign borrow = (~a & b)|((~a + b)&c);
endmodule

//test bench

module full_sub_tb;

reg a,b,c;
wire result,borrow;

full_sub fs(.a(a),.b(b),.c(c),.result(result),.borrow(borrow));

initial begin

a=0; b=0; c=0; #10;

a=0; b=0; c=1; #10;

a=0; b=1; c=0; #10;

a=0; b=1; c=1; #10;

a=1; b=0; c=0; #10;

a=1; b=0; c=1; #10;

a=0; b=1; c=1; #10;

a=1; b=1; c=1; #10;

end 

endmodule
