class error_trans;
  bit [31:0] err_data;//err_data globally
  bit error;
  
  function new(bit [31:0] err_data, bit error);// err_data local 
    this.err_data = err_data;//this used for to slove the confunsion between global
    this.error = error;
  endfunction
endclass

class transaction extends error_trans;
  bit [31:0] data;
  int id;
  error_trans err_tr;// handle for error_trans
  
  function new();
    data = 100;
    id = 1;
    err_tr = new(32'hFFFF_FFFF, 1);// this keyword is used to connect this alone
  endfunction

  
  function void display();
    $display("transaction: data = %0d, id = %0d", data, id);
    $display("error_trans: err_data = %0h, error = %0d\n", err_tr.err_data, err_tr.error);
  endfunction
endclass

module shallow_copy_example;
  transaction tr1, tr2;
  
  initial begin
    tr1 = new();
    $display("Calling display method using tr1");
    tr1.display();
    
    
    tr2 = new tr1;
    $display("After shallow copy tr1 --> tr2");
    $display("Calling display method using tr2");
    tr2.display();
    $display("--------------------------------");
    
    tr2.data = 200;
    tr2.id = 2;
    tr2.err_tr.err_data = 32'h1234;// this ia class handle :err_tr object is:err_data this only change 
    tr2.err_tr.error = 0;
   
    
    $display("Calling display method using tr1");
    tr1.display();
    $display("Calling display method using tr2");
    tr2.display();
    
  end
endmodule
