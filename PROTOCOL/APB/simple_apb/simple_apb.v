// Code your design here


module apb(p_clk,p_reset,p_add,p_sel,p_write,p_wdata,p_rdata,p_enable,p_slverr,p_ready,ns);
  
  input p_clk;
  input p_reset;
  input[31:0] p_add;
  input p_sel;
  
  
  // wirte
  input p_write;
  input p_enable;
  input[31:0]p_wdata;
  
  //read
  
  output reg[31:0]p_rdata;
  output reg p_ready;
  output reg p_slverr;
  output reg[1:0]ns;
  
  reg[31:0] mem [31:0];
  
  parameter[1:0] idle = 2'b00,
  
  setup = 2'b01,
  
  access = 2'b10;
  
  reg[1:0] state;
  
  always@(posedge p_clk) begin
    
    if(p_reset)
      
      state <= idle;
  else 
    
    state <= ns;
    
  end
  
  always@(*) begin
    
    case(state)
      
      idle : begin
        
        if(!p_enable && !p_sel) begin
          
          ns = idle;
          p_ready = 0;
          
          
        end else begin
          
          ns = setup;
        end
      end
        
        
        setup : begin
          
          if( !p_enable | !p_sel) begin
            
            ns = idle;
            p_ready = 0;
            
          end else begin
            
            ns = access;
            
            if(p_write == 1) begin
              
              mem[p_add] = p_wdata;
              p_ready = 1;
              p_slverr = 0;
            end else begin
              
              // read operation
              
              p_rdata = mem[p_add];
              p_ready = 1;
              p_slverr = 0;
            end
          end
          
          
          access : begin
            
             if( !p_enable | !p_sel) begin
               
               ns = idle;
               p_ready = 0;
               
             end
          end
        end
    endcase
  end
endmodule
      
          
      
      
              
            
            
          
          
          
          
        
          
          
          
          
  
  
  
  
  
