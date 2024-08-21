class monitor;
  transaction pkt;
  mailbox mail;
  virtual operation vintf;
  
  function new(virtual operation vintf,mailbox mail);
    
    this.vintf = vintf;
    this.mail = mail;
    
  endfunction
  
  task monito;
    repeat(5)
      begin
        
        pkt = new();
        mail.put(pkt);
        pkt.d = vintf.d;
        //pkt.reset = vintf.reset;
        #5;
        pkt.q = vintf.q;
        
        $display("Packet received from DUT");
        
        #100 $finish;
      end
  endtask

endclass
