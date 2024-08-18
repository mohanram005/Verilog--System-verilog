// Code your design here


class transaction;
  
  rand bit[4:0]var1,var2,var3,var4;
  rand bit t1,t2;
  
  constraint value_c{var1 >var2;
                     var2 == var1 - var3;
                     var3 == var4;} // all operation at a time ,to statisfy the constrains
  
  constraint t_c{(t1 == 1) -> t2 == 0;}
  
endclass

module sample;
  
  transaction tr;
  
  initial begin
    
    tr = new();
    
    repeat(5) begin
    tr.randomize();
    $display("var1 = %0d | var2 = %0d | var3 = %0d | var4 = %0d",tr.var1,tr.var2,tr.var3,tr.var4);
    $display("t1 = %0d |t2 =0%d",tr.t1,tr.t2);
    end
    
  end
endmodule
