// Code your design here


module srff(input s,r,clk,
            output q,qbar);
  wire nand_out1;
  wire nand_out2;
  
  nand n1(nand_out1,s,clk);
  nand n2(nand_out2,r,clk);
  nand n3(q,nand_out1,qbar);
  nand n4(qbar,nand_out2,q);
  
endmodule


// Code your testbench here
// or browse Examples


module srff_tb;
  
  reg s,r,clk;
  wire q,qbar;
  
  srff sr(s,r,clk,q,qbar);
  
  ///initial beign clk=0; #5 clk=~clk;

  
  initial begin
    
    s=0; r=0; clk=0; #2;
    
    s=1; r=0; clk=0; #2;
    
    
    s=0; r=0; clk=1; #2;
    
    
   
    
  end
  initial begin
    $dumpfile("srff.vcd");
    $dumpvars(0,srff_tb);
  end
endmodule
           
