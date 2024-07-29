

module pass_by_value;
  
  int a,b;
  int out;
  
  
  function int mul(int a,b);
     a = a*b; //value of a is updated, it won't update global variables a and b
    $display("a = %0d | b= %0d",a,b);
     return a;
  endfunction
  
  initial begin
    
    a = 3;
    b = 4;
    out =  mul(a,b);
    $display(" out = %0d |a = %0d | b = %0d",out,a,b); 
  end
endmodule

//o/p
//KERNEL: a = 12 | b= 4
//# KERNEL:  out = 12 |a = 3 | b = 4
    
    
    
    
    
    
  
  
