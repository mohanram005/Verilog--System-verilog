module add_sub_tb;

reg [3:0] a, b;
reg ctr;
wire [3:0] sum;
wire carry;

add_sub uut (.a(a), .b(b), .ctr(ctr), .sum(sum), .carry(carry));

initial begin
  $dumpfile("add_sub.vcd");
  $dumpvars(0, add_sub_tb);

  a = 4; b = 2; ctr = 0; #10;
  a = 7; b = 5; ctr = 0; #10;
  a = 9; b = 1; ctr = 1; #10;
  a = 12; b = 8; ctr = 1; #10;
  $finish;
end

always @(*) begin
  $display("a = %b, b = %b, ctr = %b, sum = %b, carry = %b", a, b, ctr, sum, carry);
end

endmodule



// Code your testbench here
// or browse Examples
module add_sub_tb;

reg [3:0] a, b;
reg ctr;
wire [3:0] sum;
wire carry;

add_sub uut (.a(a), .b(b), .ctr(ctr), .sum(sum), .carry(carry));

initial begin
  $dumpfile("add_sub.vcd");
  $dumpvars(0, add_sub_tb);

  a = 4; b = 2; ctr = 0; #10;
  a = 7; b = 5; ctr = 0; #10;
  a = 9; b = 1; ctr = 1; #10;
  a = 12; b = 8; ctr = 1; #10;
  $finish;
end

always @(*) begin
  $display("a = %b, b = %b, ctr = %b, sum = %b, carry = %b", a, b, ctr, sum, carry);
end

endmodule
