class transaction;
  
  rand bit[7:0]value_1;
  rand bit[7:0]value_2;
  
  constraint value1_c{value_1 inside{[10:20]};}
  
  
  constraint value2_c{value_2 inside{50,60,70};}
  
  
endclass

module sample;
  
  transaction tr;
  initial begin
    
    tr =new();
    
    tr.randomize();
    $display("before randomization value1 = %0d,value2 = %0d",tr.value_1,tr.value_2);
    
    tr.rand_mode(0); // disabling all class 
    $display("after randomization value1 = %0d,value2 = %0d",tr.value_1,tr.value_2);
    
    tr.rand_mode(1);
    $display("enableing randomization value1 = %0d,value2 = %0d",tr.value_1,tr.value_2);
    
    tr.value_2.rand_mode(0); //seperate disable rand_mode
    $display("after value2 disable randomization value1 = %0d,value2 = %0d",tr.value_1,tr.value_2);
    
    $display("seperate rand mode randomization value1 = %0d,value2 = %0d",tr.value_1.rand_mode(),tr.value_2.rand_mode());
  end
endmodule
