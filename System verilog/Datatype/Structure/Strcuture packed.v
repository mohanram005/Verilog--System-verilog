// Code your design here
module struct_packed;
  
  struct packed{
    int roll_num; // String cannot be used in packed struct
    int mark; // in unpacked struct we can use string but not accessed as package 
  }student_detial;
  
  initial begin
    
    student_detial.roll_num = 5;
    student_detial.mark = 598;
    
    $display(" Student detials %p",student_detial);//%p is package type
    
  end
endmodule
    
