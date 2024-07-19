module dynamic_array;
  
  int dyna_arr[];//empty array for dynamic array
  
  initial begin
    
    dyna_arr = new[5];
    dyna_arr = '{1,2,3,4,5};
    
    $display("the size of array is %0d",dyna_arr.size());
    
    
    
    foreach(dyna_arr[i])
    
      $display("the array[%0d] = %0d",i,dyna_arr[i]);
    
    dyna_arr = new[8](dyna_arr);
    $display("the size of array is %0d",dyna_arr.size());
    
    foreach(dyna_arr[i])
    
      $display("the array[%0d] = %0d",i,dyna_arr[i]);
    
    dyna_arr.delete();
    $display("the size of array is %0d",dyna_arr.size());
    
    
    
  
    
    
    
  end
endmodule
