module master_slave_tb;
  
  reg clk,reset,j,k;
  wire q,q_qar;
  
  master_slave dut(clk,reset,j,k,q,q_bar);
  
  initial begin
    clk=0; 
    
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor("Time = %0t | j = %b | k = %b | clk = %b | reset = %b | q = %b |qbar =%b",$time, j, k, clk, reset, q,q_bar);
    
     reset = 1; j = 0; k = 0; #10;  
      reset = 0;
    
     j=0; k=0; #10; 
    
     j=0; k=1; #10;
    
     j=1; k=0; #10;
    
     j=1; k=1; #10;
    
    
    
    //apply reset for every  10 ns
    
    reset =1; #10;
    
    reset =0;    j=1; k=0; #10;
    
    $finish;
  end
  initial begin
    $dumpfile("master_slave.vcd");
    $dumpvars(0,master_slave_tb);
  end
  
endmodule
