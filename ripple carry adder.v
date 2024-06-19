
module fulladder(input a,b,cin,output sum ,carrry);

assign sum = a ^ b ^ cin;
assign carry= (a&b)|(b&cin)|(a&cin);

endmodule

module ripadder#(parameter SIZE=4)(input [-1:0]a,b,input cin,output [-1:0] sum,carry);

fulladder f1(a[0],b[0],cin,sum[0],carry[0]);

genvar i;

generate
 for(i=1;i<SIZE;i = i+1) begin
  fulladder f1(a[i],b[i],carry[i-1],sum[i],carry[i]);
  end 
 endgenerate
endmodule


//test bench

module ripadder;

reg [3:0] a,b;
reg cin;

wire [3:0] sum,carry;

ripadder ra(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));

initial begin

a=4; b=2; cin=0; #2;

a= 7; b=5; cin=0; #2;

a=9; b=1; cin=1; #2;

a=12; b=8; cin=1; #2;


end

always@(*)
 $display("a = %b, b = %b,c =%b,sum = %b,carry = %b" ,a,b,cin,sum,carry);

endmodule

