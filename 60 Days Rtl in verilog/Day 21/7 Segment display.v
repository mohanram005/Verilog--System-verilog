module seven_segment(
  input[2:0]bin,
  output reg [6:0]seg
);
  
  always@(*) begin
    
    case(bin)
      
      3'b000: seg = 7'b1111110; // 0 displays on led
      3'b001: seg = 7'b0110000; // 1
      3'b010: seg = 7'b1101101; // 2
      3'b011: seg = 7'b1111001; // 3
      3'b100: seg = 7'b0110011; // 4
      3'b101: seg = 7'b1011011; // 5
      3'b110: seg = 7'b1011111; // 6
      3'b111: seg = 7'b1110000; // 7
      default: seg = 7'b0000000; 
      
    endcase
  end
endmodule

module seven_segment_tb;
  
  reg[2:0]bin;
  wire[6:0]seg;
  
  seven_segment uut(bin,seg);
  
  initial begin
    
    $monitor("time = %0t |bin = %0b |seg = %0b",$time,bin,seg);
    
    bin = 3'b000; #10;
    
    bin = 3'b001; #10;
    
    bin = 3'b010; #10;
    
    bin = 3'b011; #10;
    
    bin = 3'b100; #10;
    
    bin = 3'b101; #10;
    
    bin = 3'b110; #10;
    
    bin = 3'b111; #10;
    
    #100 $finish;
  end
  initial begin
    $dumpfile("seven_segment.vcd");
    $dumpvars(0,seven_segment_tb);
  end
endmodule 
    
  
  
