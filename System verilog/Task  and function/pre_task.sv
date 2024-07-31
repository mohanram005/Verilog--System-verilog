// Code your design here
 module pre_task;
   
   task compare( input int a,b,output bit[1:0] done);
     
     if(a<b) begin
       done = 2'd1;
       return;
       $display("a less than b");
     end
     
       if(a>b) begin
       done = 2'd2;
       return;// it is used to get out the variable
        $display("a greater than b");
     end
     
     
     if(a == b) begin
       done = 2'd3;
       return;
       $display("a less than b");
     end
     
     
   endtask
   
   initial begin
     
     bit[1:0] done;
     int a,b;
     
     a = $urandom_range(5,10);
     b = $urandom_range(5,10);
     
     compare(a,b,done);
     
     if(done == 1'b1) $display("a less comparison");
     if(done == 1'b1) $display("a greater comparison");
     if(done == 1'b1) $display("a equal comparison");
     
   end
 endmodule
     
     
     
