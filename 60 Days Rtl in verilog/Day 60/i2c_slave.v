module i2c_slave (
    input wire clk,
    input wire reset,
    inout wire i2c_sda,
    inout wire i2c_scl,
    output reg [7:0] data,
    output reg data_valid
);
    // I2C state machine states
    localparam IDLE = 3'b000, ADDR = 3'b001, DATA = 3'b010, ACK = 3'b011;
    reg [2:0] state;
    reg [7:0] shift_reg;
    reg [3:0] bit_cnt;
    reg sda_out, scl_out;
    wire sda_in;

    assign sda_in = i2c_sda;
    assign i2c_sda = sda_out ? 1'b0 : 1'bz;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            sda_out <= 1'b1;
            scl_out <= 1'b1;
            bit_cnt <= 4'd0;
            shift_reg <= 8'd0;
            data_valid <= 1'b0;
        end else begin
            case (state)
                IDLE: if (sda_in == 0 && scl_out == 1) begin // Start condition
                    state <= ADDR;
                    bit_cnt <= 7;
                end
                ADDR: if (bit_cnt == 0) begin
                    state <= DATA;
                    bit_cnt <= 7;
                end else begin
                    shift_reg[bit_cnt] <= sda_in;
                    bit_cnt <= bit_cnt - 1;
                end
                DATA: if (bit_cnt == 0) begin
                    data <= shift_reg;
                    data_valid <= 1'b1;
                    state <= ACK;
                end else begin
                    shift_reg[bit_cnt] <= sda_in;
                    bit_cnt <= bit_cnt - 1;
                end
                ACK: begin
                    sda_out <= 1'b0; // Acknowledge
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
