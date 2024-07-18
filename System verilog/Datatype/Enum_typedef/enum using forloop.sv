// Code your design here

module enum_test;
  
  int i;
  
  typedef enum{cat,rat,bat,mat}thing_e;
  typedef enum{add,sub,mul,div}sum_e;
  
  thing_e thing;
  sum_e sum;
  
  initial begin
    
    for(i=0;i<4;i++) begin
      
      $display("the enum %s value is %d",thing.name(),thing);
      
      thing = thing.next();
    end
    // Code your design here

module enum_test;
  
  logic i;
  
  typedef enum{cat,rat,bat,mat}thing_e;
  typedef enum{add,sub,mul,div}sum_e;
  
  thing_e thing;
  sum_e sum;
  
  initial begin
    
    for(i=0;i<4;i++) begin
      
      $display("the enum %s value is %d",thing.name(),thing);
      
      thing = thing.next();
    end
    
    
    
  end
endmodule
    
    
    
    
  end
endmodule
