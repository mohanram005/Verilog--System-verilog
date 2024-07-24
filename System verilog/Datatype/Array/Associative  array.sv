module assoc;
  
  bit [7:0]array[int]; // array size is given as int = 32
  int index;
  
  initial begin
    
    array[5] = 1;
    array[2] = 15;
    array[12] = 8;
    array[7] = 16;
    array[21] = 14;
    
    
    foreach(array[i]) 
      
      $display("array[%0d] = %0d",i, array[i]);
      $display("the size of a array is %0d and the entires are %0d",array.size,array.num());
    
    
    if(array.exists(2))
      $display("the array exist 2");
    else
      
      $display("the array don't exist 2");
    array.first(index);
    $display("the first index of array is %0d",index);
    
    array.last(index);
    $display("the last index of array is %0d",index);
    
    index = 12;
    array.prev(index);
    $display("the prev index of array is %0d",index);
    
    index = 12;
    array.next(index);
    $display("the next index of array is %0d",index);
    
    
    array.delete(7);
    foreach(array[i]) 
      
      $display("array[%0d] = %0d",i, array[i]);
    array.delete();
    $display("size = %0d of array", array.size());
      
      
   
    
   
    
  end
endmodule
    
