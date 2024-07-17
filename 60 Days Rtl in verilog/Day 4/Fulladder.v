odule fulladder (
  input a,
  input b,
  input c,
  output sum,
  output cout
);
  assign sum = a ^ b ^ c;
  assign cout = (a & b) | (b & c) | (a & c);
endmodule

module fulladder_tb;

reg a,b,c;
wire sum,cout;

fulladder fa(.a(a),.b(b),.c(c),.sum(sum),.cout(cout));

initial begin

a=0; b=0; c=0; #2;
a=0; b=0; c=1; #2;
a=0; b=1; c=0; #2;
a=0; b=1; c=1; #2;
a=1; b=0; c=0; #2;
a=1; b=0; c=1; #2;
a=0; b=1; c=1; #2;
a=1; b=1; c=1; #2;


end

  always@(a,b) begin
$display("time=%0t a=%b b=%b sum=%b cout=%b",$time,a,b,sum,cout);
  end
  initial begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0,fulladder_tb);
  end
endmodule
