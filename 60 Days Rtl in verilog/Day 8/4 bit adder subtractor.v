module full_adder (
    input wire a,        
    input wire b,        
    input wire cin,      
    output wire sum,     
    output wire carry 
);

    assign sum = a ^ b ^ cin;    // Sum is the XOR of a, b, and carry-in
    assign carry = (a & b) | (cin & (a ^ b)); // Carry-out is calculated

endmodule

module add_sub(
    input [3:0] a,
    input [3:0] b,
    input ctr,
    output [3:0] sum,
    output carry
);

    wire [3:0] b_xor;
    wire [3:0] carry_internal;

    
  assign b_xor = b ^ {4{ctr}};// if the ctr is "0" then the output is addition of 4 bit  if its been a ctr =1 then output is subtraction

    
    full_adder fa0(
        .a(a[0]), 
        .b(b_xor[0]), 
        .cin(ctr), 
        .sum(sum[0]), 
        .carry(carry_internal[0])
    );

    
    genvar i;
    generate
        for (i = 1; i < 4; i = i + 1) begin : gen_full_adders
            full_adder fa(
                .a(a[i]),
                .b(b_xor[i]),
                .cin(carry_internal[i-1]),
                .sum(sum[i]),
                .carry(carry_internal[i])
            );
        end
    endgenerate

    // Final carry-out
    assign carry = carry_internal[3];

endmodule




// Code your testbench here
// or browse Examples
module add_sub_tb;

reg [3:0] a, b;
reg ctr;
wire [3:0] sum;
wire carry;

add_sub uut (.a(a), .b(b), .ctr(ctr), .sum(sum), .carry(carry));

initial begin
  $dumpfile("add_sub.vcd");
  $dumpvars(0, add_sub_tb);

  a = 4; b = 2; ctr = 0; #10;
  a = 7; b = 5; ctr = 0; #10;
  a = 9; b = 1; ctr = 1; #10;
  a = 12; b = 8; ctr = 1; #10;
  $finish;
end

always @(*) begin
  $display("a = %b, b = %b, ctr = %b, sum = %b, carry = %b", a, b, ctr, sum, carry);
end

endmodule
