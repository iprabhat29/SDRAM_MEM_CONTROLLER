module test(ddr_interface.TEST inf);
  bit read_done;
  bit write_done;
  
  initial begin
    @(posedge inf.CLK);
    inf.RESET_N = 0;
    @(posedge inf.CLK);
    inf.CMD = 3'b001;
    inf.ADDR = 32'hFFFF0000;
    @(inf.CMDACK == 1);
    @(posedge inf.CLK);
    inf.CMD = 3'b000;
    @(inf.DATAOUT)
    $display("DATAOUT1 = %b",inf.DATAOUT);
    @(inf.DATAOUT)
    $display("DATAOUT2 = %b",inf.DATAOUT);
    @(inf.DATAOUT)
    $display("DATAOUT3 = %b",inf.DATAOUT);
    @(inf.DATAOUT)
    $display("DATAOUT4 = %b",inf.DATAOUT);
    @(posedge inf.CLK);
    read_done = 1;
  end  
  
       
  initial begin
    wait (read_done == 1);
    if (read_done == 1) begin
      @(posedge inf.CLK);
      inf.RESET_N = 1;      
      @(posedge inf.CLK);
      inf.RESET_N = 0;      
      @(posedge inf.CLK);
      inf.CMD = 3'b010;
      inf.ADDR = 32'hFFFF0001;
      inf.DATAIN = 4'h1;
      @(inf.CMDACK == 1);
      @(posedge inf.CLK);
      inf.CMD = 3'b000;
      @(posedge inf.CLK);
      inf.DATAIN[3:0] = 4'h2;
      @(posedge inf.CLK);
      inf.DATAIN[7:4] = 4'h3;
      @(posedge inf.CLK);
      inf.DATAIN[11:8] = 4'h4;
      @(posedge inf.CLK);
      inf.DATAIN[15:12] = 4'h5;
      @(posedge inf.CLK);
      inf.DATAIN[19:16] = 4'h6;
      @(posedge inf.CLK);
      inf.DATAIN[23:20] = 4'h7;
      @(posedge inf.CLK);
      inf.DATAIN[27:24] = 4'h8;
      @(posedge inf.CLK);
      inf.DATAIN[31:28] = 4'h9;
      inf.W_DATAEND = 1;
      write_done = 1;
      end
  end
 
  initial begin
    wait(write_done == 1);
    if (write_done == 1) begin
      @(posedge inf.CLK);
      inf.RESET_N = 1;      
      @(posedge inf.CLK);
      inf.RESET_N = 0;      
      @(posedge inf.CLK);
      inf.CMD = 3'b011;
      @(inf.CMDACK == 1);
      @(posedge inf.CLK);
      inf.CMD = 3'b000;
    end
  end 
  
  
endmodule