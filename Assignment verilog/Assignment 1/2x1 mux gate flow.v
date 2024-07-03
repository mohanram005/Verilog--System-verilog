// Code your design here


module demux_21(input i0 ,i1 ,sel,
                output y);
  
  wire sel_not;
  wire and0 , and1;
  
  not(sel_not,sel);
  
  //and operation
  
  and(and0,i0,sel_not);
  and(and1,i1,sel);
  
  //find one
  
  or(y,and0,and1);
endmodule

// Code your testbench here
// or browse Examples


module demux_21_tb;
  
  reg i0,i1,sel;
  wire y;
  
  demux_21 dm(i0,i1,sel,y);
  
  initial begin
    
    $monitor("time = %0t | i0 = %b | i1 = %b | sel = %b | y = %b",$time,i0,i1,sel, y);
             
    
    i0 = 0; i1 =0; sel = 0; #10;
    
    i0 = 0; i1 =1; sel = 1; #10;
             
    i0 = 0; i1 =0; sel = 1; #10;
    
    i0 = 1; i1 =0; sel = 0; #10;
    
  end
  
  initial begin
  $dumpfile("demux_21.vcd");
  $dumpvars(0,demux_21_tb);
  end
endmodule
