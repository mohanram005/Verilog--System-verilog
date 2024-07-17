
module logic_data_type;
  
  logic[2:0]logic_num;
  integer num_int; // integer is 32bit  so no range specification required
  
  initial begin
    
    $display("the logic data type | logic_num = %b | num_int = %b ",logic_num,num_int);
    
    logic_num = 3'b101;
    num_int = 32'b101x_111z_0111_11x0;
    
    
    $display("the logic data type | logic_num2 = %b | num_int2 = %b ",logic_num,num_int);
  end
endmodule
    
