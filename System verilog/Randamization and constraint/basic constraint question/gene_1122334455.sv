// Code your design here


module top;
  
  class puzzle;
    
    rand int a[];
    
    constraint c1{a.size() == 10;}
    
    constraint c2{foreach(a[i]) if(i%2 == 0) 
      a[i] == (i/2)+1;
                  else
                    a[i] == a[i -1];
                 }
  endclass
  
  puzzle ph = new();
  
  initial begin
    
    ph.randomize();
    
    $display("the result of the is 1122334455");
    
    foreach(ph.a[i])
      
      $display("%d",ph.a[i]);
  end
endmodule
