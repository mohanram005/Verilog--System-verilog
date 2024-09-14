module i2c_master (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [6:0] addr,
    input wire [7:0] data,
    inout wire i2c_sda,
    inout wire i2c_scl,
    output reg done
);
    // I2C state machine states
    localparam IDLE = 3'b000, START = 3'b001, ADDR = 3'b010, DATA = 3'b011, STOP = 3'b100;
    reg [2:0] state;
    reg [7:0] shift_reg;
    reg [3:0] bit_cnt;
    reg sda_out, scl_out;
    wire sda_in;

    assign sda_in = i2c_sda;
    assign i2c_sda = sda_out ? 1'b0 : 1'bz;
    assign i2c_scl = scl_out ? 1'b0 : 1'bz;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            sda_out <= 1'b1;
            scl_out <= 1'b1;
            done <= 1'b0;
            bit_cnt <= 4'd0;
            shift_reg <= 8'd0;
        end else begin
            case (state)
                IDLE: if (start) begin
                    state <= START;
                    sda_out <= 1'b0; // Start condition
                end
                START: begin
                    state <= ADDR;
                    shift_reg <= {addr, 1'b0}; // Address + write bit
                    bit_cnt <= 7;
                end
                ADDR: if (bit_cnt == 0) begin
                    state <= DATA;
                    shift_reg <= data;
                    bit_cnt <= 7;
                end else begin
                    sda_out <= shift_reg[bit_cnt];
                    bit_cnt <= bit_cnt - 1;
                end
                DATA: if (bit_cnt == 0) begin
                    state <= STOP;
                end else begin
                    sda_out <= shift_reg[bit_cnt];
                    bit_cnt <= bit_cnt - 1;
                end
                STOP: begin
                    sda_out <= 1'b1; // Stop condition
                    state <= IDLE;
                    done <= 1'b1;
                end
            endcase
        end
    end
endmodule
