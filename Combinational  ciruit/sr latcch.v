// Code your design here


module srlatch(input s,r,
               output q,qbar);
  
  wire q_init;
  wire qbar_init;
  
  assign q = ~(s | qbar_init);
  assign qbar = ~(r | q_init);
  
  assign q_init = q;
  assign qbar_init= qbar ;
  
endmodule


// Code your testbench here
// or browse Examples


module srlatch_tb;
  
  reg s,r;
  wire q,qbar;
  
  srlatch sr(s,r,q,qbar);
  
  initial begin
    
    
    s=0; r=0; #2;
    
    s=0; r=1; #2;
    
    s=1; r=0; #2;
    
    s=1; r=1; #2;
    
  end
  initial begin
    $dumpfile("srlatch.vcd");
    $dumpvars(0,srlatch_tb);
  end
  
endmodule
    
