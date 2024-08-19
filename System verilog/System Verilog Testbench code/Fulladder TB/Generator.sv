class generator;
  
  transaction pkt;
  
  mailbox mail;
  
  function new(mailbox mail);
    
    this.mail = mail;
    
  endfunction
  task gene;
  
  repeat(8)
    begin
      
      pkt = new();
      pkt.randomize();
      
      mail.put(pkt);
      $display("the packet is generated");
    end
  endtask
endclass
