// Code your design here


class transaction;
  bit[31:0]data;
  int id;
  
  function new();
    data =100;
    id = 1;
  endfunction
  
  protected function void display(); // byusing this the class members can be accessed by extends class
    $display("the value of data %0d id %d",data,id);
  endfunction
  
endclass

class  sample extends transaction;
  
  task disp();
    
    display();
  endtask
endclass
  
  module samplee;
    
    initial begin
      
      sample tr;
      
      tr = new();
      tr.disp();
      
    end
  endmodule
