// Code your design here


//An event is triggered at the same time as waiting for the event trigger

module smaple;
  
  event e1;
  
  task process_A();
    
    $display("%0t,before triggering",$time);// 1
    ->e1;
    $display("%0t,after triggering",$time);//2
  endtask
  
  task process_B();
    
    //#10; // this delay is removed due to start all trigger at a time  
    $display("%0t,waiting triggering",$time);//3
    @e1; // trigger after the ->e1 the important ->e1 and @e1 to be in same time
    $display("%0t,event e1 trigger",$time);// it will not be excuted due @e1 operator it dont unblock
  endtask
  
  initial begin
    
    fork
      
      process_A();
      process_B();
      
    join
  end
endmodule
    
    
