// Code your testbench here
// or browse Examples
`include "test"
`include "interface"


module fulladder_tb;
  test testr;
  mailbox mail;
  operation intf();
  fulladder inst (
    .x(intf.x),
    .y(intf.y),
    .z(intf.z),
                            .sum(intf.sum),
    .carry(intf.carry)
  );
 
   
 
     
     initial begin
    mail = new();
    testr = new(intf,mail);
    fork
      testr.memory;
      testr.run;
  
      
    join
  end
  initial
    $monitor("  x= %b,y=%b ,z=%b sum=%b carry=%b",intf.x,intf.y,intf.z,intf.sum,intf.carry);

endmodule
