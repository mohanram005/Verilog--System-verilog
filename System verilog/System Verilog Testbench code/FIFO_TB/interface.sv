
interface operation;
  
  logic clk;
  logic reset;
  logic write_enable;
  logic read_enable;
  logic[0:7] data_in;
  bit full;
  bit empty;
  bit[7:0]dout;
  
endinterface
