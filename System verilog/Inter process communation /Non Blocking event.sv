// Code your design here


// non Blocking event 


module smaple;
  
  event e1;
  
  task process_A();
    
    $display("%0t,before triggering",$time);// 1
    ->>e1; // due to the non blocking  the @operator e1 can be excute at same time
    $display("%0t,after triggering",$time);//2
  endtask
  
  task process_B();
    
    
    $display("%0t,waiting triggering",$time);//3
    @(e1); 
    $display("%0t,event e1 trigger",$time);//4
  endtask
  
  initial begin
    
    fork
      
      process_A();
      process_B();
      
    join
  end
endmodule
    
//     # KERNEL: 0,before triggering
// # KERNEL: 0,after triggering
// # KERNEL: 0,waiting triggering
// # KERNEL: 0,event e1 trigger
