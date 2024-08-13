module taskopera(
    input [3:0] a,
    input [3:0] b,
    output [3:0] result
);

    reg [3:0] temp_result; 

    task or_operation;
        input [3:0] int1, int2;
        output [3:0] out;
        begin
            out = int1 | int2;
        end
    endtask

   
    always @(*) begin
        or_operation(a, b, temp_result);
    end

    
    assign result = temp_result;

endmodule


// Code your testbench here
// or browse Examples

module taskopera_tb;
  
  reg [3:0]a,b;
  wire[3:0] or_result;
  
  taskopera to(a,b,or_result);
  
  initial begin
    $monitor("time=%t,a=%b,b=%b,or_result=%b",$time,a,b,or_result);
    
    a=2; b=5; #2;
    a=6; b=5; #2;
    a=7; b=5; #2;
    a=2; b=8; #2;
    
  end
endmodule
