// Code your design here

// multiple inheritance  and multi inheritance is not possible in sv
class parent_class;
  bit[31:0]data_p;
  
  function void disp_p();
    $display("the parent class = %0d",data_p);
  endfunction
  
endclass

class child1_class extends parent_class;
  bit[31:0] data_c1;
  
  function void disp_c1();
    $display("the child1_class  = %0d",data_c1);
  endfunction
  
endclass


class child2_class extends parent_class;
  bit[31:0] data_c2;
  function void disp_c2();
    $display("child2_class= %0d",data_c2);
  endfunction
  
endclass


class childA_class extends child1_class;
  bit[31:0] data_cA;
  function void disp_cA();
    $display("childA_class = %0d",data_cA);
  endfunction
  
endclass

class childB_class extends childA_class;
  bit[31:0] data_cB;
  function void disp_cB();
    $display("childB_class = %0d",data_cB);
  endfunction
  
endclass

module inheri;
  
  childB_class cb;
  child2_class c2;
  
  initial begin
    
    cb = new(); // called inheritance 
    cb.data_p = 1;
    cb.data_c1 = 2;
     cb.data_cB = 4;
    cb.data_cA =3;
    
    
    
    cb.disp_p();
    cb.disp_c1();
    cb.disp_cA();
    cb.disp_cB();
    
    c2 = new(); // called sepratedly child2
    c2.data_c2 = 6;
    c2.disp_c2();

    
  end
endmodule
