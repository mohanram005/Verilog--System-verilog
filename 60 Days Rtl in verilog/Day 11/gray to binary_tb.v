// Code your testbench here
// or browse E

module gray_binary_tb;
  
  reg[3:0] gray;
  wire[3:0] binary;
  
  gray_binary bg(gray,binary);
  
  initial begin 
    
    $monitor("time = %0t , gray = %b ,binary =%b",$time,gray,binary);
    
    gray = 4'b0011; #10;
    gray = 4'b1110; #10;
    gray = 4'b1010; #10;
    
    #100 $finish;
  end
endmodule
