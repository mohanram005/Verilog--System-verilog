module sample;
  
  mailbox mail =  new(3);
  
  task process_A();
    
    int value ;
    
    repeat(5) begin
      
      value = $urandom_range(1, 50);
      
      if(mail.try_put(value)) //it is non blocking method means not block excuting of else statement like "mail.put()"
        
        $display("the value is %d",value);//it print based on new(3);
      else begin
        $display("failed for value %0d",value);//after new(3) else part is excuted
        $display("number of enteries %0d",mail.num());
      end
      
    end
  endtask
  
  task process_B();
    
    int value;
    repeat(5) begin
    if(mail.try_get(value))
      
      
        $display("the value is %d",value);
      else begin
        $display("failed for value %0d",value);
        $display("number of enteries %0d",mail.num());
      end
      
    end
  endtask
  
  initial begin
    
    fork 
      
      process_A();
      process_B();
    join
  end
endmodule


    
    
    
            

            

      
      
  
        
        
