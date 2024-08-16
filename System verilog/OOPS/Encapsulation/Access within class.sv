// both class member can access with in classs only
class transaction;
  local bit [31:0] data;
  int id;
  
  function new(); // assigning value with in the class
    
    data = 100;
    id = 2;
  endfunction

  function void display();
    $display("data = %0d and id = %0d", data,id);
  endfunction
  
endclass

module class_example;
  transaction tr;
  
  initial begin
    tr =new();
    
    tr.display();
  end
endmodule
//Local method
// class transaction;
//   bit [31:0] data;
//   int id;

//   function new();
//     data = 100;
//     id = 1;
//     display();
//   endfunction
  
//   local function void display();
//     $display("data = %0d and id = %0d", data, id);
//   endfunction
// endclass

// module class_example;
//   transaction tr;
  
//   initial begin
//     tr = new();
//   end
// endmodule
