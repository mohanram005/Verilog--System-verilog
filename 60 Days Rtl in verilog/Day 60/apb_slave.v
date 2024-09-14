module apb_slave (
    input wire pclk,
    input wire presetn,
    input wire psel,
    input wire penable,
    input wire pwrite,
    input wire [31:0] paddr,
    input wire [31:0] pwdata,
    output reg [31:0] prdata
);
    reg [31:0] memory [0:255];

    always @(posedge pclk or negedge presetn) begin
        if (!presetn) begin
            // Reset logic
        end else if (psel && penable) begin
            if (pwrite) begin
                memory[paddr] <= pwdata;
            end else begin
                prdata <= memory[paddr];
            end
        end
    end
endmodule
