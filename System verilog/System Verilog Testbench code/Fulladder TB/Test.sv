`include "environment"

class test;
  
  environment env;
  virtual operation vintf;
  mailbox mail;
  
  function new(virtual operation vintf,mailbox mail);
    
    this.mail = mail;
    this.vintf = vintf;
    
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
   
    
    
    
