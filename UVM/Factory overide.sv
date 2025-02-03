// Code your design here


//output : UVM_INFO @ 0: inside component_B

// the function of componet a is overide by component b
`include "uvm_macros.svh"
import uvm_pkg::*;

class component_A extends uvm_component;
  `uvm_component_utils(component_A)
  
  function new(string name = "component_A", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function display();
    `uvm_info(get_type_name(), $sformatf("inside component_A"), UVM_LOW);
  endfunction
endclass

class component_B extends component_A;
  `uvm_component_utils(component_B)
  
  function new(string name = "component_B", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function display();
    `uvm_info(get_type_name(), "inside component_B", UVM_LOW);
  endfunction
endclass

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  component_A comp_A;
  
  function new(string name = "my_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    uvm_factory factory = uvm_factory::get();
    super.build_phase(phase);
    
    set_type_override_by_type(component_A::get_type(), component_B::get_type());
    comp_A = component_A::type_id::create("comp_A", this);
    factory.print();
  endfunction
   
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    comp_A.display();
  endtask
endclass

