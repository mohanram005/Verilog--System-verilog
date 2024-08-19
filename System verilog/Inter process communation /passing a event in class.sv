class transaction;
  
  event tr_e;
  
  function new(event e1);
    tr_e = e1;
  endfunction
  
  task process_A();
    
    #10;
    ->tr_e;
    $display(" event after trigger ");
  endtask
  
  task process_B();
    
    $display(" waiting event trigger ");
    
    wait(tr_e.triggered);
    $display("event is triggered");
    
  endtask
  
endclass

module sample;
  
  transaction tr;
  event tr_e;
  
  initial begin
    
    tr = new(tr_e);//When a class object is created, an event is passed to the constructor as shown in the below example.
    fork
      
      tr.process_A();
      tr.process_B();
      
    join
      
  end
endmodule
  
    
