module func_coverage;
  bit [7:0] addr, data;
  
  covergroup c_group;
    cp1: coverpoint addr;
    cp2: coverpoint data;
    cp1_X_cp2: cross cp1, cp2;
  endgroup : c_group

  c_group cg = new();
  
  initial begin
    cg.start();
    cg.set_inst_name("my_cg");
    
    forever begin
      cg.sample();
      #5;
    end
  end
  
  initial begin
    $monitor("At time = %0t: addr = %0d, data = %0d", $time, addr, data);
    repeat(500) begin
      addr = $random;
      data = $random;
      #5;
    end
    cg.stop();
    $display("Coverage = %f", cg.get_coverage()); // to get a coverage percentage (based on all combination are covered)
    $finish;
  end
  
endmodule
