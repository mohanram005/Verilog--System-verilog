

class generator;
  
  transaction pkt;
  mailbox mail;
  
  function new(mailbox mail);
    
    this.mail = mail;
  endfunction
  
  task gene;
    repeat(5)
      begin
        pkt = new();
        pkt.randomize();
        mail.put(pkt);
      end
  endtask
  endclass
