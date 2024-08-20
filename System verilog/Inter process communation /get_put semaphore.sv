// Code your design here


module sample;
  
  semaphore sem = new(3);
  
  task process_write();
    sem.get(3); 
    $display("before writeing");
    #5ns; // due the usage of ns the $time can not be used in this
    $display("write complete");
    sem.put(3);// if not use put it will not move to next task
    
  endtask
  
  task process_read();
    
    sem.get(2); //closed getting and putting
    $display("before reading");
    #5ns;
    $display("read complete");
    
   
    sem.put(2);
  endtask
  
  initial begin
    
    fork
      
      process_write();
      process_read();
    join
    
  end
endmodule
