module simple_tb;
  
  reg clk,we;
  reg [9:0]ADDR;
  reg [31:0]WDATA;
  wire [31:0]RDATA;
  
  simple_ram dut(clk,we,ADDR,WDATA,RDATA);
  
  initial begin
    
    clk = 1;
    forever #5 clk = ~clk;
    
  end
  
  initial begin
    $monitor("time = %0t | ADDR = %b | WDATA = %b | RDATA = %b",$time, ADDR,WDATA,RDATA);
    
    
    we =  1;
    #10;
    ADDR = 8'b00000001;
    WDATA = 8'b10101010;
    #10;
    
    we =  1;
    #10;
    ADDR = 8'b00000010;
    WDATA = 8'b10101000;
    #10;
    
    we = 0;
    
   ADDR = 8'b00000001; 
   #10;
    
   ADDR = 8'b00000010;
    
    #100 $finish;
    
    
  end
  initial begin
  $dumpfile("simple_ram.vcd");
  $dumpvars(0,simple_tb);
  end
  
endmodule
    
  
