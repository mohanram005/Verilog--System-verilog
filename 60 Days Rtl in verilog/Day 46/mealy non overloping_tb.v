module melaynon_tb;
  
  reg clk;
  reg reset;
  reg din;
  wire dout;
  wire [1:0]ns;
  
  melaynon dut(.clk(clk),.reset(reset),.din(din),.dout(dout),.ns(ns));
  
  
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
        din = 0; #10;  
        din = 1; #10;  
        din = 1; #10;  
        din = 0; #10;  
        din = 1; #10;  
        din = 1; #10;  
        din = 1; #10;  
        din = 0; #10;  
        din = 1; #10;  

        
        #5 reset = 1;
        #5 reset = 0;
        din = 1; #10;  
        din = 1; #10;  
        
        din = 0; #10;  
        din = 1; #10;  

        
        $finish;
  end
  //add code
    
    always@(posedge clk or posedge reset)begin
       if(dout) begin
         $display("clk=%b,reset=%b,din=%b,dout=%b //detected 1101 ,ns%b",clk,reset,din,dout,ns);
       end else begin
         $display("time=0%t, clk=%b,reset=%b,din=%b,dout=%b,ns%b",clk,reset,din,dout,ns);
       end
    end
  initial begin
    $dumpfile("melaynon.vcd");
    $dumpvars(0, melaynon_tb); // wave is resulting in 0 state but it want to be in 3 state
  end

  
endmodule
