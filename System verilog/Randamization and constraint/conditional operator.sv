// Code your design here


class transaction;
  
  rand bit[5:0] value;
  rand enum{low,high} scale;
  
  constraint scale_c{value == ((scale == low)? 20:90);
                     
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
    
    
    
