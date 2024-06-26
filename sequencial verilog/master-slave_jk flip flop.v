// Code your design here


module jk_ff (input clk,reset,j,k,
        output reg q,q_bar);
  
  assign q_bar = ~q;
  
  always@(posedge clk or posedge reset) begin
    
    if(reset) 
      q<=0;
    else begin
    case({j,k})
      2'b00 : q <= q;
      2'b01 :q <= 0;
      2'b10 :q <= 1;
      2'b11 :q <= ~q;
    endcase
    end
  end
endmodule



module master_slave(input clk,reset,j,k,
        output q,q_bar);
  
  wire master_q,master_qbar;
  
  jk_ff master(.clk(clk),.reset(reset),.j(j),.k(k),.q(master_q),.q_bar(master_qbar));
  
  jk_ff slave(.clk(~clk),.reset(reset),.j(master_q),.k(master_qbar),.q(q),.q_bar(q_bar));
    
  
endmodule
 




// Code your testbench here
// or browse Examples


module master_slave_tb;
  
  reg clk,reset,j,k;
  wire q,q_qar;
  
  master_slave dut(clk,reset,j,k,q,q_bar);
  
  initial begin
    clk=0; 
    
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor("Time = %0t | j = %b | k = %b | clk = %b | reset = %b | q = %b |qbar =%b",$time, j, k, clk, reset, q,q_bar);
    
     reset = 1; j = 0; k = 0; #10;  
      reset = 0;
    
     j=0; k=0; #10; 
    
     j=0; k=1; #10;
    
     j=1; k=0; #10;
    
     j=1; k=1; #10;
    
    
    
    //apply reset for every  10 ns
    
    reset =1; #10;
    
    reset =0;    j=1; k=0; #10;
    
    $finish;
  end
  
  
endmodule
