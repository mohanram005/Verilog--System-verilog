//the out
module func_coverage;
  logic [3:0] addr;
  logic [3:0] data;
  logic clk, reset_n;

  // Define the covergroup
  covergroup c_group @(posedge clk);
    // Coverpoint for addr
    cp_addr: coverpoint addr {
      bins addr_bins[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    }

    // Coverpoint for data
    cp_data: coverpoint data {
      bins data_bins[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    }

    // Intersect bins for specific intersections of addr and data
    bins intersect_bins = intersect {cp_addr.addr_bins, cp_data.data_bins} with (item1 == item2);
  endgroup

  // Instantiate the covergroup
  c_group cg = new();

  // Generate clock signal
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    reset_n = 1;
    addr = 4'b0000;
    data = 4'b0000;

    // Apply reset
    #10 reset_n = 0;  // Assert reset
    #10 reset_n = 1;  // Deassert reset

    // Apply some values to addr and data
    repeat (20) begin
      @(posedge clk);
      addr = $urandom_range(0, 15);
      data = $urandom_range(0, 15);
      cg.sample();
      $display("Sampled addr = %0d, data = %0d", addr, data);
    end

    // End the simulation
    $finish;
  end
endmodule
