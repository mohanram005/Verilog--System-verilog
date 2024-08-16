// Code your design here

//Globel constant 
class transaction;
  bit [31:0] data;
  const int id = 1; // only be used inside the declearition
  
  function void display();
    $display("data = %0d and id = %0d", data, id);
  endfunction
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
