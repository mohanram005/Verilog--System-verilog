// Code your testbench here
// or browse Examples

class rangepre;
  
  rand bit[7:0] a;
  
  constraint c1{a dist {[0:100] :/  7,[101:125] :/ 3};}
  
endclass

module top;
  
  rangepre rp = new();
  
  initial begin
    
    repeat(10) begin
      
      rp.randomize();
      
      if(rp.a<100)
        $display("the 70 percent %d",rp.a);
      else
        $display("the 30 percent %d",rp.a);
    end
  end
endmodule
                
