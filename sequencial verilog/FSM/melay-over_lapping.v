// Code your design here


module melayover(input clk,reset,din,
                 output reg dout,
                 output reg[1:0] ns);
  
  parameter[1:0] s0 = 2'b00,
  				s1 = 2'b01,
  				s2 = 2'b10,
  				s3 = 2'b11;
  reg [1:0] state;
  
  always@(posedge clk or posedge reset) begin
    if(reset) begin
      state<=s0;
      dout=1'b0;
    end else
      state<=ns;
  end
  always@(*) begin
    case(state)
      s0: begin
        if(din)begin
          ns<=s1;
          dout=1'b0;
        end else begin
          ns<=s0;
          dout=1'b0;
        end
      end
      s1: begin
        if(din)begin
          ns<=s2;
          dout=1'b0;
        end else begin
          ns<=s0;
          dout=1'b0;
        end
      end
      s2: begin
        if(~din)begin
          ns<=s3;
          dout=1'b0;
        end else begin
          ns<=s2;
          dout=1'b0;
        end
      end
      s3: begin
        if(din)begin
          ns<=s1;
          dout=1'b1;
        end else begin
          ns<=s0;
          dout=1'b0;
        end
      end
    endcase
  end
endmodule


//test bench

// Code your testbench here
// or browse Examples


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
    
         
    
    
    
    
    
              
              
      
          
    
    
    
 
                 
                 
