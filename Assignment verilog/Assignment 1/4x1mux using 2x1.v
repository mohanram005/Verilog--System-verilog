// Code your design here


module mux_21(input a,b,sel,
              output y);
  
  assign y = sel ? a : b ;
  
endmodule

module mux_41(input y1,y2,y3,y4,s0,s1,
              output y);
  
  wire out1,out2;
  
  mux_21 dut1(.a(y1),.b(y2),.sel(s0),.y(out1));
  
  mux_21 dut2(.a(y3),.b(y4),.sel(s0),.y(out2));
  
  mux_21 dut3(.a(out1),.b(out2),.sel(s1),.y(y));
  
endmodule

// Code your testbench here
// or browse Examples



module mux_41_tb;
  
  reg y1,y2,y3,y4,s0,s1;
  wire y;
  
  mux_41 dut(y1,y2,y3,y4,s0,s1,y);
  
  initial begin
    
    
    $monitor("time = %0t | y1 = %b | y2 = %b | y3 = %b |y4 = %b |s0 = %b | s1 = %b | y =%b",$time,y1,y2,y3,y4,s0,s1,y);
    y1 = 0; y2 = 0; y3 = 0; y4 = 0; s0=0; s1=0; #10;
    
    y1 = 0; y2 = 1; y3 = 0; y4 = 0; s0=0; s1=1; #10;
    
    y1 = 1; y2 = 0; y3 = 0; y4 = 0; s0=1; s1=0; #10;
    
    y1 = 0; y2 = 1; y3 = 0; y4 = 0; s0=1; s1=1; #10;
    
    end
  initial begin
    $dumpfile("mux_41.vcd");
    $dumpvars(0,mux_41_tb);
  end
    
    
   
endmodule
    
    
    
  
              
  
