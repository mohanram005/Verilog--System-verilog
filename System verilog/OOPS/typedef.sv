// Code your design here


//forward declaration of the class using the typedef keyword.
typedef class trans_b;


class transaction;
  bit [31:0] data;
   int id;
  trans_b tr2 = new();
  
  
  
  function void display();
    $display("data = %0d and id = %0d", data, id);
    $display("addr = %0d", tr2.addr);

    
  endfunction
endclass
  
  class trans_b;
    int addr =100; // the value assigend
  endclass

module class_example;
  transaction tr;
  
  initial begin
    tr = new();
    tr.data = 100;
    //tr.id = 2;  // Invalid const usage
    tr.display();
  end
endmodule
