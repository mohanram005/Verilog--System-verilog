// Code your testbench here



module pipo_tb;
  
  reg clk, reset;
  reg  [3:0]parallel_in;
  wire parallel_out_a,parallel_out_b,parallel_out_c,parallel_out_d;
  
  pipo dut(clk, reset,parallel_in,parallel_out_a,parallel_out_b,parallel_out_c,parallel_out_d);
  
  initial  begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    
    reset = 1;
        parallel_in = 4'b0000;
        #15;

        // Release reset
        reset = 0;
        #50;

        // Input parallel data
        parallel_in = 4'b1010; #10;
    
        parallel_in =4'b1110; #10; // use this like clk pluse if not it will not shows stimulation
        
    #100 $finish;
  end
  initial  begin 
    $monitor("time%0t | reset = %0b | parallel_in = %0b | parallel_out_a = %0b | parallel_out_b = %0b| parallel_out_c = %0b| parallel_out_d = %0b ",$time,reset,parallel_in,parallel_out_a,parallel_out_b,parallel_out_c,parallel_out_d);
  end
  
  initial begin
    $dumpfile("pipo.vcd");
    $dumpvars(1,pipo_tb);
  end
endmodule
    
    
    
