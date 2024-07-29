module static_function_example;
  function int counter;
    static int count;
    count = count + 1;
    return count;
  endfunction
  initial begin
    $display("First call: %0d", counter()); // Outputs: First call: 1
    $display("Second call: %0d", counter()); // Outputs: Second call: 2
    $display("Third call: %0d", counter()); // Outputs: Third call: 3
  end
endmodule
