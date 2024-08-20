

module sample;
  mailbox mail = new(3);
  
  task process_A();
    int value = 5;
    
    string name = "ram"; 
    
    mail.put(value);
    $display(" the value is %0d",value);
    mail.put(name);
    $display(" the string is %0s",name);
    
  endtask
  
  task process_B();
    int value;
    string name;
    
    mail.get(value);
    $display(" the value after get is %0t",value);
    
    mail.get(name);
    $display(" the name after get is %0t",value);
    
  endtask
  
  initial begin
    
    fork
      
      process_A();
      process_B();
      
    join
    
  end
  
endmodule
    
    
  
    
