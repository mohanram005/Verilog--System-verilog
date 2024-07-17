module time_data_type;
  
  time data_time; //64 bit 
  real data_real;
  
  initial begin
    
    $display("the time data type | data = %0t | data_real = %0d ",data_time,data_real); //  initial it will print as 0 there is not time delay
    #5;
    
    data_time =  $time; // assign value for the time return
    data_real = 2.23;
    
    $display("the time data type | data = %0t | data_real = %0d ",data_time,data_real);//decimal is used because of 2.23 value 
  end
endmodule
    
    
