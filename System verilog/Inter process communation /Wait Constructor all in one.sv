// Code your design here


//An event is triggered at the same time as waiting for the event trigger IN wait


module smaple;
  
  event e1;
  
  task process_A();
    //#10;  event  triggered  after waiting ->e1 tigger _AFT
    $display("%0t,before triggering",$time);// 1
    ->e1;
    $display("%0t,after triggering",$time);//2
  endtask
  
  task process_B();
    
    //#10; // event triggered befor waiting for the event  so the wait will block the process BEFORE
    $display("%0t,waiting triggering",$time);//3
    wait(e1.triggered); // trigger after the ->e1 the important ->e1 and @e1 to be in same time
    $display("%0t,event e1 trigger",$time);
  endtask
  
  initial begin
    
    fork
      
      process_A();
      process_B();
      
    join
  end
endmodule
    
    
