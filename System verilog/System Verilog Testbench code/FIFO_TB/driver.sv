class driver;
  
  transaction pkt;
  mailbox mail;
  virtual operation vintf;
  
  function new(virtual operation vintf, mailbox mail);
    
    this.vintf = vintf;
    this.mail = mail;
    
  endfunction
  
  task drive;
    repeat(20) begin
        // Create a new transaction and retrieve it from the mailbox
        pkt = new();
        mail.get(pkt);

        // Reset sequence
        vintf.reset = 1;
        vintf.write_enable = 0;
        vintf.read_enable = 0;
        vintf.data_in = 0;
        #10;  // 10 time units delay

        // Start write operation
        vintf.reset = 0;
        vintf.write_enable = 1;
        
        // Write data sequentially with a 10 time unit delay between each
        vintf.data_in = 8'hA1; #10;
        vintf.data_in = 8'hB1; #10;
        vintf.data_in = 8'hC1; #10;
        vintf.data_in = 8'hD1; #10;
        vintf.data_in = 8'hE1; #10;
        vintf.data_in = 8'hF1; #10;
        vintf.data_in = 8'h1A; #10;
        vintf.data_in = 8'h1C; #10;

        // End write operation
        vintf.write_enable = 0;
        #10;  // 10 time units delay

        // Start read operation
        vintf.read_enable = 1;
        #80;  // Delay to simulate reading process

        // Capture the output data
        pkt.dout = vintf.dout;

        // End read operation
        vintf.read_enable = 0;

        // Additional write-read operation
        vintf.write_enable = 1;
        vintf.read_enable = 1;
        vintf.data_in = 8'h9A; #10;
        vintf.data_in = 8'hBC; #10;
        vintf.data_in = 8'hDE; #10;
        
        // Finalize operation
        vintf.write_enable = 0;
        #30;  // Delay for settling time
        
        #10;
      $finish;
    end
endtask


endclass
        
    
    
    
