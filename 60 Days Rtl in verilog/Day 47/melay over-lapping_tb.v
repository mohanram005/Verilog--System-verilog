module melayover_tb;
  
  reg clk,reset,din;
  wire  dout;
  wire [1:0] ns;
  
  melayover dut(clk,reset,din,dout,ns);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
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
    $dumpfile("melayover.vcd");
    $dumpvars(0, melayover_tb); 
  end

  
endmodule
