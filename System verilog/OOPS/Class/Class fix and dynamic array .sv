// Code your design here



class arr;
  bit[31:0] data;
  int id;
endclass

module arrs;
  
  arr tr[];// dynamic array
  initial begin
    //arr tr[5];//array decleration for fixed
    
    tr = new[5];
    foreach(tr[i]) begin
      tr[i] = new();

      tr[i].data = i*i;
      tr[i].id = i+i;
      
    end
    
    foreach(tr[i]) $display("data[%0d] = %0d,id[%0d] = %0d",i,tr[i].data,i,tr[i].id);
  end
endmodule
    
