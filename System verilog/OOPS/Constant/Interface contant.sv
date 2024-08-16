// Code your design here

//INTERFACE constant  AT run time inside the class function
class transaction;
  bit [31:0] data;
  const int id; 
  
  function new();
    data =100;
    id = 1; // run time assignment only once not be assgined outside
  endfunction
  
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
