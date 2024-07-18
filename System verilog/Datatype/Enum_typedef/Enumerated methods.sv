

module enum_method;
  
  typedef enum{cat,rat,bat,mat}thing_e;
  
  thing_e thing;
  
  initial begin
    
    $display("the value is %s and the name is %0d",thing.name(),thing);
    
    thing = thing.first();
    
    $display("the value is %s and the name is %0d",thing.name(),thing);
    
    thing = thing.last();
    
    $display("the value is %s and the name is %0d",thing.name(),thing);
    thing =  mat;
    
    $display("the value is %s and the name is %0d",thing.prev(2). name(),thing);
    
    
  end
endmodule
  
