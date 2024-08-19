`include "transaction"
`include "generator"
`include "driver"
class environment;
 
  generator gen;
  driver driv;
  virtual operation vintf;
  mailbox mail;
  
  function new(virtual operation vintf, mailbox mail);
    
    this.mail = mail;
    this.vintf = vintf;
    
  endfunction
  
  
task memory;
  
  
  mail = new();
  gen = new(mail);
  driv = new(vintf,mail);
  
endtask
  
  task run;
    
    fork
    gen.gene;
    driv.drive;
    join
  endtask
endclass
    
