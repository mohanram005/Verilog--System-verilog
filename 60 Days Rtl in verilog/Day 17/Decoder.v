// Code your design here


module decoder(input[2:0]i,
               output[7:0]y);
  
  assign y[0] = ~i[2] & ~i[1] & ~i[0];
  assign y[1] = ~i[2] & ~i[1] & i[0];
  assign y[2] = ~i[2] & i[1] & ~i[0];
  assign y[3] = ~i[2] & i[1] & i[0];
  assign y[4] =  i[2] & i[1] & i[0];
  assign y[5] = i[2] & ~i[1] & i[0];
  assign y[6] = i[2] & i[1] & ~i[0];
  assign y[7] = i[2] & i[1] & i[0];
  
endmodule
    

    
    // Code your testbench here
// or browse Examples

module decoder_tb;
  
  reg[2:0]i;
  wire[7:0]y;
  
  decoder uut(.i(i),.y(y));
  
  initial begin
    
    $monitor("time = %0t | i = %b | y = %b",$time,i,y);
    
    i = 3'b000; #100;
    
    i = 3'b000; #10;
    i = 3'b001; #10;
    i = 3'b010; #10;
    i = 3'b011; #10;
    i = 3'b100; #10;
    i = 3'b101; #10;
    i = 3'b110; #10;
    i = 3'b111; #10;
   
    $finish;
    
  end
  initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0,decoder_tb);
  end
endmodule
