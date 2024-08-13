// Code your design here

module arrmulti(input[3:0] a,b,
                output[7:0] p); // finial sum is the product
  
  wire [3:0]pp0,pp1,pp2,pp3;
  wire [7:0]sum1,sum2,sum3;  //assign the size its very important
  
  
  //product of 4 bit a,b
  assign pp0 = a & {4{b[0]}};
  assign pp1 = a & {4{b[1]}};
  assign pp2 = a & {4{b[2]}};
  assign pp3 = a & {4{b[3]}};
  
  //sum operation for product
  
   assign sum1 = {pp1, 1'b0} + {1'b0, pp0};
   assign sum2 = {pp2, 2'b00} + sum1;
   assign sum3 = {pp3, 3'b000} + sum2;

  //finial product
  
  assign p = sum3;
  
endmodule


module arrmulti_tb;

    reg [3:0] a, b;
    wire [7:0] p;

    arrmulti am (
        .a(a),
        .b(b),
        .p(p)
    );

    initial begin
        $monitor("a = %b, b = %b, p = %b", a, b, p);
        
        a = 1; b = 4; #10;
        a = 7; b = 5; #10;
        a = 8; b = 9; #10;

        $finish;
    end

endmodule


