// Code your design here
module task_example;
  int a, b;
  int out;
  
  task automatic multiply(ref int a, b, output int out);
    a = a*b; 
    out = a;
  endtask
  
  initial begin
    a = 5;
    b = 6;
    multiply(a,b, out);
    $display("Multiplication: out = %0d, a = %0d and b = %0d", out, a, b); //observe value of a is updated
  end
endmodule
