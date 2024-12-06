module latch(
    input logic d,        // Data input
    input logic en,       // Enable signal
    output logic q        // Output
);
    always_comb begin
        if (en)           // When enable is high
            q = d;        // Output follows input
        // When enable is low, q holds its previous value
      
      $display("the q = %0d",q);
    end
endmodule

module tb;
  
  reg d,en;
  wire q;
  
  latch dut(.d(d),.en(en),.q(q));
  
  initial begin
    
    en = 1;
    
    d = 1;
    
    #5;
    d = 0;
    
    #10;
    en = 0;
    
    d = 1;
    
    #5;
    d = 0;
    
    
  end
endmodule the q = x
# KERNEL: the q = 1
# KERNEL: the q = 0
# KERNEL: the q = 0 en = 0;
it hold previous
# KERNEL: the q = 0
