// Code your design here


module mooreover(input clk,reset,din,
                 output reg dout,
                 output reg[2:0]ns);
  
  parameter[2:0] s0 = 3'b000,
  s1 = 3'b001,
  s2 = 3'b010,
  s3 = 3'b011,
  s4 = 3'b100;
  
  reg[2:0] state;
  
  always@(posedge clk or posedge reset) begin
    
    if (reset)begin
      
      state <= s0;
      dout <= 0;
      
      end else begin
        state <= ns;
        
      end
  end
  
  always@(*) begin
    
    case(state)
      
      s0 : begin
        dout <= 0;
        if (din) 
          ns <= s1;
        else
          ns <= s0;
      end
      
      s1 : begin
        dout <= 0;
        
        if(~din)
          
          ns <= s2;
        else
          
          ns <= s1;
      end
      
      s2 : begin
        dout <= 0;
        
        if(din)
          ns <= s3;
        else
          ns <= s0;
      end
      
      s3 : begin
        dout <= 0;
        
        if(~din)
          ns <= s1;
        else
          ns <= s4;
      end
      
      s4 : begin
        dout <= 1'b1;
        
        if(din)
          ns <=  s3;
        else
          ns <= s0;
      end
    endcase
  end
endmodule

module mooreover_tb;
  
  reg clk;
  reg reset;
  reg din;
  wire dout;
  wire [2:0]ns;
  
  mooreover dut(.clk(clk),.reset(reset),.din(din),.dout(dout),.ns(ns));
  
  
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
        din = 0; #10;  
        din = 1; #10;
        din = 1; #10;
      din = 1; #10;
    din = 0;
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
    $dumpfile("mooreover.vcd");
    $dumpvars(0, mooreover_tb); // wave is resulting in 0 state but it want to be in 3 state
  end

  
endmodule
    
         
    
      
      
        
        
        
        
        
       
        
    
    
        
      
      
      
  
  
