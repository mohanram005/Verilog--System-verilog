

//TYPE 1
// Code your design here

class sample;
  int a;
  bit b;
  
  function display();
    $display("time = %0t | a = %b | b = %b",$time,a,b);
  endfunction
endclass

module basic;
  
  initial begin
    
    sample tr= new(); // tr is a class handle 
    tr.a = 5;
    tr.b = 0;
    tr.display();
    
  end
endmodule

//TYPE 2
class sample;
  int a;
  bit b;
  
  function display(int a,bit b);
    $display("time = %0t | a = %b | b = %b",$time,a,b);
  endfunction
endclass

module basic;
  
  initial begin
    
    sample tr= new(); // tr is a class handle 
    
    tr.display(5,0);
    
  end
endmodule

