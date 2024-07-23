//test bench

module bintogray_tb;

reg [3:0] binary;
wire [3:0] gray;


bintogray uut (
  .binary(binary),
  .gray(gray)
);

initial begin
  
  binary = 4'b0000; #10;
  $display("Binary = %b, Gray = %b", binary, gray);

  binary = 4'b0001; #10;
  $display("Binary = %b, Gray = %b", binary, gray);

  binary = 4'b0010; #10;
  $display("Binary = %b, Gray = %b", binary, gray);

  binary = 4'b0011; #10;
  $display("Binary = %b, Gray = %b", binary, gray);

  binary = 4'b0100; #10;
  $display("Binary = %b, Gray = %b", binary, gray);

  binary = 4'b0101; #10;
  $display("Binary = %b, Gray = %b", binary, gray);

  
  binary = 4'b1000; #10;
  $display("Binary = %b, Gray = %b", binary, gray);

  
  binary = 4'b1011; #10;
  $display("Binary = %b, Gray = %b", binary, gray);

  
end

endmodule
