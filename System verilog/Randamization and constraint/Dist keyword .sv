// Code your design here


class transaction;
  
  rand bit [7:0] value_1;
  rand bit [7:0]value_2;
  
  constraint value_c{value_1 dist{3:/4,[5:8]:/7};} // specific weight posiblity of random  value
  constraint value_d{value_2 dist{3:=4,[5:8]:=7};}// can be over ridden
  
endclass

module sample;
  
  initial begin
    
    transaction tr;
    
    tr = new();
    
    repeat(5) begin
      
      tr.randomize();
      $display("value_1 = %0d,value_2 = %0d",tr.value_1,tr.value_2);
    end
  end
endmodule
