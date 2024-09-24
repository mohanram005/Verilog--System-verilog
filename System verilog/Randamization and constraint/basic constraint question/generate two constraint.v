class range;
  
  rand bit[7:0] value;
  
  constraint c1{value inside {[25:50]};value > 40;}
  
//   constraint c2{value > 40;}
  
endclass
module top;
  
  range rg =new();
  
  initial begin
    
    repeat(5) begin
      
      rg.randomize();
      $display("the result %d",rg.value);
    end
  end
endmodule
