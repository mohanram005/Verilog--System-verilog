// Code your testbench here
// or browse Examples

`include "addtest.sv"
`include"interface.sv"
module d_ff_tb;
  
  addtest test;
  mailbox mail;
  operation intf();
  
  d_ff uut(.d(intf.d),.clk(intf.clk),.reset(intf.reset),.q(intf.q));
  
  initial begin
    mail = new();
    test = new(intf,mail);
    fork
      test.memory;
      test.run;
  
      
    join
  end
    
  
  initial begin
    
    intf.clk = 0;
    
    forever #5 intf.clk = ~intf.clk;
    
  end
  initial
    
    $monitor(" d = %0b|clk = %0b|reset = %0b| q = %0b",intf.d,intf.clk,intf.reset,intf.q);
endmodule

  
  
