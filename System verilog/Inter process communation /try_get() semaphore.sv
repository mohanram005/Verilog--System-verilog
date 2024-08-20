module semaphore_example();
  semaphore sem = new(1);
  
  task process_A(); // if the key not avaiable for p A if will obtained it 
    if(sem.try_get()) //if new(1) p A excute if new(2) both process if statment is excuted  
      $display("process_A: Key received");
    else 
      $display("process_A: Key is not available");
    $display("process_A started");
    #5ns;
    $display("process_A completed");
    sem.put();
  endtask
  
  task process_B();
    if(sem.try_get()) // if ther is not key word for try_get will not block it excute
      $display("process_B: Key received");
    else 
      $display("process_B: Key is not available");
    $display("process_B started");
    #4ns;
    $display("process_B completed");
    sem.put();
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule
