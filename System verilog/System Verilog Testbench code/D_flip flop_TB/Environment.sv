`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
//`include "monitor.sv"

class environment;
  
  generator gen;
  driver driv;
  //monitor moni;
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
    //moni = new(vintf,mail);
    
  endtask
  
  task run;
    fork
    
    gen.gene;
    driv.drive;
    //moni.monito;
      
    join
    
    $display("Packet recieved in environment");
    
    
  endtask
endclass
    
    
