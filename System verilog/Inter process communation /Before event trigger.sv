// Code your design here


module smaple;
  
  event e1;
  
  task process_A();
    
    $display("%0t,before triggering",$time);// 1
    ->e1;
    $display("%0t,after triggering",$time);//2
  endtask
  
  task process_B();
    
    #10; //this in delay is due to the before ->e1 triggering  
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
    
//     # KERNEL: 0,before triggering
// # KERNEL: 0,after triggering
// # KERNEL: 10,waiting triggering
