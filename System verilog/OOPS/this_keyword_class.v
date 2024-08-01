// Code your design here


//this keyword: Used to refer to the current instance of the class. It is especially useful 
when local variable names or method parameter names conflict with class property names.
class packet;
  bit [31:0] addr;
  bit [31:0] data;
  bit write;
  string pkt_type;
  
  function new(bit [31:0] addr, bit [31:0] data, bit write, string pkt_type);
    // Use 'this' to refer to the class properties
    this.addr = addr;
    this.data = data;
    this.write = write;
    this.pkt_type = pkt_type;
  endfunction
  
  function void display();
    $display(" addr = %0d", addr);
    $display(" data = %0d", data);
    $display(" write = %0d", write);
    $display(" pkt_type = %s", pkt_type);
  endfunction
endclass
  
module sv;
  initial begin
    
    packet pkt1 = new(32'h11, 32'h1, 1, "bad");
    packet pkt2 = new(32'h10, 32'hb, 1, "good_pkt");
   
    
    pkt1.display();
    
    pkt2.display();
  end
endmodule
