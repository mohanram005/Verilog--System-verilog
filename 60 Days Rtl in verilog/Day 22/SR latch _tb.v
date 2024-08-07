module sr_latch_tb;
  
  reg s, r, enable;
  wire q, qn;
  
 
  sr_latch uut (.s(s), .r(r), .enable(enable), .q(q), .qn(qn));
  
  initial begin
    
    $monitor("time = %0t | s = %0b | r = %0b | enable = %0b | q = %0b | qn = %0b", $time, s, r, enable, q, qn);
    
    
    s = 0; r = 0; enable = 0; #10; 
    s = 1; r = 0; enable = 0; #10; 
    s = 0; r = 1; enable = 0; #10; 
    s = 1; r = 1; enable = 0; #10; 
    s = 0; r = 0; enable = 0; #10; 
    s = 1; r = 0; enable = 1; #10;  
    s = 0; r = 1; enable = 0; #10;
    s = 0; r = 0; enable = 0; #10; 
    $finish; 
  end

  
  initial begin
    $dumpfile("sr_latch.vcd");
    $dumpvars(0, sr_latch_tb);
  end
endmodule
