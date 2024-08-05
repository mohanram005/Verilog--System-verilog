// Code your testbench here
// or browse Examples
module tb_array_multi;
  reg [4:0] a, b;
  wire [7:0] sum;

  
  array_multi dut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    
    a = 5'b0;
    b = 5'b0;

    
    #10 a = 4'b0001; b = 4'b0001; 
    #10 a = 4'b0011; b = 4'b101; 
    #10 a = 4'b1111; b = 4'b0011; 
    #10 a = 4'b0101; b = 4'b1010; 

    
    #10 $finish;
  end

  initial begin
    
    $monitor("Time: %0t | a: %b, b: %b, sum: %d", $time, a, b, sum);
  end
  initial begin
    $dumpfile("array_multi.vcd");
    $dumpvars(0,tb_array_multi);
  end
endmodule
