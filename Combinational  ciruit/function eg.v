module funopera(
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] result
);

    

  function [3:0]or_operation;
        input [3:0] int1, int2;
        
        begin
            or_operation = int1 | int2;
        end
  endfunction

   
  always @(a or b) begin
        result = or_operation(a, b);
    end

    
    
endmodule





module funopera_tb;
  
  reg [3:0]a,b;
  wire[3:0] result;
  
  funopera to(a,b,result);
  
  initial begin
    $monitor("time=0%t,a=%b,b=%b,result=%b",$time,a,b,result);
    
    a = 4'b1100; b = 4'b1010; #10; 
	a = 4'b0110; b = 4'b1001; #10; 
    a = 4'b1111; b = 4'b0000; #10; 
    a = 4'b1010; b = 4'b0101; #10; 
    
  end
endmodule

