class driver;
  
  transaction pkt;
  mailbox mail;
  virtual operation vintf;
  function new( virtual operation vintf,mailbox mail);
    
    this.mail = mail;
    this.vintf = vintf;
  endfunction
  
  task drive;
    repeat(5)
      
      begin
        pkt=new();
        mail.get(pkt);        
        vintf.reset =1;
        vintf.d=pkt.d;
        #5;
         vintf.reset=0;
        vintf.d=pkt.d;
        #5;
        pkt.q=vintf.q;

      end
  endtask
endclass
