module d_flip_flop_tb;

    reg clk;  
    reg reset;  
    reg d; 
    wire q;  

   
    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    
    initial begin
        
        reset = 1;
        d = 0;
        #10 reset = 0;  
        
        
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        
        
        reset = 1; #10;
        reset = 0; #10;
        
        d = 0; #10;
        d = 1; #10;

        $finish;  
    end

    // Monitor changes
    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | d = %b | q = %b", $time, clk, reset, d, q);
    end
  initial begin
    $dumpfile("d_flip_flop.vcd");
    $dumpvars(1,d_flip_flop_tb);
    
  end
endmodule
