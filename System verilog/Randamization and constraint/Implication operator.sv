// Code your design here

//if  LHS is true there the RHS is consider to excute
class transaction;
  
  rand bit[5:0] value;
  rand enum{low,high} scale;
  
  constraint scale_c{(scale == low) -> value < 50;
                     
                    }
//   //constraint scale_C{if(low == scale) value<50;
//                      else if(mid == scale) value >= 50;
//                      else value >=100;
//                     }
  
endclass

module sample;
  initial begin
    
    transaction tr;
    
    tr = new();
    
    repeat(5) begin
      
        tr.randomize();

    $display("sclae =%s,value = %0d",tr.scale.name(),tr.value);
    end
  end
endmodule
    
// KERNEL: sclae =low,value = 3
//  KERNEL: sclae =high,value = 59
//  KERNEL: sclae =high,value = 60
//  KERNEL: sclae =low,value = 16
//  KERNEL: sclae =high,value = 34
    
    
