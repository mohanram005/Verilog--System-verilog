module apb_sram_interface
#(
    parameter DATA_WIDTH = 32,   
    parameter ADDR_WIDTH = 10  
)
(
    input wire PCLK,                
    input wire PSEL,                 
    input wire PENABLE,              
    input wire PWRITE,               
    input wire [ADDR_WIDTH-1:0] PADDR, 
    input wire [DATA_WIDTH-1:0] PWDATA, 
    output reg [DATA_WIDTH-1:0] PRDATA, 
    output reg PREADY,               
    output reg PSLVERR,              

    // SRAM interface
    output reg [ADDR_WIDTH-1:0] SRAM_ADDR,
    output reg [DATA_WIDTH-1:0] SRAM_WDATA, 
    input wire [DATA_WIDTH-1:0] SRAM_RDATA, 
    output reg SRAM_WE,              
    output reg SRAM_CE               
);

    always @(posedge PCLK) begin
        if (PSEL && PENABLE) begin
            PREADY <= 1;
            PSLVERR <= 0;

            if (PWRITE) begin
                // Write operation
                SRAM_ADDR <= PADDR;
                SRAM_WDATA <= PWDATA;
                SRAM_WE <= 1;
                SRAM_CE <= 0; 
            end else begin
                // Read operation
                SRAM_ADDR <= PADDR;
                SRAM_WE <= 0;
                SRAM_CE <= 0; 
                PRDATA <= SRAM_RDATA;
            end
        end else begin
            PREADY <= 0;
            PSLVERR <= 0;
            SRAM_WE <= 0;
            SRAM_CE <= 1; 
        end
    end
endmodule

module simple_sram
#(
    parameter DATA_WIDTH = 32,    // Data width
    parameter ADDR_WIDTH = 10     // Address width
)
(
    input wire clk,                  
    input wire [ADDR_WIDTH-1:0] addr, 
    input wire [DATA_WIDTH-1:0] din,  
    output reg [DATA_WIDTH-1:0] dout,
    input wire we,                    
    input wire ce                     )
);

 
    reg [DATA_WIDTH-1:0] mem [0:2**ADDR_WIDTH-1];

    always @(posedge clk) begin
        if (~ce) begin
            if (we) begin
                // Write operation
                mem[addr] <= din;
            end else begin
                // Read operation
                dout <= mem[addr];
            end
        end
    end
endmodule

