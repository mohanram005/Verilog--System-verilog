// Code your design here

module decoder(input i0,i1,
               output y0,y1,y2,y3);
  
  assign {y0,y1,y2,y3} = i1 ? (i0 ? {3'b0,1'b1} : {1'b0,1'b1,2'b0}) : (i0 ? {2'b0,1'b1,1'b0} : {1'b1,3'b0});
  
endmodule

// Code your testbench here
// or browse Examples


module decoder_tb;
  
  reg i0,i1;
  wire y0,y1,y2,y3;
  
  
  decoder dut(i0,i1,y0,y1,y2,y3);
  
  initial begin
    $monitor("time = %0t | i0 = %b | i1 = %b | y0 = %b | y1 = %b | y2 = %b |y3 = %b",$time, i0,i1,y0,y1,y2,y3);
             
    
    
    i0 = 0; i1 = 0; #10;
    
    i0 = 0; i1 = 1; #10;
    
    i0 = 1; i1 = 0; #10;
    
    i0 = 1; i1 = 1; #10;
    
  end
endmodule
