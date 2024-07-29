
module function_example;
  int a, b;
  int out;
  
  function automatic int multiply(ref int a, b);// ref wants to be use inside automatic only
    a = a*b; //value of a is updated, it will be  update global variables a and b
    return a;
  endfunction
  
  initial begin
    a = 5;
    b = 6;
    out = multiply(a,b);
    $display("Multiplication: out = %0d, a = %0d and b = %0d", out, a, b); //observe value of a is updated
  end
endmodule  
