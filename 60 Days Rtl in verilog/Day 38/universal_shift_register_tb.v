module universal_shift_register_tb;

    parameter WIDTH = 8;

    reg clk;
    reg rst;
    reg [1:0] mode;
    reg [WIDTH-1:0] par_in;
    reg s_in_left;
    reg s_in_right;
    wire [WIDTH-1:0] q;

    universal_shift_register #(WIDTH) dut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .par_in(par_in),
        .s_in_left(s_in_left),
        .s_in_right(s_in_right),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        mode = 2'b00;
        par_in = 8'b00000000;
        s_in_left = 0;
        s_in_right = 0;

        #10 rst = 0;

        #10 mode = 2'b11; 
            par_in = 8'b10101010;
        #10 mode = 2'b00;

        #10 mode = 2'b10;
            s_in_left = 1;
        #10 mode = 2'b10;
            s_in_left = 0;

        #10 mode = 2'b01;
            s_in_right = 1;
        #10 mode = 2'b01;
            s_in_right = 0;

        #10 mode = 2'b00;

        #50 $finish;
    end

    initial begin
        $monitor("Time = %0t | Mode = %b | par_in = %b | s_in_left = %b | s_in_right = %b | q = %b", 
                 $time, mode, par_in, s_in_left, s_in_right, q);
    end

endmodule
