//order can be changed
module pass_by_name;
  
  function void fun(string name,int age);
    $display(" name = %0s | age = %0d",name,age);
    
  endfunction
  
  initial begin
    
    fun(.name("mohan"),.age(21));
  end
endmodule
    
