// Code your design here

module operator(input[2:0] sel,
                input[3:0] a,
                input[3:0]b,
                output reg[4:0] y);
  
  always@(*)begin
    
    case(sel)
      
      3'b000: y = (a + b);
      3'b001: y = (a - b);
      3'b010: y = (a / b);
      3'b011: y = (a && b);
      3'b100: y = (a & b);
      3'b101: y = (a | b);
      3'b110: y = ~(a & b);
      3'b111: y = ~(a ^ b);
    endcase
  end
endmodule

// Code your testbench here
// or browse Examples


module operator_tb;
  
  reg [2:0] sel;
  reg[3:0] a;
  reg [3:0]b;
  wire [4:0] y;
  
  operator dut(sel,a,b,y);
  
  initial begin
    
    $monitor("time = %0t | a = %b | b = %b | y = %b",sel,a,b,y);
    
    sel = 0;
    a = 4;
    b = 3; #10;
    
    sel = 1;
    a = 4;
    b = 3; #10;
    
    sel = 2;
    a = 4;
    b = 3; #10;
    
    sel = 3;
    a = 4;
    b = 3; #10;
    
    sel = 4;
    a = 4;
    b = 3; #10;
    
    sel = 5;
    a = 4;
    b = 3; #10;
    
    sel = 6;
    a = 4;
    b = 3; #10;
    
    sel = 7;
    a = 4;
    b = 3; #10;
    #100 $finish;
    
  end
endmodule
    
      
      
                
