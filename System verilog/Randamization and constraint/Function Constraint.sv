
class  transaction;
  
  randc bit [5:0] value;
  rand bit sel;
  
  constraint value_c{value == get_fun(sel);} // function called inside the constraint
  
  function bit[5:0]get_fun(sel);  // 1st function calls 
    return(sel? 'h10:'h20); 
  endfunction
  
endclass

module sample;
  
  transaction tr;
  initial begin
    
    tr =new();
    
    repeat(4) begin
      
      tr.randomize();
      $display("constraint value is %0h",tr.value);
    end
    
    $display(" on function call %0h",tr.get_fun(1));
    
  end
endmodule
                     
