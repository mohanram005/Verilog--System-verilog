// Code your design here

// this code is based on the shifter not on the gate and assign
//but it can be write in gate and assign
module bidirectional_shift_register #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire mode,
    input wire s_in,
    input wire [WIDTH-1:0] par_in,
    input wire load,
    output reg [WIDTH-1:0] q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 0;
    end else if (load) begin
        q <= par_in;
    end else begin
        case (mode)
          1'b0: q <= {q[WIDTH-2:0], s_in};// mode =0 for left 
          1'b1: q <= {s_in, q[WIDTH-1:1]};// mode =1 for right 
        endcase
    end
end

endmodule
