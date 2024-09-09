module i2c_test;

    reg clk;
    reg reset;
    reg start1, start2;
    reg [6:0] addr1, addr2;
    reg [7:0] data1, data2;
    wire i2c_sda;
    wire i2c_scl;
    wire arbitration_lost1, arbitration_lost2;

    // Pull-up resistor
    assign i2c_sda = 1'bz;
    assign i2c_scl = 1'bz;

    i2c_master master1 (
        .clk(clk),
        .reset(reset),
        .start(start1),
        .addr(addr1),
        .data(data1),
        .i2c_sda(i2c_sda),
        .i2c_scl(i2c_scl),
        .arbitration_lost(arbitration_lost1)
    );

    i2c_master master2 (
        .clk(clk),
        .reset(reset),
        .start(start2),
        .addr(addr2),
        .data(data2),
        .i2c_sda(i2c_sda),
        .i2c_scl(i2c_scl),
        .arbitration_lost(arbitration_lost2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test stimulus
    initial begin
        // Monitor the signals
        $monitor("Time: %0t | clk: %b | reset: %b | addr1: %b | data1: %b | arbitration_lost1: %b | addr2: %b | data2: %b | arbitration_lost2: %b",
                 $time, clk, reset, addr1, data1, arbitration_lost1, addr2, data2, arbitration_lost2);

        // Initial values
        reset = 1;
        start1 = 0;
        start2 = 0;
        addr1 = 7'b1010101;
        data1 = 8'b11001100;
        addr2 = 7'b0101010;
        data2 = 8'b00110011;
        #20;

        // Apply reset
        reset = 0;
        #20;

        // Start communication from both masters simultaneously
        start1 = 1;
        start2 = 1;
        #10;
        start1 = 0;
        start2 = 0;
        #200;

        // Finish the simulation
        $finish;
    end

endmodule
