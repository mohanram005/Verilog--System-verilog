
module arr_reduction;
  
  int arr[6] =  {1,2,3,4,5,6};
  int result; 
  
  
  initial begin 
    
    $display("the sum of array); %0p",arr);
  	result  =  arr.sum();
    $display("the sum of array",result);
    result  =  arr.product();
    $display("the product of array",result);
    result  =  arr.and();
    $display("the and of array",result);
    
    
   
    
  end
endmodule
