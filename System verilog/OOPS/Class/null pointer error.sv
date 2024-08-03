// Code your design here

//output
//tr1 data = 5 | tr1 id = 1
// RUNTIME: Fatal Error: RUNTIME_0029 design.sv (21): Null pointer access.
class transfer;
  
  int data;
  int id;
  
endclass

module simple;
  
  initial begin
    
    transfer tr1,tr2;
    
    tr1 = new();
    tr1.data = 05;
    tr1.id = 1;
    $display("tr1 data = %0d | tr1 id = %0d",tr1.data,tr1.id);
    //tr2  = new();// if the object is not created it shows null pointer error
    tr2.data = 10;
    tr2.id = 2;
    $display("tr2 data = %0d | tr2 id = %0d",tr2.data,tr2.id);
    
  end
endmodule
