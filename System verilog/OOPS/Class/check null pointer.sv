// Code your design here


class transfer;
  
  int data;
  int id;
  
endclass

module simple;
  
  initial begin
    
    transfer tr1,tr2;
    
    tr1 = new();
    if(tr1 != null) begin
    tr1.data = 05;
    tr1.id = 1;
    $display("tr1 data = %0d | tr1 id = %0d",tr1.data,tr1.id);
    end
    else
      $display("tr1 object is not created");
      
    //tr2  = new();// if the object is not created it shows null pointer error
      
    if(tr2 != null) begin
    tr2.data = 10;
    tr2.id = 2;
    $display("tr2 data = %0d | tr2 id = %0d",tr2.data,tr2.id);
    end
    else
      $display("tr2 object is not created");
    
  end
endmodule
