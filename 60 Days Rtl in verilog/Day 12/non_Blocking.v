module nonblocking;
  reg [3:0] data = 4'h4;
  real r_value;
  integer i_value;
  time T;
  
  initial begin
    $monitor("At time T = %0t: data = %0d, r_value = %0f, i_value = %0h", T, data, r_value, i_value);
    r_value <= 3.14;
    i_value <= 4;
    #2 data <= 4'h5;//  after 2 unit cycle data =  5 
    data <= #3 'd7; //after 3 cycle 7 will be excuted
    i_value <= 10;
    i_value <= 6;// i_value is updataed to 6 because it runs in same simulation time 
    #4 $finish;
  end
  
  always #1 T = $time;
endmodule

ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: At time T = 0: data = 4, r_value = 3.140000, i_value = 4
# KERNEL: At time T = 1: data = 4, r_value = 3.140000, i_value = 4
# KERNEL: At time T = 2: data = 5, r_value = 3.140000, i_value = 6
# KERNEL: At time T = 3: data = 5, r_value = 3.140000, i_value = 6
# KERNEL: At time T = 4: data = 5, r_value = 3.140000, i_value = 6
# KERNEL: At time T = 5: data = 7, r_value = 3.140000, i_value = 6
