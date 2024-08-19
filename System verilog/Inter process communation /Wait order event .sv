// Code your design here

// order of triggering based on the time delay
module sample;
  
  event e1,e2,e3;
  
  task process_A();
    #5;
    ->e1;
    $display("%0t,processA,e1 triggered",$time);
  endtask
  
  
  task process_B();
    #15;
    ->e2;
    $display("%0t,processB,e2 triggered",$time);
  endtask
  
  task process_C();
    #10;
    ->e3;
    $display("%0t,processC,e3 triggered",$time);
  endtask
  
  task wait_process();
    
    $display("%0t waiting event to be triggered",$time);
    
    wait_order(e1,e2,e3) it is like condition for order of excution 
    $display("%0t  event to be triggered",$time);
    
    else
      $display("%0t event triggered in out of order",$time);
    
  endtask
  
  initial begin
    fork
      
      process_A();
      process_B();
      process_C();
      wait_process();
    join
  end
      
      
endmodule
