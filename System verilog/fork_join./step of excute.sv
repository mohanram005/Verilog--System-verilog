module synchronized_tasks;
  task task1();
    begin
      #5;
      $display("Task 1 completed at time %0t", $time);// 2 - second excute
    end
  endtask
  
  task task2();
    begin
      #10;
      $display("Task 2 completed at time %0t", $time);// 3 - third excute
    end
  endtask
  
  initial begin
    $display("Starting tasks at time %0t", $time); // 1 - first excute
    
    fork
      task1();
      task2();
    join
    
    $display("All tasks completed at time %0t", $time);// 4 - fourth excute
  end
endmodule
