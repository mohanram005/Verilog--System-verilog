class power2;
  
  rand bit[7:0] val;
  
//   constraint c1 {val !=0;(val &(val -1))==0;}
  
  constraint c2{$onehot(val);}
  
endclass

module top;
  power2 py = new();
  
  initial begin
    
    repeat(10) begin
      py.randomize();
      
      $display(" the  power of 2 = %d",py.val);
    end
  end
endmodule
      
  
