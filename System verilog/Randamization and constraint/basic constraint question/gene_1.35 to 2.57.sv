// Code your design here


module top;
  
  class puzzle;
    
    randc int value;
    real real_num;
    
    constraint value_1{value inside{[135 : 257]};}
    
    function void post_randomize();
      
      real_num = value/100.0;
      $display("%2f",real_num );
      
      
    endfunction
    
    
                 
  endclass
  
  puzzle ph = new();
  
  initial begin
    
    
    
    $display("the result of the is 1.35 to 2.57");
    
    repeat(10) begin
      ph.randomize();
      
      
    end
  end
endmodule
