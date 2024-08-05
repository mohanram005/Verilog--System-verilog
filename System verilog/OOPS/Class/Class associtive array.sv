// Code your design here

//tr[trans] = 0 , tr[trans] = 1
//# KERNEL: tr[road] = 1 , tr[road] = 2
//# KERNEL: tr[truck] = 4 , tr[truck] = 3
typedef enum {trans ,road,truck} tr_type;
class assoco;
  bit[31:0] data;
  int id;
  
endclass

module ass_arr;
  assoco tr[tr_type];
  
  initial begin
    
    tr[trans] = new();
    tr[road] = new();
    tr[truck] = new();
    
    foreach(tr[i]) begin
      
      tr[i].data = i*i;
      tr[i].id = i+1;
      
    end
    
    foreach(tr[i])
      $display("tr[%0s] = %0d , tr[%0s] = %0d",i.name,tr[i].data,i.name,tr[i].id);
  end
endmodule

    

