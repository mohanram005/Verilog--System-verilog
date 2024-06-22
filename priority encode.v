// Code your design here

module priencoder(input[7:0]d,output reg [3:0] y);
  
  always@(*) begin
    case(d)
      
      8'b1???_????: y = 3'b111;
      8'b01??_????: y = 3'b110;
      8'b001?_????: y = 3'b101;
      8'b0001_????: y = 3'b100;
      8'b0000_1???: y = 3'b011;
      8'b0000_01??: y = 3'b010;
      8'b0000_001?: y = 3'b001;
      8'b0000_0001: y = 3'b000;
      default:$display("invalid");
      
    endcase
  end
endmodule


// Code your testbench here
// or browse Examples
module priencoder_tb;
  
  reg [7:0]d;
  wire[2:0]y;
  
  
  priencoder pe(d,y);
  
  initial begin
    $monitor("d=%b,y=%b",d,y);
    
    
    d = 8'b0000_1111; #2;
    d = 8'b0000_1100; #2;
    d = 8'b0001_0000; #2;
    d = 8'b1000_0000; #2;
    d = 8'b0100_0000; #2;
    d = 8'b0010_0000; #2;
    d = 8'b0000_1000; #2;
    d = 8'b0000_0100; #2;
    d = 8'b0000_0010; #2;
    d = 8'b0000_0001; #2;
  end
endmodule
