module tff (
    input t,           
    input clk,        
    input reset,       
    output reg q      
);

    
  always@(posedge clk) begin //synchronous now to change it to asynchronous give posedge reset
          if(!reset) q <= 0;
          else begin
           q <= (t?~q:q);
           end
      end
 

endmodule


module tff_tb;

    reg t, clk, reset;
    wire q;

    tff tf(
        .t(t),
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // generate clk for every 10 ns
    end

    initial begin
        $monitor("Time = %0t | t = %b | clk = %b | reset = %b | q = %b", $time, t, clk, reset, q);
        
        reset = 1; #10; 
        reset = 0; #10; 

        drive(0); #10;
        drive(1); #10;
        drive(0); #10;
        drive(1); #10;

        reset = 1; #10; 
        reset = 0; #10; 

        drive(1); #10;
        drive(0); #10;

        $finish;
    end

    task drive(bit ip);
        @(posedge clk);
        t = ip; #1;  // t value is x for first 20 time cycle
    endtask
  initial begin
    $dumpfile("tff.vcd");
    $dumpvars(1,tff_tb);
  end

endmodule

