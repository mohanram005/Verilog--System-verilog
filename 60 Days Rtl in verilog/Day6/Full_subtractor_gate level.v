module fullsub(input a,b,c,
               output diff,borrow);
  
  xor n(diff,a,b,c);
  not n1(y,a);
  xor x1(y2,a,b);
  and n2(y1,y,b);
 
  and x2(y3,y2,c);
  or x3(borrow,y1,y3);
  
endmodule


// Code your testbench here
// or browse Examples

module testbench;
  reg a, b, c;            // Input registers
  wire diff, borrow;      // Output wires

  // Instantiate the full_sub module
  fullsub uut (
    .borrow(borrow),
    .diff(diff),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    

    // Apply test vectors
    a = 0; b = 0; c = 0; #10;
    $display("%b %b %b | %b    %b    | 0     0", a, b, c, diff, borrow);

    a = 0; b = 0; c = 1; #10;
    $display("%b %b %b | %b    %b    | 1     1", a, b, c, diff, borrow);

    a = 0; b = 1; c = 0; #10;
    $display("%b %b %b | %b    %b    | 1     1", a, b, c, diff, borrow);

    a = 0; b = 1; c = 1; #10;
    $display("%b %b %b | %b    %b    | 0     1", a, b, c, diff, borrow);

    a = 1; b = 0; c = 0; #10;
    $display("%b %b %b | %b    %b    | 1     0", a, b, c, diff, borrow);

    a = 1; b = 0; c = 1; #10;
    $display("%b %b %b | %b    %b    | 0     0", a, b, c, diff, borrow);

    a = 1; b = 1; c = 0; #10;
    $display("%b %b %b | %b    %b    | 0     0", a, b, c, diff, borrow);

    a = 1; b = 1; c = 1; #10;
    $display("%b %b %b | %b    %b    | 1     1", a, b, c, diff, borrow);

    $stop;
  end
  initial begin
    $dumpfile("fullsub.vcd");
    $dumpvars(1,testbench);
  end
endmodule
