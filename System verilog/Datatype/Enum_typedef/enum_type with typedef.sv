module enum_typedef_ex;
  
  typedef enum{cat,rat,bat,mat}thing_e;
  
  thing_e thing1,thing2,thing3;
  
  
  
  initial begin
    
    thing1 = rat;
    thing2 = bat;
    thing3 = cat;// by using this we can the enum for servaral time with single display
    
    $display("thing1 = %s | thing2 = %s | thing3 = %s | thing1 = %0d" ,thing1.name(),thing2.name(),thing3.name(),thing1);
    
    
    
    
  end
endmodule
