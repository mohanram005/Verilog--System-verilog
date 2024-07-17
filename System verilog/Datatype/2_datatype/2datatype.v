// Code your design here


module two_state;
  
  bit bit_data; // 1bit
  byte byte_data;// 8 bit
  shortint sint_data; //16 bit 
  
  int int_data;// 32bit
  longint lint_data; //64bit
  
  initial begin
    
    $display("the output 2 state is based on the bit size | bit = %b |byte = %b | short = %b | int = %b | long = %b",bit_data,byte_data,sint_data,int_data,lint_data);
    
    bit_data = 1'b1;
    byte_data = 8'b10101010;
    sint_data = 16'b10101010101010;
    int_data = 32'b000_100x_1x01;
    lint_data = 64'b000_100x_1x01;
    
    $display("the output 2 state is based on the bit size | bit = %b |byte = %b | short = %b | int = %b | long = %b",bit_data,byte_data,sint_data,int_data,lint_data);
    
  end
endmodule
    
    
    
