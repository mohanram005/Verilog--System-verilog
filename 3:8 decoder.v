module decoder(input[7:0]d,output[2:0] y);
  
  assign  y = 1<<d;  // left shift operator if 0001 after left shift 0010
endmodule

//test bench
module decoder_tb;
  
  reg [3:0]d;
  wire[7:0]y;
  
  
  decoder pe(.d(d),.y(y));
  
  initial begin
    $monitor("d=%b,y=%b",d,y);
    
    
    d = 3'b000; #2;
    d = 3'b001; #2;
    d = 3'b010; #2;
    d = 3'b011; #2;
    d = 3'b100; #2;
    
  end
  initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0,decoder_tb);
  end
endmodule
