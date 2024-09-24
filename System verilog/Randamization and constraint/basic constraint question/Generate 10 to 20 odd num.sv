// Code your design here

module top;
  
  class gener;
    
    randc int value;
    
    constraint c1{value inside {[10:30]};}
    
    function void post_randomize();
      
      if(value % 2 == 1) begin
        $display("the odd valur %d",value);
      end
    endfunction
  endclass
    
    gener gen = new();
    initial begin
      repeat(20) begin
    gen.randomize();
      end
    end
endmodule
    
    
