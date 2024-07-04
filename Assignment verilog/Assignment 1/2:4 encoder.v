// Code your design here


module encoder(input y0, y1, y2, y3,
               output reg i0,i1);
  
  
  always@(*) begin
    
    case({y0,y1,y2,y3})
      
      4'b0001 : {i0,i1} = 2'b00;
               
      
      4'b0010 : {i0,i1} = 2'b01;
      
      4'b0100 : {i0,i1} = 2'b10;
      
      4'b1000 : {i0,i1} = 2'b11;
      
      default: {i1, i0} = 2'bxx;
    endcase
    
  end
endmodule


// Code your testbench here
// or browse Examples


module encoder_tb;
  
  reg y0,y1,y2,y3;
  wire  i0,i1;
  
  encoder dut(.y0(y0),.y1(y1),.y2(y2),.y3(y3),.i0(i0),.i1(i1));
  
  initial begin
    
    $monitor("time = %0t | y0 = %b | y1 = %b | y2 = %b | y3 =%b | i0 = %b |i1 = %b ",$time,y0,y1,y2,y3,i0,i1);
    
    y0 = 0; y1 = 0; y2 = 0; y3 = 1;
        

    
    y0 = 0; y1 = 0; y2 = 0; y3 = 1; #10; 
    
    y0 = 0; y1 = 0; y2 = 1; y3 = 0; #10; 
    
    y0 = 0; y1 = 1; y2 = 0; y3 = 0; #10; 
    
    y0 = 0; y1 = 1; y2 = 0; y3 = 1; #10;
    
    y0 = 1; y1 = 0; y2 = 0; y3 = 0; #10;
    
  end
  initial begin
    
    $dumpfile("encoder.vcd");
    $dumpvars(0,encoder_tb);
  end
endmodule
    
    
