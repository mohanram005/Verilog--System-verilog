// Code your testbench here
// or browse Examples

module sr_ff_tb;
  
  reg s, r;
  reg clk, reset;
  wire q, qbar;
  
  
  sr_ff uut (
    .s(s),
    .r(r),
    .clk(clk),
    .reset(reset),
    .q(q),
    .qbar(qbar)
  );
  
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  
  initial begin
    $monitor("Time = %0t | clk = %0b | s = %0b | r = %0b | q = %0b | qbar = %0b",
             $time, clk, s, r, q, qbar);
    
    
    reset = 1;
    #10;
    reset = 0;
    #10;
    
   
    s = 0; r = 0; #10;
    s = 0; r = 1; #10;
    s = 1; r = 0; #10;
    
    
    
    #100 $finish;
  end
  initial begin
    $dumpfile("sr_ff.vcd");
    $dumpvars(0,sr_ff_tb);
  end
  
              
endmodule
