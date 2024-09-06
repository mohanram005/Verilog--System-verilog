module mux4x1 (
    input wire [1:0] sel,
    input wire d0,        
    input wire d1,        
    input wire d2,       
    input wire d3,        
    output wire y         
);

    assign y = (sel == 2'b00) ? d0 :
               (sel == 2'b01) ? d1 :
               (sel == 2'b10) ? d2 :
               d3;

endmodule

module full_adder (
    input wire A,       
    input wire B,       
    input wire Cin,     
    output wire Sum,  
    output wire Cout    
);

    wire [1:0] sel;     
    assign sel = {A, B};

    
    wire sum0, sum1, sum2, sum3;
    assign sum0 = Cin;
    assign sum1 = ~Cin;
    assign sum2 = ~Cin;
    assign sum3 = Cin;

    
    wire cout0, cout1, cout2, cout3;
    assign cout0 = 0;
    assign cout1 = Cin;
    assign cout2 = Cin;
    assign cout3 = 1;


    mux4x1 sum_mux (
        .sel(sel),
        .d0(sum0),
        .d1(sum1),
        .d2(sum2),
        .d3(sum3),
        .y(Sum)
    );

  
    mux4x1 cout_mux (
        .sel(sel),
        .d0(cout0),
        .d1(cout1),
        .d2(cout2),
        .d3(cout3),
        .y(Cout)
    );

endmodule

