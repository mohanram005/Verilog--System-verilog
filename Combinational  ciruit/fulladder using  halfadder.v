
module half_adder(input a,b, output sum,carry);

assign sum = a ^ b;
assign carry= a & b;

endmodule

module full_adder(input a,b,cin ,output sum ,carry);
wire c,c1,s;


half_adder h0(a,b,s,c);
half_adder h1(cin,s,sum,c1);

assign carry = c | c1;

endmodule


module full_adder_tb;

reg a,b,cin;
wire sum,carry;

full_adder uut(a,b,cin,sum,carry);

initial begin

a=0; b=0; cin=0;#10;

a=0; b=0; cin=1;#10;

a=0; b=1; cin=0;#10;

a=0; b=1; cin=1;#10;

a=1; b=0; cin=0;#10;

a=1; b=0; cin=1;#10;

a=0; b=1; cin=1;#10;

a=1; b=1; cin=1;#10;

end

endmodule


