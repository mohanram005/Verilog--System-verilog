module array_multi(
  input [4:0] a,
  input [4:0] b,
  output reg [7:0] sum
);
  
  reg [7:0] p_p[0:4]; // Partial products array
  integer i;
  
  always @(*) begin
    
    sum = 8'b0;
    
    for (i = 0; i < 5; i = i + 1) begin
      p_p[i] = a * b[i];
      sum = sum + (p_p[i] << i);// left shit operator eg:1100 << 1 = 110000 the 11 is because of size
    end
  end
  
  
  always @(*) begin
    for (i = 0; i < 5; i = i + 1) begin
      $display("p_p[%0d] = %0d", i, p_p[i]);
    end
  end
endmodule
