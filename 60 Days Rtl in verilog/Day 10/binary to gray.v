module bintogray (
  input [3:0] binary, 
  output [3:0] gray    
);

genvar i;


assign gray[3] = binary[3];

generate
  for (i = 2; i >= 0; i = i - 1) begin : gen_gray
    assign gray[i] = binary[i + 1] ^ binary[i];
  end
endgenerate

endmodule
