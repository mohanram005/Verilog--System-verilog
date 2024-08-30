`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
class environment;
  
  transaction pkt;
  generator gen;
  driver driv;
  monitor mon;
  mailbox mail;
  virtual operation vintf;
  
  function new(virtual operation vintf,mailbox mail);
    
    this.vintf = vintf;
    this .mail = mail;
    
  endfunction
  
  task memory;
    
    mail = new();
    gen = new(mail);
    mon = new(vintf,mail);
    driv = new(vintf,mail);
    
  endtask
  
  
  task run;
    fork
    gen.gene;
    mon.monit;
    driv.drive;
      
    join
    $display("the output after envoironment");
    
  endtask
endclass
  
