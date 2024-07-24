// Code your design here
module dyna_max;
  
  int dyna_arr[];
  int max_value;
  
  initial begin
    
    dyna_arr = new[5];
    dyna_arr = '{1,3,4,56};
    
    //intitialize the value
    
    max_value = dyna_arr[0];
    
    foreach(dyna_arr[i]) begin
      if(dyna_arr[i] > max_value)
        max_value = dyna_arr[i];//update a maximun value 
    end
    $display("the max value is %0d",max_value);
  end
endmodule
