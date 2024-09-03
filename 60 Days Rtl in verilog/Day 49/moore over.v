// Code your design here
module moore(
    input clk,
    input reset,
    input din,
    output reg dout,
    output reg [2:0] ns
);

    // State encoding
    parameter [2:0] s0 = 3'b000,
                    s1 = 3'b001,
                    s2 = 3'b010,
                    s3 = 3'b011,
                    s4 = 3'b100;

    reg [2:0] state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= s0;
        end else begin
            state <= ns;
        end
    end

    // Next state logic and output logic
    always @(*) begin
        ns = state;  // Default to hold state
        dout = 1'b0; // Default output is 0
        case(state)
            s0: begin
                if (din) ns <= s1;
                else ns <= s0;
            end
            s1: begin
                if (din) ns <= s2;
                else ns <= s0;
            end
            s2: begin
                if (~din) ns <= s3;
                else ns <= s2;
            end
            s3: begin
                if (din) ns <= s4;
                else ns <= s0;
            end
            s4: begin
                dout = 1'b1; // Output is 1 in state s4
                if (din) ns <= s1;
                else ns <= s0;
            end
            default: ns <= s0;
        endcase
    end

endmodule

