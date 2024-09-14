module apb_master (
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    input wire data_valid,
    input wire read, // New input for read operation
    output reg [31:0] paddr,
    output reg [31:0] pwdata,
    output reg pwrite,
    output reg penable,
    output reg psel,
    input wire [31:0] prdata, // Input for read data
    output reg [31:0] data_out, // Output for read data
    output reg data_ready // Indicates read data is valid
);
    // APB state machine states
    localparam IDLE = 3'b000, SETUP = 3'b001, ENABLE = 3'b010;
    reg [2:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            psel <= 1'b0;
            penable <= 1'b0;
            pwrite <= 1'b0;
            paddr <= 32'd0;
            pwdata <= 32'd0;
            data_out <= 32'd0;
            data_ready <= 1'b0;
        end else begin
            case (state)
                IDLE: if (data_valid) begin
                    state <= SETUP;
                    paddr <= 32'h0000_0000; // Example address
                    pwdata <= {24'd0, data_in};
                    pwrite <= !read;
                    psel <= 1'b1;
                    data_ready <= 1'b0;
                end
                SETUP: begin
                    state <= ENABLE;
                    penable <= 1'b1;
                end
                ENABLE: begin
                    if (read) begin
                        data_out <= prdata;
                        data_ready <= 1'b1;
                    end
                    state <= IDLE;
                    penable <= 1'b0;
                    psel <= 1'b0;
                end
            endcase
        end
    end
endmodule
