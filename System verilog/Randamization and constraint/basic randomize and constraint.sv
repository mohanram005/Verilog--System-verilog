// Code your design here


`define START_RANGE 35
`define END_RANGE 45

class trans #(parameter int p1 = 10, p2 = 20);
  rand bit [7:0] value1;
  rand bit [7:0] value2;
rand bit [7:0] value3;
  rand bit [7:0] value4;
  rand bit [7:0] value5;
  rand bit [7:0] value6;
  rand bit [7:0] value7;
  
  constraint value1_c {value1 inside {[10:20]};} // constant value based range
   constraint value2_c {value2 inside {40,70, 80};} // Set of values
  constraint value3_c {value3 inside {[10:20], 21, 23, [25:30], 40, 70, 80};} // Mix  it rerffers that it may 10 to 20 ,21,23,25 to 30,40,70,80
  
  
  constraint value4_c {!(value4 inside {[100:200]});} // Inverted Range
  
  constraint value5_c {value5 inside {[value1:value2]};} // range using variable   it means range is 10 to 20,40,70,80
  
  constraint value6_c {value6 inside {[`START_RANGE:`END_RANGE]};} // Define based range
constraint value7_c {value7 inside {[p1:p2]};} // parameter based range
endclass

module constraint_example;
  trans #(100, 200) item;
  
  initial begin
    item = new();
    
    repeat(3) begin
      item.randomize(); //WITH OUT THE randomize() the value generate a random values
      $display("value1 = %0d, value2 = %0d, value3 = %0d, value4 = %0d, value5 = %0d, value6 = %0d, value7 = %0d", item.value1, item.value2, item.value3, item.value4, item.value5, item.value6,  item.value7);
    end
  end
endmodule
