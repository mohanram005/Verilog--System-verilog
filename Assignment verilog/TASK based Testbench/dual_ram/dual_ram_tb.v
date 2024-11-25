// // Code your testbench here
// // or browse Examples


module dual_port_tb;
  
  reg clk,rst,we_a,we_b;
  reg [3:0] address_a,address_b;
  reg [7:0] data_a,data_b;
  
  wire[7:0] data_out_a,data_out_b;
  
  dual_port_ram dut(
    
    .clk(clk),
    .rst(rst),
    .addr_a(address_a),
    .addr_b(address_b),
    .data_in_a(data_a),
    .data_in_b(data_b),
    .we_a(we_a),
    .we_b(we_b),
    .data_out_a(data_out_a),
    .data_out_b(data_out_b)
  );
  
//   address_b <= addr_b;
//     data_b <= data_in_b;
  
  initial begin
    
    clk = 0;
    
    forever #5 clk = ~clk;
  end
  
  
  initial begin
    rst = 1;
    address_a = 0;
    address_b = 0;
    data_a = 0;
    data_b = 0;
     we_a = 0;
    we_b = 0;
    
    
    #10 rst = 0;
    
    //write port a 
    
    #5;
    write_a(4'd0,8'haa);
    write_a(4'd1,8'hBB);
    write_a(4'd2,8'hCC);
    
    //write port b
    
    
    
    
    #10;
    write_b(4'd3,8'hDD);
    write_b(4'd4,8'hEE);
    write_b(4'd5,8'hFF);
    
    //read port_a
    
    #10;
    read_a(4'd0);
    read_a(4'd1);
    read_a(4'd2);
    #15;
    read_b(4'd3);
    read_b(4'd4);
    read_b(4'd5);
    
    $finish;
  
        

    
    
   end
  
   
  
  task write_a(input[3:0] addr_a,input [7:0] data_in_a);
    
   begin
    @(posedge clk);
    
    we_a = 1;
    address_a <= addr_a;
    data_a <= data_in_a;
    
    @(posedge clk);
    
    we_a = 0;
   end
  endtask
  
  task write_b(input[3:0] addr_b,input [7:0] data_in_b);
    
    begin
      @(posedge clk);
      
      we_b = 1;
      
    address_b <= addr_b;
    data_b <= data_in_b;
    
    @(posedge clk);
    
    we_b = 0;
   end
    
  endtask
  
  task read_a(input[3:0] addr_a);
    
    begin
      @(posedge clk);
      
      we_a = 0;
      
      address_a <= addr_a;
      
     
      
      @(posedge clk);
      
       $display("the addr %0d  = data = %0d",addr_a,data_out_a);
    end
  endtask
  
  task read_b(input [3:0] addr_b);
    
    begin
       @(posedge clk);
      
      we_b = 0;
      
      address_b <= addr_b;
      
      
      @(posedge clk);
      
      $display("the addr %0d ,data = %0d",addr_b,data_out_b);
    end
  endtask
  initial begin
  $dumpfile("dual_port_ram.vcd");
    $dumpvars(0, dual_port_tb);
  end
endmodule
      
      
      
      
// module dual_port_tb;

//   // Declare signals
//   reg clk, rst, we_a, we_b;
//   reg [3:0] address_a, address_b;
//   reg [7:0] data_a, data_b;
//   wire [7:0] data_out_a, data_out_b;

//   // Instantiate the DUT (Device Under Test)
//   dual_port_ram dut(
//     .clk(clk),
//     .rst(rst),
//     .addr_a(address_a),
//     .addr_b(address_b),
//     .data_in_a(data_a),
//     .data_in_b(data_b),
//     .we_a(we_a),
//     .we_b(we_b),
//     .data_out_a(data_out_a),
//     .data_out_b(data_out_b)
//   );

//   // Generate clock signal
//   initial begin
//     clk = 0;
//     forever #5 clk = ~clk; // Toggle clock every 5 time units
//   end

//   // Simulation initialization and stimulus
//   initial begin
//     // Initialize signals
//     rst = 1;
//     address_a = 0;
//     address_b = 0;
//     data_a = 0;
//     data_b = 0;
//     we_a = 0;
//     we_b = 0;

//     // Release reset after some time
//     #10 rst = 0;

//     // Write to port A
//     write_a(4'd0, 8'haa);
//     write_a(4'd1, 8'hbb);
//     write_a(4'd2, 8'hcc);

//     // Write to port B
//     write_b(4'd3, 8'hdd);
//     write_b(4'd4, 8'hee);
//     write_b(4'd5, 8'hff);

//     // Read from port A
//     read_a(4'd0);
//     read_a(4'd1);
//     read_a(4'd2);

//     // Read from port B
//     read_b(4'd3);
//     read_b(4'd4);
//     read_b(4'd5);
    
//     $finish;
//   end

//   // Task to write to port A
//   task write_a(input [3:0] addr_a, input [7:0] data_in_a);
//     begin
//       @(posedge clk);
//       we_a = 1;
//       address_a <= addr_a;
//       data_a <= data_in_a;
//       @(posedge clk);
//       we_a = 0;
//     end
//   endtask

//   // Task to write to port B
//   task write_b(input [3:0] addr_b, input [7:0] data_in_b);
//     begin
//       @(posedge clk);
//       we_b = 1;
//       address_b <= addr_b;
//       data_b <= data_in_b;
//       @(posedge clk);
//       we_b = 0;
//     end
//   endtask

//   // Task to read from port A
//   task read_a(input [3:0] addr_a);
//     begin
//       @(posedge clk);
//       we_a = 0;
//       address_a <= addr_a;
//       @(posedge clk);
//       $display("The addr %0d = data = %0d", addr_a, data_out_a);
//     end
//   endtask

//   // Task to read from port B
//   task read_b(input [3:0] addr_b);
//     begin
//       @(posedge clk);
//       we_b = 0;
//       address_b <= addr_b;
//       @(posedge clk);
//       $display("The addr %0d = data = %0d", addr_b, data_out_b);
//     end
//   endtask

//   // Dump waveform data
//   initial begin
//     $dumpfile("dual_port_ram.vcd");
//     $dumpvars(0, dual_port_tb);
//   end

// endmodule

    
    
    
    
    
    
    
    
    
    
    

  
  
