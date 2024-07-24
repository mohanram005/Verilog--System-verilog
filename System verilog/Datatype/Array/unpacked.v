module unpack_2d;
  
  byte stack[2][3];// row and coloum the output is based on the condition
  
  
  initial begin
    
    
    foreach(stack[i]) begin // 0
      foreach(stack[i][j])begin//0 0 next 0 2
        stack[i][j] = $random;
    
        $display("stack[%0d][%0d] = %0b",i,j,stack[i][j]);
      end
    end
  end
endmodule
