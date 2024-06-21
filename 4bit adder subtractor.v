module fulladder(input a, b, cin, output sum, cout);
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


module addsub #(parameter size = 4) (
  input [size-1:0] a, b,
  input clk,
  output [size-1:0] sum,
  output cout,
  output [size-1:0] bc
);

  assign bc[0] = b[0] ^ clk;

  wire [size-1:0] carry;
  wire [size-1:0] temp_sum;
  
  fulladder fa0(.a(a[0]), .b(bc[0]), .cin(clk), .sum(temp_sum[0]), .cout(carry[0]));

  genvar i;
  generate
    for (i = 1; i < size; i = i + 1) begin : FA_GEN
      assign bc[i] = b[i] ^ clk;
      fulladder fa(.a(a[i]), .b(bc[i]), .cin(carry[i-1]), .sum(temp_sum[i]), .cout(carry[i]));
    end
  endgenerate
  
  assign sum = temp_sum;
  assign cout = carry[size-1];
endmodule


//test bench

module addsub_tb;

  reg [3:0] a, b;
  reg clk;
  wire [3:0] sum;
  wire cout;

  addsub dut (.a(a), .b(b), .clk(clk), .sum(sum), .cout(cout));

  initial begin
    clk = 0;
    a = 4'b0001; b = 4'b0010; #2;
    a = 4'b0100; b = 4'b0010; #2;
    a = 4'b0001; b = 4'b0101; #2;
    clk = 1;
    a = 4'b0001; b = 4'b0010; #2;
    a = 4'b0100; b = 4'b0010; #2;
    a = 4'b0001; b = 4'b0101; #2;
    $finish;
  end

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars(0, addsub_tb);
  end
endmodule
