// Code your design here

module queue_met;
  int var_1[$]; // unboundedd  length is n
  int var_2[$:9];// boundede length is definded
  
  initial begin
    
    var_1 = {10,20,30,40,50};
    $display("var_1 is %0p",var_1);
    
    $display("var_1 size is %0d",var_1.size());
    
    var_1.insert(2,100);
    $display("var_1 insert is %0p",var_1);
    
    var_1.push_front(90);
    $display("var_1 push front is %0p",var_1);
    
    var_1.push_back(27);
    $display("var_1 push back is %0p",var_1);
    
    var_1.pop_front();
    $display("var_1 pop_frontt is %0p",var_1);
    
    var_1.pop_back();
    $display("var_1 pop_back is %0p",var_1);
    
    var_1.shuffle();
    $display("var_1 shuffle is %0p",var_1);
    
    
  end
endmodule
