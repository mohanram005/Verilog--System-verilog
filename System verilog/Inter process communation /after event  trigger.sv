// Code your design here


module smaple;
  
  event e1;
  
  task process_A();
    #10;
    $display("%0t,before triggering",$time);
    ->e1;
    $display("%0t,after triggering",$time);
  endtask
  
  task process_B();
    $display("%0t,waiting triggering",$time);
    @e1; // trigger after the ->e1 the important ->e1 and @e1 to be in same time scale
    $display("%0t,event e1 trigger",$time);
  endtask
  
  initial begin
    
    fork
      
      process_A();
      process_B();
      
    join
  end
endmodule
    
//     KERNEL: 0,waiting triggering
// # KERNEL: 10,before triggering
// # KERNEL: 10,after triggering
// # KERNEL: 10,event e1 trigger
