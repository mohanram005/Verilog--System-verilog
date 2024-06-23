// Code your design here

module comparator(input[3:0]a,b,output reg a_gra_b,a_less_b,a_equ_b);
  
  always@(*) begin
    
    a_gra_b=0; a_less_b=0; a_equ_b=0;
    
    
    
    if(a>b) a_gra_b =1'b1;
    else if(a<b) a_less_b = 1'b1;
    else a_equ_b = 1'b1;
    
  end 
  
endmodule

// Code your testbench here
// or browse Examples

module comparator_tb;
  
  reg[3:0]a,b;
  wire a_gra_b,a_less_b,a_equ_b;
  
  comparator co(a,b,a_gra_b,a_less_b,a_equ_b);
  
  initial begin
    $monitor("a=%b,b=%b,a_gra_b = %b,a_less_b = %b,a_equ_b=%b(%d)",a,b,a_gra_b,a_less_b,a_equ_b);
    
    a=2; b=3; #2;
    
    a=5; b=3; #2;
    
    
    a=3; b=3; #2;
    
    
    a=2; b=10; #2;
    
  end
endmodule
