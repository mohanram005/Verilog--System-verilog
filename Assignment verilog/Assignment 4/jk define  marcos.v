module jk_ff (
    input j, k, clk, reset,
    output reg Q,
    output reg ns
);

// Define macros for states
`define SET 2'b00
`define RESET 2'b01
`define TOGGLE 2'b10
`define HOLD 2'b11


reg [1:0] state;


always @(*) begin
    if (reset) begin
        state <= `RESET; 
    end else begin
        state <= ns; 
    end
end


always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q <= 1'b0; 
    end else begin
        case (state)
            `SET: begin
                if (j && k)
                    Q <= ~Q; 
                else if (j)
                    Q <= 1'b1;
                else if (k)
                    Q <= 1'b0; 
            end
            `RESET: begin
                Q <= 1'b0; 
            end
            `TOGGLE: begin
                Q <= ~Q; 
            end
            `HOLD: begin
                
            end
            
        endcase
    end
end

endmodule



// Code your testbench here
// or browse Example


module jk_ff_tb;
  
  reg j, k, clk, reset;
  wire Q, ns;
  
  // Instantiate jk_ff module
  jk_ff jk_ff_inst (
    .j(j),
    .k(k),
    .clk(clk),
    .reset(reset),
    .Q(Q),
    .ns(ns)
  );
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  // Stimulus generation and monitoring
  initial begin
    
    
    // Apply reset
    reset = 1;
    #10;
    reset = 0;
    
    // Allow some time for the reset to stabilize
    #10;
    
    // Various input combinations
    j = 0; k = 1; // Scenario 1
    #10;
    
    j = 0; k = 0; // Scenario 2
    #10;
    
    j = 0; k = 1; // Scenario 3
    #10;
    
    j = 1; k = 0; // Scenario 4
    #10;
    
    j = 1; k = 1; // Scenario 5
    #10;
    
    // End simulation
    $finish;
  end
  always @(posedge clk) begin
        $display("time = %0t | j = %b | k = %b | Q = %b | ns = %b", $time, j, k, Q, ns);
    end
  
endmodule
