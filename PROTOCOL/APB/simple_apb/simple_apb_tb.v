// Code your testbench here
// or brow

module apb_tb;
  
  reg p_clk;
  reg p_reset;
  reg[31:0] p_add;
  reg p_sel;
  
  reg p_write;
  reg p_enable;
  reg [31:0]p_wdata;
  
  wire[31:0] p_rdata;
  wire p_ready;
  wire p_slverr;
  wire [1:0]ns;
  
  apb dut(.p_clk(p_clk),
          .p_reset(p_reset),
          .p_add(p_add),
          .p_sel(p_sel),
          .p_write(p_write),
          .p_wdata(p_wdata),
          .p_rdata(p_rdata),
          .p_enable(p_enable),
          .p_slverr(p_slverr),
          .p_ready(p_ready),
          .ns(ns));
  
  always #5 p_clk = ~p_clk;
  
  task initialization;
    
    begin
      
      p_clk = 0;
      p_reset = 0;
      p_add = 0;
      p_sel = 0;
      p_enable = 0;
      p_write = 0;
    end
    
  endtask
  
  task reset;
    
    begin
      
      p_reset = 1;
      #10 p_reset = 0;
    end
  endtask
  
  task writesim;
    begin
      @(posedge p_clk);
      
      p_write = 1;
      p_sel = 1;
      p_wdata = $random % 10;
      
      p_add = p_add + 1;
      
      @(posedge p_clk);
      
      p_enable = 1;
      p_sel = 1;
      
      
      @(posedge p_clk);
      
      p_enable = 0;
      p_sel = 0;
      
      @(posedge p_clk);
      $strobe("write operation p_wdata =%0d | p_add = %0d | ns = %b",p_wdata,p_add,ns);
      
    end
  endtask
  
  task readsim;
    begin
      @(posedge p_clk);
      
      p_write = 0;
      p_enable = 0;
      p_sel = 1;
      
      @(posedge p_clk);
      
      p_sel = 1;
      p_enable = 1;
      p_add = p_add + 1;
      
      @(posedge p_clk);
      
      p_sel = 0;
      p_enable = 0;
      
      $strobe("read operation p_rdata =%0d | p_add = %0d |ns =%b",p_rdata,p_add,ns);
      
    end
  endtask
  
  task read_write;
    begin
      
      repeat(2) begin
        writesim;
      end
      #1
      p_add = 0;  // Reset address before reading
      repeat(3) begin
        
        readsim;
      end
    end
  endtask
  initial begin
    
    $dumpfile("apb.vcd");
    $dumpvars;
    initialization;
    reset;
    read_write;
    #80; $finish;
  end
endmodule
    
    
    
      
      
     
      
      
      
          
          
          
            
            
