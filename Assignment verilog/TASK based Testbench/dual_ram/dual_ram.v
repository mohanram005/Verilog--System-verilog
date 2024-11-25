// Code your design here
module dual_port_ram (
    input wire clk,          // Clock input
    input wire rst,          // Reset input
    input wire [3:0] addr_a, // Address for Port A
    input wire [3:0] addr_b, // Address for Port B
    input wire [7:0] data_in_a, // Data input for Port A (write data)
    input wire [7:0] data_in_b, // Data input for Port B (write data)
    input wire we_a,         // Write Enable for Port A
    input wire we_b,         // Write Enable for Port B
    output reg [7:0] data_out_a, // Data output for Port A
    output reg [7:0] data_out_b  // Data output for Port B
);

    // Declare memory as a 16x8 RAM (16 addresses, each 8 bits wide)
    reg [7:0] ram [15:0];

    // Port A: Read/Write Operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all memory locations to 0 on reset
            integer i;
            for (i = 0; i < 16; i = i + 1) begin
                ram[i] <= 8'b0;
            end
            data_out_a <= 8'b0;
        end else begin
            if (we_a) begin
                ram[addr_a] <= data_in_a; // Write data to RAM at addr_a
            end
            data_out_a <= ram[addr_a]; // Read data from RAM at addr_a
        end
    end

    // Port B: Read/Write Operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out_b <= 8'b0;
        end else begin
            if (we_b) begin
                ram[addr_b] <= data_in_b; // Write data to RAM at addr_b
            end
            data_out_b <= ram[addr_b]; // Read data from RAM at addr_b
        end
    end

endmodule
