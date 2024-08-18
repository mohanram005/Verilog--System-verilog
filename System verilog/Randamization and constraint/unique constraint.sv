
typedef enum {M0,M1,M2,M3} scale_e;
class transaction;
  
//   rand bit [7:0] value_a[scale_e];
  rand bit[4:0] array[5];
//   rand bit[2:0] var1,var2,var3;
  
  scale_e scale;
  
  constraint value_c{unique{array};} // unique value generate 
  
//   constraint value1_C{unique{value_a};
  //   value_a.size == scale.num; // value of scale is assign to {M0 =0 ,M1 =1,M2=2,M3=3}
//   foreach(value_a[i])value_a[i] inside {[50:60]};}
  
//   constraint value_b{unique{var1,var2,var3};}
  
endclass

module sample;
  transaction tr;
  
  initial begin
    tr = new();
    
    tr.randomize();
    foreach(tr.array[i]) begin
    $display("array[%0d] = %0d",i,tr.array[i]);
    end
    
//     $display("value_a[%s] = %0d",i.name(),tr.value_a[i]);
//     $display("value var1 =%0d |var2 = %0d,var3 = %0d",tr.var1,tr.var2,tr.var3);
    
  end
endmodule
