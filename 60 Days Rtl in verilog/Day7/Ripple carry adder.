module full_adder (
    input wire a,        
    input wire b,        
    input wire cin,      
    output wire sum,     
    output wire cout    
);

    assign sum = a ^ b ^ cin;    // Sum is the XOR of a, b, and carry-in
    assign cout = (a & b) | (cin & (a ^ b)); // Carry-out is calculated

endmodule


module ripple_carry_adder (
    input wire [3:0] a,  // 4-bit input a
    input wire [3:0] b,  
    input wire cin,     
    output wire [3:0] sum, 
    output wire cout     
);

    wire c1, c2, c3;  

   // instataion fa0 fa2 as a unique
    full_adder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
    full_adder fa1 (.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
    full_adder fa2 (.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
    full_adder fa3 (.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout));

endmodule



module ripple_carry_adder_tb;

    reg [3:0] a; 
    reg [3:0] b; 
    reg cin;      
    wire [3:0] sum; 
    wire cout;     

    ripple_carry_adder rca (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $monitor("time = %0t | a = %b | b = %b | cin = %b | sum = %b | cout = %b", $time, a, b, cin, sum, cout);

        
        a = 4'b0001; b = 4'b0010; cin = 1'b0; #10;
        a = 4'b0110; b = 4'b0011; cin = 1'b0; #10;
        a = 4'b1111; b = 4'b0001; cin = 1'b0; #10;
        a = 4'b1010; b = 4'b0101; cin = 1'b1; #10;

        $finish;
    end

    initial begin
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0, ripple_carry_adder_tb);
    end
endmodule
