module basic_gate_tb;
  
  reg a,b; // input are mention as reg it is Register
  wire and_out;
  wire or_out;
  wire not_out;
  wire nand_out;
  wire xor_out;
  
  basic_gates dut(a,b,and_out,or_out,not_out,nand_out,xor_out);//the type of instantaion is connection by order
  
  initial begin //inital block to start a inputs
    
    $monitor("time = %0t | a = %b | b = %b | and_out = %b |or_out = %b | not_out = %b | nand_out = %b | xor_out = %b",$time,a,b,and_out,or_out,not_out,nand_out,xor_out);
    
    a = 5;
    b = 4;
    #10; //it a delay time for 10 cycles
    
    a = 2;
    b = 3;
    
    #20 $finish;
    
  end // use end to close the begining
  initial begin
  $dumpfile("basic_gate.vcd");
  $dumpvars(0,basic_gate_tb);
  end
endmodule
    
            
  
    
    
