module packed_3d;
  
  bit[2:0][3:0][7:0] m_data;
  
  initial begin
  
  m_data[0] = 32'hface_cafe;
  m_data[1] = 32'hface_cbfe;
  m_data[2] = 32'hfade_cafe;
  
  foreach(m_data[i])begin
    $display( "m_data[%d] = 0x%0h",i,m_data[i]);
    foreach(m_data[i][j]) 
      $display("m_data[%0d][%0d] = 0x%0b",i,j,m_data[i][j]);
  end
  end
endmodule
