

module default_by_value;
  
  int a,b;
  int out;
  
   
  function int mul(int a = 3,b = 3);
     a = a*b;
     b = b*a; //value of a is updated, it won't update global variables a and b
    
     return a+b;
  endfunction
  
  initial begin
    out = mul(); // Note: No arguments are passed // return a + b is assigned to the caller
    $display("argument passed: out = %0d, a = %0d and b = %0d", out, a, b);
    //a and b values will be 0 since their values are not updated because a and b are global varibale
    a = 3;
    b = 4;
    out =  mul(a,b);
    $display("No arguments passed: out = %0d for a = %0d and b = %0d", out, a, b);// global variable a and b are updated 
  
  end
endmodule
             
    
    
    
    
    
    
  
  
