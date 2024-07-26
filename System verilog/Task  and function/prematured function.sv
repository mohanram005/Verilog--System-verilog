
module fun;
  
  function bit[1:0] com(input int a, b);
    
    
    
    
    if(a>b) begin
      // return block is maditary for this because by using this we can find which block is excuting
      return 2'h1;
      $display("a > b");
      
    end
    
    if(a<b) begin
      return 2'h2;
      $display("a < b");
      
    end
      
    
    if(a == b) begin
      return 2'h3;
      $display("a = b");
      
    end
    
  endfunction
  
  initial begin
    bit [1:0] done;
    int a, b;
    
    repeat(5) begin
      a = $urandom_range(5, 20);
      b = $urandom_range(5, 20);
      $display("input a = %0d, input b = %0d", a, b);
      done = com(a,b);
      if(done == 2'h1) $display("a is greater than b");
      if(done == 2'h2) $display("a is less than b");
      if(done == 2'h3) $display("a is equal to b");
      $display("------------------------");
    end
  end
endmodule
// the agent of this code is the positive o/p or important finial o/p is excuted other are termintated
    
      
      
  
    
      
