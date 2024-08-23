

module universal_shift_register #(parameter WIDTH = 8) (
    input wire clk,
    input wire rst,
    input wire [1:0] mode,
    input wire [WIDTH-1:0] par_in,
    input wire s_in_left,
    input wire s_in_right,
    output reg [WIDTH-1:0] q
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 0;
        end else begin
            case (mode)
                2'b00: q <= q;
              2'b01: q <= {s_in_right, q[WIDTH-1:1]}; // right
              2'b10: q <= {q[WIDTH-2:0], s_in_left}; // left
                2'b11: q <= par_in;
                default: q <= q; // parallel
            endcase
        end
    end

endmodule
