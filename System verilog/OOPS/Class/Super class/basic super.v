// Code your design here

class  manily;
  
  int data;
  function void display;
    
    $display("the base class:%0d",data);
  endfunction
  
endclass

class short extends manily;
  int data;
   function void display;
     
     super.data = 3; // assigin to the base class
     super.display();
     $display("the child class: %0d",data);
   endfunction
endclass

module sample;
  
  initial begin
    short st;
    st = new();
    st.data = 5;
    st.display();
  end
  
endmodule
  
  
  
