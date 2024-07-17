module halfadd(input a,b,output sum,carry);

assign sum = a ^ b;
assign carry = a & b;

endmodule


module halfadd_tb;

reg a,b;
wire sum,carry;

halfadd dut(.a(a),.b(b),.sum(sum),.carry(carry));

initial begin
  
  $monitor("time = %0t | a = %b | b = %b | sum = %b | carry = %b",$time,a,b,sum,carry);

a=0; b=0;  #2;
a=0; b=0;  #2;
a=0; b=1;  #2;
a=0; b=1;  #2;
a=1; b=0;  #2;
a=1; b=0;  #2;
a=0; b=1;  #2;
a=1; b=1;  #2;

end
  initial begin
    $dumpfile("halfadd.vcd");
    $dumpvars(1,halfadd_tb);
  end
  
endmodule
