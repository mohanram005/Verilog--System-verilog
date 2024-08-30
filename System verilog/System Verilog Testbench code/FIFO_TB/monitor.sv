class monitor;
  
  transaction pkt;
  mailbox mail;
  virtual operation vintf;
  
   
  function new ( virtual operation vintf,mailbox mail);

    this.vintf=vintf;
    this.mail=mail;
    
  endfunction
  
   
  task monit;
    
    repeat(8)
      begin
        
        pkt =new();
        mail.put(pkt);
//         t.clk=vintfob.clk;
//         t.reset=vintfob.reset;
        pkt.data_in=vintf.data_in;
        #5;
         vintf.dout=pkt.dout;
        $display("pkt is recieved from DUT");
      end
  endtask
endclass
