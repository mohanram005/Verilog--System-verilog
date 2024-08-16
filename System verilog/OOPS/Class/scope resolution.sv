//scope resolution is static class member with out handle
class transaction;
  bit[31:0] data;
  static int id;
  
  static function disp(int id);
    $display("value of id %0h",id);
  endfunction
  
  
  function auto_disp(int id);
    $display("value of id %0h",id);
  endfunction
endclass
  
  module class_exam;
    initial begin
      
      transaction::id = 5;
      
      transaction::disp(transaction::id);
      
      //transaction::data  = 5; because it not a static funnction
      
      //transaction::auto_disp(transaction::id); auto_disp is not a static
    end
  endmodule
