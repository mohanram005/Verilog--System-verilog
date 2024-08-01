// Code your design here

module task_delay;
  
  task compare(int a,b,output bit done);
    if(a>b)
      $display("a greater");
    else if(a<b)
      $display("a lesser");
    else
      $display("a equal");
    
    #10; //delay can be used in task 
    done = 1;
  endtask

  initial begin
    bit done;
    compare(10,10, done);
    if(done) $display("comparison completed at time = %0t", $time);
    compare(5,9, done);
    if(done) $display("comparison completed at time = %0t", $time);
    compare(9,5, done);
    if(done) $display("comparison completed at time = %0t", $time);
    
  end
endmodule
      
      
      
      
      
      
    
    
    
    
  
  
    
 
    
