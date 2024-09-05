module fifo(input clk,reset,
            
            input write_enable,
            input read_enable,
            input[7:0] data_in,
            output full,
            output empty,
            output  reg [7:0]dout);
  
  reg [7:0] fifo_mem [7:0];
  reg [2:0] wp;
  reg [2:0] rp;
  reg [3:0] count;
  
  assign full = (count == 8);
  assign empty = (count == 0);
  
  always@(posedge clk or posedge reset) begin
    
    if(reset)
      
      wp <= 0;
    else if (write_enable && !full) begin
      
      fifo_mem[wp] <= data_in;
      
      wp <= wp + 1;
      
    end
  end
  
  
  always@(posedge clk or posedge reset) begin
    
    if(reset) begin
      
     rp <= 0;
      dout <= 0;
      end else if (read_enable && !empty) begin
      
        dout <= fifo_mem[rp] ;
      
      rp <= rp + 1;
      
    end
  end
  
  always@(posedge clk or posedge reset) begin
    
    if(reset)
      
      count <= 0;
    else begin
      if (write_enable  && !full && !(read_enable && !empty)) begin
      
      count <= count + 1;
    
      end else if(read_enable && !empty && !(write_enable  && !full)) begin
        
        count <= count -1 ;
    end
      
    end
  end
endmodule
