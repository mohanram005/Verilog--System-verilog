
module lookcarry(
    input [4:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);


wire [4:0]c_g,c_p;
wire [4:0]carry;

assign carry[0]=cin;
genvar i;

generate
 for(i=0;i<4;i=i+1) begin 
  assign c_g[i]=a[i]& b[i];
  assign c_p[i]= a[i]^b[i];
  assign carry[i+1]= c_g | (c_p & carry[i]);
  
   assign sum[i]= a[i] ^ b[i] ^ carry[i];// sum operation
 end
 endgenerate
assign cout = carry[4];
endmodule


// Code your testbench here
// or browse Examples
module lookcarry_tb;

reg [3:0] a,b;
reg cin;

wire [3:0] sum,carry;

lookcarry lc (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

initial begin

a=15; b=11; cin=0; #2;
  
  a=10; b=11; cin=0; #2;
  
  a=14; b=15; cin=1; #2;
  
  a=9; b=10; cin=1; #2;
  
  a=8; b=10; cin=0; #2;
  
  a=12; b=11; cin=0; #2;
  
  a=15; b=15; cin=1; #2;
  
  
end

  always@(*) begin
 $display("a = %b, b = %b,c =%b,sum = %b,cout = %b" ,a,b,cin,sum,cout);
  end
  initial begin
  
    $dumpfile("lookcarry.vcd");
    $dumpvars(0,lookcarry_tb);
  end

endmodule
        
