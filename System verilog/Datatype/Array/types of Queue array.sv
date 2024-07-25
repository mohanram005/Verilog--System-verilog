module queue;
  
  int  var_1[$] =  {10,20,30,40,50}; // unbounded array 
  int var_2[$:8];// bouded array
  
  int i,j;
  initial begin
    
    var_2  = var_1;
    $display("the value of var 1is %0p",var_2);
    
    var_2 = {60,var_2};
    $display("insert at the first  %0p",var_2);
    
    var_2 = {var_2,60};
    $display("insert at the last %0p",var_2);
    
    i = var_1[0]; // read the first element 
    j = var_1[$]; // read the last element
    $display("the result is %0d ,%0d",i,j);
    
    var_1 =  var_1[1:$];// delete the first element
    $display("deleting first %0p",var_1);
    
    var_1 = var_1[0:$-1];// delete the last element
    $display("deleting last %0p",var_1);
    
    var_1 = var_1[1:$-1]; //delete the last and lastelement 
    $display("first last %0p",var_1);
    
    var_2 = {};
    $display("delete %0p",var_2);
    
    
  end
endmodule
    
    
  
  
