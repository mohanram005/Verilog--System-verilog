module tb_bidirectional_shift_register;

    parameter WIDTH = 8;

    reg clk;
    reg rst;
    reg mode;
    reg s_in;
    reg [WIDTH-1:0] par_in;
    reg load;
    wire [WIDTH-1:0] q;

    bidirectional_shift_register #(
        .WIDTH(WIDTH)
    ) uut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .s_in(s_in),
        .par_in(par_in),
        .load(load),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        mode = 0;
        s_in = 0;
        par_in = 8'b00000000;
        load = 0;

        rst = 1;
        #10 rst = 0;

        par_in = 8'b10101010;
        load = 1;
        #10 load = 0;

        mode = 0;
        s_in = 1;
        #10;
        

        mode = 1;
        s_in = 0;
        #10;
        

        mode = 1;
        s_in = 1;
        #10;
        

        par_in = 8'b11001100;
        load = 1;
        #10 load = 0;

        mode = 0;
        s_in = 0;
        #10;
        
        $finish;
    end

    initial begin
        $monitor("Time = %0t | rst = %b | mode = %b | s_in = %b | load = %b | par_in = %b | q = %b", $time, rst, mode, s_in, load, par_in, q);
    end

    initial begin
        $dumpfile("tb_bidirectional_shift_register.vcd");
        $dumpvars(0, tb_bidirectional_shift_register);
    end

endmodule
