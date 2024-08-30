`include "environment.sv"

class addtest;
  
  environment env;
  mailbox mail;
  virtual operation vintf;
  
  
  function new(virtual operation vintf,mailbox mail);
    
    this.vintf = vintf;
    this .mail = mail;
    
  endfunction
  
  task memory;
    
    mail = new();
    env = new(vintf,mail);
    
  endtask
  
  task run;
    fork
    
    env.memory;
    
    env.run;
    join
  endtask
endclass
