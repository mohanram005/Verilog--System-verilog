// Code your design here


module d_ff(input clk,reset,d,
            output reg q,
            output q_bar);
  
  assign q_bar = ~q;
  
  always@(posedge clk or posedge reset)
    
    if(reset)
      
      q <= 0;
  else begin
    
    q<=d;
    
  end
endmodule

module  jhonson_counter(input clk,reset,
                        output Q0,
                        output Q1,
                        output Q2,
                        output Q3);
  
  wire [3:0]q;
  wire [3:0]q_bar;
  
  
  
  d_ff dd0(.clk(clk),.reset(reset),.d(q_bar[3]),.q(q[0]),.q_bar(q_bar[0]));
  d_ff dd1(.clk(clk),.reset(reset),.d(q[0]),.q(q[1]),.q_bar(q_bar[1]));
  d_ff dd2(.clk(clk),.reset(reset),.d(q[1]),.q(q[2]),.q_bar(q_bar[2]));
  
  d_ff dd3(.clk(clk),.reset(reset),.d(q[2]),.q(q[3]),.q_bar(q_bar[3]));
  
  
  assign Q0 = q[0];
  assign Q1 = q[1];
  assign Q2 = q[2];
  assign Q3 = q[3];// dont use the assign inside the always block
  
endmodule

// Code your testbench here
// or browse Examples

module jhonson_counter_tb;
  
  reg clk,reset;
  
 
  wire Q0,Q1,Q2,Q3;
  
  jhonson_counter jc(clk,reset,Q0,Q1,Q2,Q3);
  
  initial begin
    
    clk=0;
    forever #5 clk = ~clk ;
    
  end
  initial begin
    
    $monitor("time = %0t | clk = %b | reset = %b  | Q0 = %b | Q1 = %b | Q2 = %b | Q3 = %b",$time,clk,reset,Q0,Q1,Q2,Q3);
    
    
    reset = 1; 
    #10;
    
    reset = 0;
    
    #200 $finish;
    
  end
  initial begin 
    $dumpfile("jhonson_counter.vcd ");
    $dumpvars(0,jhonson_counter_tb);
  end
endmodule
  
  
