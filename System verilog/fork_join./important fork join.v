module jk;
  initial begin
    for (int j = 0; j < 6; j++) begin
     // #1;
      fork
      
        $display("time = %0t the fork_join_none %0d", $time, j);
      join_none
      $display("out of join");
    end
  end
endmodule

// out of join
// out of join
// out of join
// out of join
// out of join
// out of join
// time = 0 the fork_join_none 6
// time = 0 the fork_join_none 6
// time = 0 the fork_join_none 6
// time = 0 the fork_join_none 6
// time = 0 the fork_join_none 6
// time = 0 the fork_join_none 6
