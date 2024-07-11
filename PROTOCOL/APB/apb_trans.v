module apb_trans(
  input p_clk,
  input p_reset,
  input p_sel,
  input [7:0] p_addr,
  
  // Write
  input p_write,
  input [7:0] p_wdata,
  input p_enable,
  input transfer,
  
  // Read
  output reg [7:0] p_rdata,
  output reg p_serror,
  input p_ready
);

  parameter [1:0] idle = 2'b00,
                  setup = 2'b10,
                  access = 2'b11;

  reg [7:0] mem [7:0];
  reg [1:0] state, ns;

  always @(posedge p_clk or posedge p_reset) begin
    if (p_reset) begin
      state <= idle;
    end else begin
      state <= ns;
    end
  end

  always @(*) begin
    ns = state; // Default to current state to avoid latches
    
    p_serror = 0;

    case (state)
      idle: begin
        if (p_sel && !p_enable) begin
          if (transfer) begin
            ns = setup;
          end
        end
      end

      setup: begin
        if (p_sel && !p_enable) begin
          ns = access;
        end else begin
          ns = idle;
        end
      end

      access: begin
        if (p_sel && p_enable) begin
          if (transfer && p_ready) begin
            if (p_write) begin
              mem[p_addr] = p_wdata;
             
              p_serror = 0;
            end 
            if(!p_write) begin
              p_rdata = mem[p_addr];
              
              p_serror = 0;
            end
          end else begin
            ns = idle;
          end
        end
      end
    endcase
  end
endmodule


// Code your testbench here
// or brow

module apb_tb;
  
  reg p_clk;
  reg p_reset;
  reg[7:0] p_addr;
  reg p_sel;
  
  reg p_write;
  reg p_enable;
  reg [31:0]p_wdata;


  reg transfer;
  reg p_ready;
  
  wire[31:0] p_rdata;
 
  wire p_serror;
  
  
  apb_trans dut(.p_clk(p_clk),
          .p_reset(p_reset),
          .p_addr(p_addr),
          .p_sel(p_sel),
          .p_write(p_write),
          .p_wdata(p_wdata),
          .p_rdata(p_rdata),
          .p_enable(p_enable),
          .p_serror(p_serror),
                .p_ready(p_ready),
          .transfer(transfer));
  
  always #5 p_clk = ~p_clk;
  
  task initialization;
    
    begin
      
      p_clk = 0;
      p_reset = 0;
      p_addr = 0;
      p_sel = 0;
      p_enable = 0;
      p_write = 0;
      transfer =0;
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
      
      transfer =  0;
      p_write = 1;
      p_sel = 1;
      p_wdata = $random % 10;
      p_ready =1 ;
      
      p_addr = p_addr + 1;
      
      @(posedge p_clk);
      
      p_enable = 1;
      p_sel = 1;
      
      
      @(posedge p_clk);
      
      p_enable = 0;
      p_sel = 0;
      
      @(posedge p_clk);
      $strobe("write operation p_wdata =%0d | p_addr = %0d ",p_wdata,p_addr);
      
    end
  endtask
  
  task readsim;
    begin
      @(posedge p_clk);
      p_ready = 1;
      transfer = 1;
      p_write = 0;
      p_enable = 1;
      p_sel = 1;
      
      @(posedge p_clk);
      
      p_sel = 1;
      p_enable = 1;
      p_addr = p_addr + 1;
      
      @(posedge p_clk);
      
      p_sel = 0;
      p_enable = 0;
      p_ready = 0;
      
      $strobe("read operation p_rdata =%0d | p_addr = %0d ",p_rdata,p_addr);
      
    end
  endtask
  
  task read_write;
    begin
      
      repeat(2) begin
        writesim;
      end
      #1
      p_addr = 0;  // Reset address before reading
      repeat(3) begin
        
        readsim;
      end
    end
  endtask
  initial begin
    
    $dumpfile("apb_trans.vcd");
    $dumpvars;
    initialization;
    reset;
    read_write;
    #80; $finish;
  end
endmodule
    
    
    
      
      
     
      
      
      
          
          
          
            
            
