// Code your design here


module melaynon(input clk,reset,din,
                output reg dout,
                output reg[1:0] ns);
  
  parameter reg [1:0] s0 = 2'b00,
                     s1 = 2'b01,
                     s2 = 2'b10,
                     s3 = 2'b11;
  reg [1:0] state;
  
  always@(posedge clk or posedge reset) begin
    
    if(reset) begin
      state<=s0;
      dout<=1'b0;
   
    end 
    else
       state = ns; //o/p will xx for this state because ns value is unknown
  end
  always@(state or din) begin
  case(state)
        s0: begin
          if(din) begin
            ns<=s1;//next state moving
            dout<=1'b0;
          end else begin
            ns<=s0;
          dout<=1'b0;
          end
        end
          s1: begin
            if(din) begin
              ns<=s2;
              dout<=1'b0;
            end else begin
              ns<=s0;
              dout<=1'b0;
            end
          end
            s2: begin
              if(~din) begin
                ns<=s3;
                dout<=1'b0;
              end else begin
                ns<=s2;
                dout<=1'b0;
              end
            end
              s3:begin
              if(din) begin
                ns<=s0;
                dout<=1'b1;
              end else begin
                ns<=s0;
                dout<=1'b0;
              end
              end 
              
        
              default: begin
                state<=s0; // 
                dout<=1'b0;
               end
      endcase
    end
  
endmodule
        
                
// Code your testbench here
// or browse Examples


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
    $display("time=0%t, clk=%b,reset=%b,din=%b,dout=%b,ns%b",$time,clk,reset,din,dout,ns);
    
    
   

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
         $display("time=0%t, clk=%b,reset=%b,din=%b,dout=%b //detected 1101 ,ns%b",$time,clk,reset,din,dout,ns);
       end else begin
         $display("time=0%t, clk=%b,reset=%b,din=%b,dout=%b,ns%b",$time,clk,reset,din,dout,ns);
       end
    end
  initial begin
    $dumpfile("melaynon.vcd");
    $dumpvars(0, melaynon_tb); // wave is resulting in 0 state but it want to be in 3 state
  end

  
endmodule
    
         
    
    
    
    
    
              
              
            
            
      
      
                
