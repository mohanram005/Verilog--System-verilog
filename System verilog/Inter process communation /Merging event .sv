module event_example();
  event e1, e2;
  
  task process_A();
    e2 = e1;// merging event by this e1 wait until the e2 trig
    #10;
    ->e2;
    $display("@%0t: process_A: event e2 is triggered", $time);
  endtask
  
  task process_B();
    $display("@%0t: process_B: waiting for the event e1", $time);
    wait(e1.triggered);// it wait for e2 because of e2 =  e1
    $display("@%0t: process_B: event e1 is received", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule
