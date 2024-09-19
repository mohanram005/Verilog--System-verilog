// Code your design here
// Code your testbench here
// or browse Examples
module top;
  bit [1:0]a;
  bit[1:0]b;
  covergroup cgrp;
    c1:coverpoint a;
    c2:coverpoint b;
  endgroup 
  cgrp cg=new();
  initial begin 
    repeat(50) begin
    a=$random();
    b=$random();
    cg.sample();
      $display("a=%d,b=%d,inst_coverage=%.2f",a,b,cg.get_inst_coverage());
    end
    $display("a=%d,b=%d,coverage=%.2f",a,b,cg.get_coverage());
  end 
endmodule
