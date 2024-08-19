

module sample;
  event  e1;
  
  function process_A(event e1);
    
    ->e1; // non-blocking can also be used
    $display("e1 triggered");
  endfunction
  
  initial begin
   
     event e1; // it is unwanted but u can uuse it
    fork
      
      process_A(e1);
      
      begin
        $display("waiting for  e1 triggering");
        
        wait(e1.triggered);
        $display("after e1 triggering");
      end
    join
  end
endmodule
