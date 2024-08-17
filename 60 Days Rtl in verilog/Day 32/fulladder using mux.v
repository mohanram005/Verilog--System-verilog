// Code your design here
module mux_4x1 (
    input D0, D1, D2, D3, 
    input S0, S1,         
    output Y              
);

    assign Y = (S1 == 0 && S0 == 0) ? D0 :
               (S1 == 0 && S0 == 1) ? D1 :
               (S1 == 1 && S0 == 0) ? D2 :
                                     D3;

endmodule
module full_adder_mux (
    input A, B, Cin,
    output Sum, Cout
);

    wire S0, S1;
    wire Sum_in0, Sum_in1, Sum_in2, Sum_in3;
    wire Cout_in0, Cout_in1, Cout_in2, Cout_in3;

    // Select lines
    assign S0 = A;
    assign S1 = B;

    
    assign Sum_in0 = Cin;       
    assign Sum_in1 = ~Cin;      
    assign Sum_in2 = ~Cin;      
    assign Sum_in3 = Cin;       

    
    assign Cout_in0 = 0;       
    assign Cout_in2 = Cin;      
    assign Cout_in1 = Cin;      
    assign Cout_in3 = 1;      

   
    mux_4x1 mux_sum (
        .D0(Sum_in0),
        .D1(Sum_in1),
        .D2(Sum_in2),
        .D3(Sum_in3),
        .S0(S0),
        .S1(S1),
        .Y(Sum)
    );

    
    mux_4x1 mux_cout (
        .D0(Cout_in0),
        .D1(Cout_in1),
        .D2(Cout_in2),
        .D3(Cout_in3),
        .S0(S0),
        .S1(S1),
        .Y(Cout)
    );

endmodule
