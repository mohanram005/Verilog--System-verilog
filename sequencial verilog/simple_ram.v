// Code your design here


module simple_ram
#(
    parameter DATA_WIDTH = 32,       // Number of bits in each word
    parameter ADDR_WIDTH = 10        // Number of bits for the address (2^10 = 1024 locations)
)
(
    input wire clk,                 // Clock signal
    input wire we,                  // Write enable signal
    input wire [ADDR_WIDTH-1:0] addr,// Address bus
    input wire [DATA_WIDTH-1:0] din, // Data input bus
    output reg [DATA_WIDTH-1:0] dout // Data output bus
);

    // Declare RAM variable
    reg [DATA_WIDTH-1:0] ram [0:2**ADDR_WIDTH-1];

    always @(posedge clk) begin
        if (we) begin
            // Write operation
            ram[addr] <= din;
        end else begin
            // Read operation
            dout <= ram[addr];
        end
    end


  // Code your testbench here
// or browse Examples


module tb;

  reg [31:0] din;
  reg [9:0] addr;
 reg clk ,we;

  wire [31:0] dout;

  simple_ram ins (clk,we,addr,din,dout);
initial begin

  din  = 8'h0;

  addr  = 8'h0;

  we = 1'b0;

  clk  = 1'b0;

  #100;

  din  = 8'h0;

  addr  = 8'h0;

  we  = 1'b1;

  #20;

  din  = 8'h0;

  addr  = 8'h0;

  #20;

  din  = 8'h1;

  addr  = 8'h1;

  #20;

  din = 8'h10;

  addr  = 8'h2;

  #20;

  din  = 8'h6;

  addr  = 8'h3;

  #20;

  din = 8'h12;

  addr  = 8'h4;

  #40;

  addr  = 8'h0;

  we = 1'b0;

  #20;
  addr   = 8'h1;
  #20;
  addr   = 8'h2;
  #20;
  addr   = 8'h3;
  #20;
  addr   = 8'h4;
 end
 always #10 clk = ~clk;
   initial begin
     $dumpfile("simple_ram.vcd");
    $dumpvars();
     $monitor("clk=%0d,we=%0d,addr=%0d,din=%0d,dout=%0d",clk,we,addr,din,dout);
    #500 $finish;
  end
endmodule

endmodule
