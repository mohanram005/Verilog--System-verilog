// Code your testbench here
// or browse Examples
`include "interface.sv";
`include "addtest.sv"

module fifo_tb;
  
  addtest test;
  mailbox mail;
  operation intf();
  
  fifo uut(.clk(intf.clk),.reset(intf.reset),.write_enable(intf.write_enable),.read_enable(intf.read_enable),.data_in(intf.data_in),.full(intf.full),.empty(intf.empty),.dout(intf.dout));
  
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
    $monitor("time = %0t | reset = %b | write_enable = %b | read_enable = %b | data_in = %b | full = %b | empty = %b | dout = %b",$time,intf.reset,intf.write_enable,intf.read_enable,intf.data_in,intf.full,intf.empty,intf.dout);
endmodule
  
    
    
  
  
  
  
  
  
  
                                                            
           
           

