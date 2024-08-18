class seq_item;
  rand bit [7:0] value1;
  rand bit [7:0] value2;

  constraint value1_c {value1 inside {[10:30]};}
  static constraint value2_c {value2 inside {40,70, 80};} //constraiint shared for all instance

endclass

module constraint_example;
  seq_item item1, item2;
  
  initial begin
    item1 = new();
    item2 = new();
    
    item1.randomize();
    item2.randomize();
    $display("Before disabling constraint");
    $display("item1: value1 = %0d, value2 = %0d", item1.value1, item1.value2);
    $display("item2: value1 = %0d, value2 = %0d", item2.value1, item2.value2);
    
    item2.value2_c.constraint_mode(0);  // To disable constraint for value2 using handle item2
    item1.randomize();
    item2.randomize();
    $display("After disabling constraint for all value2 alone");
    $display("item1: value1 = %0d, value2 = %0d", item1.value1, item1.value2);
    $display("item2: value1 = %0d, value2 = %0d", item2.value1, item2.value2);
  end
endmodule
