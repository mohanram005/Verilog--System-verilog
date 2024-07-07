module oddrandom(output reg [3:0] odd_num [0:4]);
  integer i;
  integer ran_num;

  initial begin
    for(i = 0 ; i < 5 ; i = i + 1) begin
      ran_num = $urandom % 10 + 1;
  
      if (ran_num % 2 == 0) begin
        ran_num = ran_num + 1;
        if(ran_num > 10) begin
          ran_num = ran_num - 2;
        end
      end
      
      odd_num[i] = ran_num;
    end
    for (integer i = 0; i < 5; i = i + 1) begin
      $display("%0d", odd_num[i]);
  end
  end
  
endmodule
