module d_ff(input clk,reset,d,
            output reg q);
  
  always@(posedge clk or posedge reset) begin
    if(reset)
      q<=0;
    else 
      q<=d;
  end
endmodule


module siso(input clk,reset,in,
            output q
           );
  
  wire[3:0]q_int;
  
  d_ff ff1(.clk(clk),
           .reset(reset),
           .d(in),
           .q(q_int[0])
             );
   d_ff ff2(.clk(clk),
           .reset(reset),
           .d(q_int[0]),
            .q(q_int[1])
             );
  d_ff ff3(.clk(clk),
           .reset(reset),
           .d(q_int[1]),
           .q(q_int[2])
             );
  d_ff ff4(.clk(clk),
           .reset(reset),
           .d(q_int[2]),
           .q(q_int[3]));
  
  assign q = q_int[3];
  
endmodule

module siso_tb;
  
  reg clk,reset,in;
  wire q;
  
  siso dut(clk,reset,in,q);
  
  initial begin
    
    clk = 1;
    
    forever #5 clk = ~clk;
  end
  initial begin
    $monitor("time = %0t | clk = %b | reset = %b | in = %b | q = %b",$time,clk,reset,in,q);
    
    reset = 0; #10;
    
    in = 0; #10 ;
    
    in = 1; #10;
    
    in = 1; #10;
    
    in = 1; 
    
    
   #100 $finish;
  end
endmodule
    
      
  
            
           
           
