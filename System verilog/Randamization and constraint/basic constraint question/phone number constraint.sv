// first three dight want divisible 852
class range;
  
  rand int a[];
  int i;
  
  constraint c1 {a.size() == 10;}
  
  constraint c2 {
    foreach (a[i]){
      (a[i]>=0) && (a[i] < 10);
    
    if(i == 0)
      a[i] == 8;
    else if(i == 1)
      a[i] == 5;
    else if(i == 2)
      a[i] == 2;
    }
  }
      
      function void display();
    $write("random mobile is:\"");
    foreach(a[i]) begin
    
      $display("the result %d",a[i]);
   end
    endfunction
    
    
    
    
                
endclass
  
module top;
  
  range rg =new();
  
  initial begin
    
    
    repeat(30) begin
      rg.randomize();
      rg.display();
//     foreach(rg.a[i]) begin
    
//       $display("the result %d",rg.a[i]);
//     end
    end
    
  end
endmodule
