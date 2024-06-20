module blocking_nonblocking_example;
  reg [3:0] a, b, c, d, e, f;

  initial begin
    // Blocking assignments
    a = 4'b0001;   
    b = a;          
    c = b;         
    
    // Non-blocking assignments
    d <= 4'b0010;   
    e <= d;      
    f <= e;        
  end
 endmodule



  


// Code for test bench
module tb;
  reg [3:0] data;
  real r_value;
  integer i_value;
  time T;

  blocking_nonblocking_example dut();

  initial begin
    $monitor("time = %0t: a = %b, b = %b, c = %b, d = %b, e = %b, f = %b", 
             $time, dut.a, dut.b, dut.c, dut.d, dut.e, dut.f);
    
    #10;
    $finish;
  end
  initial begin
    $dumpfile("blocking_nonblocking_example.vcd");
    $dumpvars(0,tb);
  end  
endmodule
// output of a, b,c,d are simtumulated but e and f are in x don't care condition because of non blocking 

