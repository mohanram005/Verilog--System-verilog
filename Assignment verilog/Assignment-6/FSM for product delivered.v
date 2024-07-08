// Code your design here


module coin(input clk,reset,
            input c1,
            input c2,
            output reg X,Y,
            output reg [2:0] ns);
  
  parameter[2:0] s0 = 3'b000,
  s1 = 3'b001,
  s2 = 3'b010,
  s3 = 3'b011,
  s4 = 3'b100;
  
 
  reg[2:0] state;
  
  always@(posedge clk or posedge reset) begin
    if(reset)
      
      state <= s0;
    else  begin 
      
      state <= ns;
    end
  end
    
    always@(*) begin
      
      case(state)
        
        s0 : begin
          
          if(c1)
            
            ns <= s1;
          else if(c2)
            
            ns <= s2;
          else
            
            ns <= s0;
        end 
        
        s1 : begin
          
          if(c1)
            
            ns <= s2;
          else if(c2)
            
            ns <= s3;
          else
            
            ns <= s1;
        end
        
        s2 : begin
          
          if(c1)
            
            ns <= s3;
          else if (c2)
            
            ns <= s4;
          else
            
            ns <= s2;
        end
        s3 : begin
          
          ns <= s0;
        end
        
        s4 : begin
          
          ns <= s0;
        end
      endcase
    end
  always@(*) begin
    
    case(state)
      
      s3 : begin
        
        X = 1;
      end
      s4 : begin
        
        X = 1;
        Y = 1;
      end
    endcase
  end
endmodule


// Code your testbench here
// or browse Examples

module coin_tb;
  
  reg clk,reset,c1,c2,X,Y;
  wire[2:0] ns;
  
  coin dut(clk,reset,c1,c2,X,Y,ns);
  
  initial begin
    
    clk = 0;
    forever #5 clk = ~clk;
    
  end
  initial begin
    
    $monitor("time = %0t | reset = %b | c1 = %b| c2 = %b|X = %b |Y =%b",$time,reset,c1,c2,X,Y);
    
    reset = 1;#10;
    c1 = 0;
    c2 = 0;
    
    reset = 0; 
    
    #10;
    
    c1 = 1;
    #10;
    
    c2 =  1;
    #10;
    
    
    c1 =0; #10;
    
    c2 = 1; #10;
    
    // test coin return
    
    c2 = 1;
    #10;
    c2 = 0;
    #10;
    
    #100 $finish;
    
  end
endmodule
    
    
    

  
      
      
        
       
        
        
       
          
        
    
    
  
  
  
  
  
  
  
 
