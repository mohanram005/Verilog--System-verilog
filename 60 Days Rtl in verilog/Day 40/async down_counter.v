module tff (
    input clk,        
    input reset,      
    output reg q      
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b1;  
        else
            q <= ~q;    
    end

endmodule

module down_counter(
    input clk,       
    input reset,     
    output [2:0] count 
);

    wire [2:0] q;

    
    assign count = q;

    // Instantiate T flip-flops
    tff tff0 (.clk(clk), .reset(reset), .q(q[0]));         
    tff tff1 (.clk(q[0]), .reset(reset), .q(q[1]));        
    tff tff2 (.clk(q[1]), .reset(reset), .q(q[2]));        

endmodule


