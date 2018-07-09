interface ddr_interface(input CLK,SCLK,SCLK_N);
  bit RESET_N = 1;
  logic [31:0] ADDR;
  bit [2:0] CMD = 3'b000;
  logic CMDACK = 0;
  logic [31:0] DATAIN;
  logic [7:0] DATAOUT;
  logic [3:0] DM;
  logic [32:0] SA;
  logic [1:0] BA;
  logic [1:0] CS_N;
  logic CKE = 0;
  logic RAS_N = 1;
  logic CAS_N = 1;
  logic WE_N = 1;
  wire [15:0] DQ;
  logic [3:0] DQM;
  logic [15:0] DQS;
  bit R_DATAEND = 0;
  bit W_DATAEND = 0;  
  modport UI_MC(input CLK,CMD,ADDR,DATAIN,DM,RESET_N,R_DATAEND,W_DATAEND,
                output CMDACK,DATAOUT,SA,BA,CS_N,CKE,RAS_N,CAS_N,WE_N,DQM,
                inout DQ, DQS);
  
  modport TEST(input CLK,DATAOUT,CMDACK,
               output RESET_N,DATAIN,CMD,DM,ADDR,W_DATAEND,R_DATAEND);
  
  modport SRAM(input SCLK,SCLK_N,SA,BA,CS_N,CKE,RAS_N,CAS_N,WE_N,
               output R_DATAEND,W_DATAEND,
               inout DQ,DQM);
  
  modport MONITOR(input CKE,CLK,SCLK,SCLK_N,CMD,CMDACK,RAS_N,CAS_N,WE_N,DQ,DATAIN,DATAOUT,DQM,SA,BA,CS_N,ADDR);
  
      
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endinterface