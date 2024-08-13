// Code your design here
module encoder(input[7:0]d,output[2:0]y);
  
  assign y[2] = d[4] | d [6] | d[7];
  assign y[1] = d[2] | d[3] | d[7];
  assign y[0] = d[1] | d[3] | d[7];
  
endmodule

// Code your testbench here
// or browse Examples


module encoder_tb;
  
  reg[7:0] d;
  wire[2:0] y;
  
  encoder en(d,y);
  
  initial begin
    $monitor("d=%h,y=%h",d,y);
    
    d=01; #2;
    
    d=02; #2;
    
    d=08; #2;
    
    d=10; #2;
    
    d=20; #2;
    
    d=71; #2;
    
    d=80; #2;
    
  end
  initial begin
  $dumpfile("encoder.vcd");
  $dumpvars(0,encoder_tb);
  end
endmodule
    
    

