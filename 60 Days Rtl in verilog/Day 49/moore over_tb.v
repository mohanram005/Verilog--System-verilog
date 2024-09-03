//test bench
module mooren_tb;
  
  reg clk;
  reg reset;
  reg din;
  wire dout;
  wire [2:0]ns;
  
  moore dut(.clk(clk),.reset(reset),.din(din),.dout(dout),.ns(ns));
  
  
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units clock period
    end

  
  initial begin
    $display("time=%0t, clk=%b,reset=%b,din=%b,dout=%b,ns%b",$time,clk,reset,din,dout,ns);
    
    
   

        // initial
        reset = 1;
        din = 0;
        #10 reset = 0;

        // test case
        din = 1; #10;  
        din = 1; #10;  
        din = 0; #10;
        din = 1; #10;
      din = 1;
//         din = 0; #10;  
//         din = 1; #10;  
//         din = 1; #10;  
//         din = 0; #10;  
//         din = 1; #10;  
//         din = 1; #10;  
//         din = 1; #10;  
//         din = 0; #10;  
//         din = 1; #10;  

        
//         #5 reset = 1;
//         #5 reset = 0;
//         din = 1; #10;  
//         din = 1; #10;  
        
//         din = 0; #10;  
//         din = 1; #10;  

        
        #100$finish;
  end
  //add code
    
    always@(posedge clk or posedge reset)begin
       if(dout) begin
         $display("time=%0t, clk=%b,reset=%b,din=%b,dout=%b //detected 1101 ,ns%b",$time,clk,reset,din,dout,ns);
       end else begin
         $display("time=%0t, clk=%b,reset=%b,din=%b,dout=%b,ns%b",$time,clk,reset,din,dout,ns);
       end
    end
  initial begin
    $dumpfile("moore.vcd");
    $dumpvars(0, mooren_tb); // wave is resulting in 0 state but it want to be in 3 state
  end

  
endmodule
    
