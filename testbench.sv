`include "User_interface.sv"
`include "test.sv"
`include "interface.sv"
`include "sram_mem.sv"
module testbench;
  bit CLK;
  bit SCLK;
  bit SCLK_N = 1;
  
  
  initial forever #5 CLK = ~CLK;
  
    initial forever #10 SCLK = ~SCLK;
  
      initial forever #10 SCLK_N = ~SCLK_N;
  
  ddr_interface inf(CLK,SCLK,SCLK_N);
  test t(inf);
  
  SRAM_MEM SM(inf);
  
  initial #1000 $finish;
  
  
  DDR_CONTROLLER di(inf);
endmodule
  