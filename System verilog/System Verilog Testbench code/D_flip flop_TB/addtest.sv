`include "environment.sv"

class addtest;
  
  environment env;
  mailbox mail;
  virtual operation vintf;
  
  function new(virtual operation vintf,mailbox mail);
    
    this.mail = mail;
    this.vintf = vintf;
    
  endfunction
  
  task memory;
    
    mail = new();
    env = new(vintf,mail);
    
  endtask
  
  task run;
    
    env.memory;
    env.run;
    
  endtask
  
endclass
