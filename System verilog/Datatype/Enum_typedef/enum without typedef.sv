module enum_ex;
  
  enum{cat,rat,bat,mat}thing_e;
  
  initial begin
    
    thing_e = rat;//the value want to decleared in every time 
    
    $display("the result %s as a value of %0d",thing_e.name(),thing_e);// dispaly for ever block
    
    thing_e = mat;
     $display("the result %s as a value of %0d",thing_e.name(),thing_e);
    
    
  end
endmodule
