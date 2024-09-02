
//1101
module moorenon(input clk,reset,din,
                output reg dout,
                output reg[2:0] ns);
  
  parameter [2:0] s0 =3'b000,
  					s1 = 3'b001,
  					s2 = 3'b010,
  					s3 =3'b011,
  					s4 = 3'b100;
  
  reg[2:0] state;
  
  always@(posedge clk or posedge reset) begin
    if(reset) begin
      state<=s0;
      dout<=1'b0;
    end
    else
      state <= ns;
  end
  always@(*) begin
      case(state)
        s0: begin
          dout<=1'b0;
          if(din)
            ns<=s1;
          
          else
            ns<=s0;
        end
        s1:begin 
          dout<=1'b0;
          if(din)
            ns<=s2;
          else
            ns<=s0;
        end
        s2: begin
          dout<=1'b0;
          if(~din)
            ns<=s3;
          else
            ns<=s2;
        end
        s3:begin
          dout<=1'b0;
          
          if(din)
            ns<=s4;
          else
            ns<=s0;
        end
        s4:begin
          dout<=1'b1;
          if(din)
            ns<=s1;
          else
            ns<=s0;
        end
          
      endcase
    end
endmodule
