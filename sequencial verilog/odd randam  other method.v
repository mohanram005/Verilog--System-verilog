module odd(input [3:0] a,   // assuming a is a 4-bit number to represent values between 0 and 15
           output reg [3:0] b);
  
  always @(*) begin
    if (a < 10) begin
      if (a % 2 == 0)
        b <= a + 1; // Make it odd if a is even
      else
        b <= a; // Keep it as is if a is already odd
    end else begin
      b <= a; // Keep the original value if a is not less than 10
    end
  end
endmodule


module testbench;
  reg [3:0] a;
  wire [3:0] b;

  odd odd_instance (.a(a), .b(b));

  initial begin
    // Test with a few values
    a = 4'd2; #10;
    $display("Input a: %d, Output b: %d", a, b);
    a = 4'd3; #10;
    $display("Input a: %d, Output b: %d", a, b); 

    a = 4'd9; #10;
    $display("Input a: %d, Output b: %d", a, b); // b: 9

    a = 4'd10; #10;
    $display("Input a: %d, Output b: %d", a, b); // b: 10
  end
endmodule
