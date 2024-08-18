module siso_tb;
  
  reg clk, reset, in;
  wire q3, q2, q1, q0;
  
  siso dut (.clk(clk), .reset(reset), .in(in), .q3(q3), .q2(q2), .q1(q1), .q0(q0));
  
  initial begin
    clk = 1;
    forever #5 clk = ~clk;
  end
  
  initial begin
    
    
    // Apply Reset
    in = 0;
    reset = 1; #10;
    in =0;
    reset = 0; #10; //BY USING THIS DONT CARE CAN BE AVOIDED
    in =0;
    in = 1;
    
    
   
    
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    in = 1; #10;
    
    
    #100 $finish;
  end
  
  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(1, siso_tb);
    $monitor("time = %0t | clk = %0b | reset = %0b | in = %0b | q3 = %0b | q2 = %0b | q1 = %0b | q0 = %0b", 
             $time, clk, reset, in, q3, q2, q1, q0);
  end
endmodule

