// Code your design he


module top;
  
  function int factorial(int n);
    
    int result;
    result = 1;
    
    // 1*1 =1
    //1*2 =2
    //2*3 =6
    //6*4=24
    //24*5=120
    for(int i = 1 ;i <=n; i++) begin
      
      result *= i;
      end
      
      return result;
      
    
  endfunction
  
  initial begin
    
    int num;
    int fact;
    
    num = 5;
    
    fact = factorial(num);
    
    $display("The factorial of a %0d : %0d",num,fact);
  end
endmodule
