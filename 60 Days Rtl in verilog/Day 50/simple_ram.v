
module simple_ram
#(
    parameter DATA_WIDTH = 32,       // Number of bits in each word
    parameter ADDR_WIDTH = 10        // Number of bits for the address (2^10 = 1024 locations)
)
(
    input wire clk,                 // Clock signal
    input wire we,                  // Write enable signal
    input wire [ADDR_WIDTH-1:0] addr,// Address bus
    input wire [DATA_WIDTH-1:0] din, // Data input bus
    output reg [DATA_WIDTH-1:0] dout // Data output bus
);

    // Declare RAM variable
    reg [DATA_WIDTH-1:0] ram [0:2**ADDR_WIDTH-1];

    always @(posedge clk) begin
        if (we) begin
            // Write operation
            ram[addr] <= din;
        end else begin
            // Read operation
            dout <= ram[addr];
        end
    end
endmodule
