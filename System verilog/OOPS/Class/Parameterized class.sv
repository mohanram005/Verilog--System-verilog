// Code your design here

//Parameterized classes are useful when the same class needs to be instantiated differently. The default parameter can be set in the class definition. These parameters can be overridden when it is instantiated
class transaction #(parameter WIDTH = 2,type d_type = bit[2:0]); // we can also call a class by this patameter (type D_TYPE = err_trans)
  bit[WIDTH -1:0]data;
  d_type id;
  
  function void display();
    
    $display("the value of data %0h id %0h",data,id);
  endfunction
  
endclass

module para;
  initial begin
    
    transaction tr1;
    
    transaction#(3,int)tr2;
    
    tr1 = new();
    tr2 = new();
    
    tr1.data = 7; // it range can hold value of 3
    tr1.id=15;// it can only 7 becaue of range [2:0]
    tr1.display();
    
     tr2.data = 7; // tto hold this we are change a parameter for this alone
    tr2.id=15;
    tr2.display();
  end
endmodule
    
