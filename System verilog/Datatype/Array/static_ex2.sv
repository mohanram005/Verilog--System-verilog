// Code your design here


module static_array_2;
  
  int def_a[5] = {1,2,3,4,5};
  int def_b[2:0][3:0];
  
  initial begin
    
    def_b = '{{1,10,100,1000},'{2,20,200,2000},'{3,30,300,3000}};//last is 00 and 23
    
    foreach(def_a[i]) begin
      $display("def_a[%0d] = %0d",i,def_a[i]);
    end 
    
    foreach(def_b[i,j]) begin
      $display("def_b[%0d][%0d] = %0d",i,j,def_b[i][j]);
    end
    
    
  end
endmodule
      
      
    
    
               
               
  
  

    
