
module arr_locator;
  
  int arr[$];
  int result[$]; 
  
  
  initial begin 
    
    arr =  {1,2,3,4,5,6};
    
    result = arr.find(arr)with( arr >= 5);
    $display("Find the value %0p",result);
    
    
    result = arr.find_index(arr)with( arr >= 5);
    $display("Find the value %0p",result);
    
    $display("Find the max  value %0p",arr.max());
    $display("Find the min  value %0p",arr.unique());
    $display("Find the and  value %0p",arr.and());
    $display("Find the or  value %0p",arr.or());
    $display("Find the xor value %0p",arr.xor());
    arr.sort();
    $display("Find the sort value %0p",arr);
    arr.reverse();
    $display("Find the reverse value %0p",arr);
    arr.rsort();
    $display("Find the rsort value %0p",arr);
    arr.shuffle();
    $display("Find the shuffle value %0p",arr);
    
    
    
  end
endmodule
