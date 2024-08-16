// Code your design here


class transaction;
  bit [31:0] data;
  int id;
  
  extern function void display(); // use develop a fuction outside a class
    extern function disp();
      
      endclass
      
      function void transaction::display(); // use scope resoulution access the class methods
        $display("data = %0d and id = %0d", data, id);
endfunction
      
      function transaction::disp();
        
         $display("id = %0d", id);
endfunction
      
      module class_exp;
       transaction tr;
        initial begin
          
          tr = new();
          
          tr.data = 10; // one handle used for a common assignment
          tr.id = 1;
          
          tr.display();
          tr.disp();
          
        end
      endmodule
        
