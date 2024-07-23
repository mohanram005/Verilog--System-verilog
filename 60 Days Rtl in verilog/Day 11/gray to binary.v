module gray_binary (
  input [3:0] gray, 
  output [3:0] binary   
);

genvar i;


  assign binary[3] = gray[3];

generate
  for (i = 2; i >= 0; i = i - 1) begin : gen_gray
    assign binary[i] = binary[i + 1] ^ gray[i];
  end
endgenerate

endmodule
