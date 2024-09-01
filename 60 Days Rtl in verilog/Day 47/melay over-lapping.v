
//1101 melay OVER LAPPING
module melayover(input clk,reset,din,
                 output reg dout,
                 output reg[1:0] ns);
  
  parameter[1:0] s0 = 2'b00,
  				s1 = 2'b01,
  				s2 = 2'b10,
  				s3 = 2'b11;
  reg [1:0] state;
  
  always@(posedge clk or posedge reset) begin
    if(reset) begin
      state<=s0;
      dout=1'b0;
    end else
      state<=ns;
  end
  always@(*) begin
    case(state)
      s0: begin
        if(din)begin
          ns<=s1;
          dout=1'b0;
        end else begin
          ns<=s0;
          dout=1'b0;
        end
      end
      s1: begin
        if(din)begin
          ns<=s2;
          dout=1'b0;
        end else begin
          ns<=s0;
          dout=1'b0;
        end
      end
      s2: begin
        if(~din)begin
          ns<=s3;
          dout=1'b0;
        end else begin
          ns<=s2;
          dout=1'b0;
        end
      end
      s3: begin
        if(din)begin
          ns<=s1;
          dout=1'b1;
        end else begin
          ns<=s0;
          dout=1'b0;
        end
      end
    endcase
  end
endmodule
