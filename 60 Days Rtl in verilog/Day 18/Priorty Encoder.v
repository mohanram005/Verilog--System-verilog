module priorty_encoder(
  input[3:0]D,
  output reg[1:0]Y
);
  
  always@(*) begin
    
    if(D[3])
      Y =2'b11;
    else if(D[2])
      Y = 2'b10;
    else if(D[1])
      Y = 2'b01;
    else
      Y = 2'b00;
  end
endmodule


module priorty_encoder_tb;
  reg [3:0]D;
  
  wire[1:0]Y;
  
  priorty_encoder uut(D,Y);
  
  initial begin
    $monitor("time = %0t | D = %b | Y = %b", $time, D, Y);
    
   
    D = 4'b0000; #10;
    D = 4'b0001; #10;
    D = 4'b0010; #10;
    D = 4'b0011; #10;
    D = 4'b0100; #10;
    D = 4'b0101; #10;
    D = 4'b0110; #10;
    D = 4'b0111; #10;
    D = 4'b1000; #10;
    D = 4'b1001; #10;
    D = 4'b1010; #10;
    D = 4'b1011; #10;
    D = 4'b1100; #10;
    D = 4'b1101; #10;
    D = 4'b1110; #10;
    D = 4'b1111; #10;
    
  end
  initial begin
    $dumpfile("priorty_encoder.vcd");
    $dumpvars(0,priorty_encoder_tb);
  end
              
endmodule
  
