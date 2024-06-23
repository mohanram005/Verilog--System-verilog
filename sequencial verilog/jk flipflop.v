// Code your design here


module jkff(input j, k, clk,
            input reset,
            output reg q,qbar);
  
  assign qbar =~q;
  
  always@(posedge clk)
    
    if(reset) begin
      
      q<=0;
    end else begin
      case({j ,k})
        
        2'b00: q<=q;
        2'b01: q<=0;
        2'b10: q<=1;
        2'b11: q<=qbar;
        
        
      endcase
      end
      
endmodule



// Code your testbench here
// or browse Examples


module jkff_tb;
  
  reg j,k,clk;
  reg reset;
  wire q,qbar;
  
  jkff jk(j,k,clk,reset,q,qbar);
  
  initial begin
    clk=0; 
    
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor("Time = %0t | j = %b | k = %b | clk = %b | reset = %b | q = %b |qbar =%b", 
                  $time, j, k, clk, reset, q,qbar);
    
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
  
  initial begin
    $dumpfile("jkff.vcd");
    $dumpvars(0,jkff_tb);
    
  end
endmodule
    
   
