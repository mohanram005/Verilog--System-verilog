// Code your design here


module fork_join;
  initial begin
  
  fork
   begin
     $display($time,"time = %0t");
     #5;
     $display($time,"time = %0t");
   end
    
   begin
     $display($time,"time = %0t");
     #10;
     $display($time,"time = %0t");
   end
    
   begin
     $display($time,"time = %0t");
     #20;
     $display($time,"time = %0t");
   end
  join_none // do not wait for any process to complete  diretly excute the outside block
    // join_any // come out of block any one excute
    //join wait for all process to complete to come out of block
  $display($time," finish time = %0t");
  $finish;
  
  end
endmodule
  
    
    
      
      
      
    
    
    
    
  
  
    
 
    
