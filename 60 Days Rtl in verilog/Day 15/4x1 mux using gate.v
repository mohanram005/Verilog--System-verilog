module m41(out, a, b, c, d, s0, s1);

output out;
input a, b, c, d, s0, s1;
wire sobar, s1bar, T1, T2, T3, T4;

not (s0bar, s0), (s1bar, s1);
and (T1, a, s0bar, s1bar), (T2, b, s0bar, s1),(T3, c, s0, s1bar), (T4, d, s0, s1);
  or(out, T1, T2, T3, T4); // if out =1 the s0,s1 matchs with the input

endmodule

module tb_m41;

  // Declare testbench signals
  reg a, b, c, d;
  reg s0, s1;
  wire out;

  // Instantiate the 4:1 multiplexer
  m41 uut (
    .out(out),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .s0(s0),
    .s1(s1)
  );

  // Test stimulus
  initial begin
    // Initialize inputs
    a = 0; b = 0; c = 0; d = 0; s0 = 0; s1 = 0;

    // Monitor outputs
    $monitor("time = %0t: a = %b, b = %b, c = %b, d = %b, s0 = %b, s1 = %b, out = %b", $time, a, b, c, d, s0, s1, out);

    // Apply test cases
    #5  a = 1; b = 0; c = 0; d = 0; s0 = 0; s1 = 0;
    #5  a = 0; b = 1; c = 0; d = 0; s0 = 1; s1 = 0;
    #5  a = 0; b = 0; c = 1; d = 0; s0 = 0; s1 = 1;
    #5  a = 0; b = 0; c = 0; d = 1; s0 = 1; s1 = 1;

    
    #5  a = 1; b = 1; c = 0; d = 0; s0 = 0; s1 = 0;
    #5  a = 0; b = 1; c = 1; d = 0; s0 = 0; s1 = 1;
    #5  a = 0; b = 0; c = 1; d = 1; s0 = 1; s1 = 1;
    #5  a = 1; b = 0; c = 0; d = 1; s0 = 1; s1 = 0;

    // Finish simulation
    #10 $finish;
  end

endmodule
