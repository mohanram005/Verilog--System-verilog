// Code your design here

module d_flip_flop (
    input wire clk,  
    input wire reset,  
    input wire d,  
    output reg q  
);

    // Internal signals
    wire mux_out;

    // 2:1  mux logic clk = 1 output is q; clk = 0 output is d
     assign mux_out = clk ? d: q;

    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 1'b0;  
        end else begin
            q <= mux_out;  
        end
    end

endmodule


