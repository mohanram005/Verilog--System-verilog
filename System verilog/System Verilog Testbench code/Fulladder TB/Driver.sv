class driver;
  transaction pkt;
  mailbox mail;
  virtual operation vintf;
  
  function new( virtual operation vintf, mailbox mail);
    
    this.mail = mail;
    this.vintf = vintf;
    
  endfunction

  
  task drive;
    
    repeat(8)
      begin
        
        pkt = new();
        
        mail.get(pkt);
        vintf.x = pkt.x;
        vintf.y = pkt.y;
        vintf.z = pkt.z;
        $display("x= %b,y=%b ,z=%b",vintf.x,vintf.y,vintf.z);
        #5;
        pkt.sum = vintf.sum;
        pkt.carry = vintf.carry ;
        #5;
      end
  endtask
endclass
        
