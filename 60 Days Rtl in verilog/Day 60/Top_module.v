//connecting module

module system_top_tb;

    reg clk;
    reg reset;
    reg start;
    reg read;
    reg [6:0] i2c_addr;
    reg [7:0] i2c_data;
    wire i2c_sda;
    wire i2c_scl;
    wire [31:0] prdata;
    wire [31:0] apb_data_out;
    wire apb_data_ready;

    // Instantiate the system
    system_top uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .i2c_addr(i2c_addr),
        .i2c_data(i2c_data),
        .i2c_sda(i2c_sda),
        .i2c_scl(i2c_scl)
    );

    // Assign read and data signals from APB master
    assign apb_data_out = uut.apb_m.data_out;
    assign apb_data_ready = uut.apb_m.data_ready;
    assign prdata = uut.apb_s.prdata;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize signals
        reset = 1;
        start = 0;
        read = 0;
        i2c_addr = 7'b0101010;
        i2c_data = 8'b11001100;
        #20;

        // Release reset
        reset = 0;
        #10;

        // Start I2C communication for write
        start = 1;
        #10;
        start = 0;

        // Wait for the write transaction to complete
        #200;

        // Start I2C communication for another write with different data
        i2c_addr = 7'b0110011;
        i2c_data = 8'b10101010;
        start = 1;
        #10;
        start = 0;

        // Wait for the second write transaction to complete
        #200;

        // Start I2C communication for read
        read = 1;
        start = 1;
        #10;
        start = 0;
        read = 0;

        // Wait for the read transaction to complete
        #200;

        // Check the read data
        if (apb_data_ready) begin
            $display("Read Data: %h", apb_data_out);
        end else begin
            $display("Read Data: No data available");
        end

        // Finish simulation
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t | clk: %b | reset: %b | start: %b | read: %b | i2c_addr: %b | i2c_data: %b | i2c_sda: %b | i2c_scl: %b | apb_data_out: %h | apb_data_ready: %b", 
                 $time, clk, reset, start, read, i2c_addr, i2c_data, i2c_sda, i2c_scl, apb_data_out, apb_data_ready);
    end
   initial begin
    $dumpfile("system_top.vcd");
    $dumpvars(1, system_top_tb);
  end

endmodule

