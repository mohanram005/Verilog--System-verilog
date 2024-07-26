module fun;
  
  function sim_function;
    input int a,b;
    
    if(a>b)
      $display("a greater b");
    else if(a<b)
      $display("a lesser b");
    else
      $display("a equal b");
  endfunction
  
  initial begin
    sim_function(10,20);
    sim_function(1,20);
    sim_function(30,20);
  end
endmodule
    
    
      
