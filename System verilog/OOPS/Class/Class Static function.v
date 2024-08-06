// Code your design here


class trans;
  static int inc_sid;
  int inc_id;
  
  static function void incf_sid();
    inc_sid++;
    inc_id; //accessing non static is illegal
  endfunction
  
  function void incf_id();
    inc_sid++;
    inc_id++;
    
  endfunction
endclass

module static_fun;
  
  initial begin
    trans tr[5];
    
    foreach(tr[i]) begin
      tr[i] = new();
    
      tr[i].incf_sid();
      $display("incf_sid value = inc_sid =%0d ,inc_id = %0d",tr[i].inc_sid,tr[i].inc_id);
    end
    
    tr[0].inc_sid = 0;
    
    foreach(tr[i]) begin
      
      tr[i].incf_id();
      $display("incf_id value = inc_sid =%0d ,inc_id = %0d",tr[i].inc_sid,tr[i].inc_id);
    end
  end
endmodule
    
    
    
