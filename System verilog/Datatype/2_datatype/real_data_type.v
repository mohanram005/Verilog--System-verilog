module real_test;
  
  real a,b;
  realtime t1,t2;
  
  initial begin
    
    #1 t1 =$realtime;
    #1.7 t2 = $realtime;
    
    b = 1.7;
    a = t2 - t1;
    
    if(a == b)
      
      $display("pass t1 =%1.3f | t2 = %1.3f | a = %1.6f | b = %1.60f",t1,t2,a,b);
    
    else
      
      $display("fail t1 =%1.3f | t2 = %1.3f | a = %1.6f | b = %1.60f",t1,t2,a,b);
    
  end
endmodule
      
      
    
