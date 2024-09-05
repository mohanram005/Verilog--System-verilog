module fifo_tb;
  
//inputs
  reg clk,reset;
  reg write_enable;
  reg read_enable;
  reg[7:0] data_in;
  
  //output
  wire full;
  wire empty;
  wire [7:0]dout;
  
  fifo dut(clk,reset,write_enable,read_enable,data_in,full,empty,dout);
  
  initial begin
    
    clk = 1;
    forever #5 clk = ~clk;
  end
  
  initial begin
    
    $monitor("time = %0t | reset = %b | write_enable = %b | read_enable = %b | data_in = %b | full = %b | empty = %b | dout = %b",$time,reset,write_enable,read_enable,data_in,full,empty,dout);
    
    reset = 1;
    write_enable = 0;
    read_enable = 0;
    data_in = 0;
    
    #10;
    
    //start write 

    reset = 0;
    write_enable = 1;
    
    
    data_in = 8'hA1; #10;
    data_in = 8'hB1; #10;
    data_in = 8'hC1; #10;
    data_in = 8'hD1; #10;
    data_in = 8'hE1; #10;
    data_in = 8'hF1; #10;
    data_in = 8'h1A; #10;
    data_in = 8'h1C; #10;
    
    write_enable = 0;
    
    #10;
    
    read_enable = 1;
    #80;
    
    read_enable = 0;
    
    write_enable = 1; 
    read_enable = 1;
    data_in = 8'h9A; #10;
    data_in = 8'hBC; #10;
    data_in = 8'hDE; #10;
    write_enable = 0;
    #30;
    
    #100 $finish;
    
  end
  initial begin
    
    $dumpfile("fifo.vcd");
    $dumpvars(0,fifo_tb);
  end
endmodule
    
