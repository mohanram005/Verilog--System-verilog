// Code your design here

module encoder(input[7:0]D,
               output[2:0]y,
               );
  
  assign y[2] = D[4] | D[5] | D[6] | D[7];
  assign y[1] = D[2] | D[3] | D[6] | D[7];
  assign y[0] = D[1] | D[3] | D[5] | D[7];
  
endmodule


// Code your testbench here
// or browse Examples

module tb_encoder;

  // Inputs
  reg [7:0] D;

  // Outputs
  wire [2:0] y;

  
  encoder uut (
    .D(D),
    .y(y)
  );

  initial begin
    // Initialize Inputs
    D = 8'b00000000;

    
    #100;
        
    // Test cases
    D = 8'b00000001; #10;
    D = 8'b00000010; #10; 
    D = 8'b00000100; #10; 
    D = 8'b00001000; #10; 
    D = 8'b00010000; #10; 
    D = 8'b00100000; #10; 
    D = 8'b01000000; #10; 
    D = 8'b10000000; #10; 

    
    $finish;
  end

  initial begin
    $monitor("At time %0t: D = %b, y = %b", $time, D, y);
  end
  initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(0,tb_encoder);
  end
  

endmodule
