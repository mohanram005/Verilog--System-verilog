module tb_apb_sram;

    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 10;

    reg PCLK;
    reg PSEL;
    reg PENABLE;
    reg PWRITE;
    reg [ADDR_WIDTH-1:0] PADDR;
    reg [DATA_WIDTH-1:0] PWDATA;
    wire [DATA_WIDTH-1:0] PRDATA;
    wire PREADY;
    wire PSLVERR;

    wire [ADDR_WIDTH-1:0] SRAM_ADDR;
    wire [DATA_WIDTH-1:0] SRAM_WDATA;
    wire [DATA_WIDTH-1:0] SRAM_RDATA;
    wire SRAM_WE;
    wire SRAM_CE;

    apb_sram_interface #(DATA_WIDTH, ADDR_WIDTH) uut (
        .PCLK(PCLK),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(PREADY),
        .PSLVERR(PSLVERR),
        .SRAM_ADDR(SRAM_ADDR),
        .SRAM_WDATA(SRAM_WDATA),
        .SRAM_RDATA(SRAM_RDATA),
        .SRAM_WE(SRAM_WE),
        .SRAM_CE(SRAM_CE)
    );

    simple_sram #(DATA_WIDTH, ADDR_WIDTH) sram (
        .clk(PCLK),
        .addr(SRAM_ADDR),
        .din(SRAM_WDATA),
        .dout(SRAM_RDATA),
        .we(SRAM_WE),
        .ce(SRAM_CE)
    );

    initial begin
        // Initialize signals
        PCLK = 0;
        PSEL = 0;
        PENABLE = 0;
        PWRITE = 0;
        PADDR = 0;
        PWDATA = 0;

        // Reset SRAM
        #10 PSEL = 1; PENABLE = 1; PWRITE = 1; PADDR = 10'b0; PWDATA = 32'hDEADBEEF;
        #10 PSEL = 0; PENABLE = 0;

        // Write to SRAM
        #10 PSEL = 1; PENABLE = 1; PWRITE = 1; PADDR = 10'b0000000001; PWDATA = 32'hCAFEBABE;
        #10 PSEL = 0; PENABLE = 0;

        // Read from SRAM
        #10 PSEL = 1; PENABLE = 1; PWRITE = 0; PADDR = 10'b0000000001;
        #10 PSEL = 0; PENABLE = 0;
      
       #10 PSEL = 1; PENABLE = 1; PWRITE = 0; PADDR = 10'b0000000001;
        #10 PSEL = 0; PENABLE = 0;

      
       #10 PSEL = 1; PENABLE = 1; PWRITE = 0; PADDR = 10'b0000000001;
        #10 PSEL = 0; PENABLE = 0;


        // End simulation
        #50 $finish;
    end

    
    always #5 PCLK = ~PCLK;

   
    initial begin
        $monitor("Time = %0t, PADDR = %h, PWDATA = %h, PRDATA = %h, PREADY = %b, PSLVERR = %b", 
                 $time, PADDR, PWDATA, PRDATA, PREADY, PSLVERR);
    end
endmodule
