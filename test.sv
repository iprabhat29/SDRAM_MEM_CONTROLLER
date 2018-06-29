module test(ddr_interface.TEST inf);
  initial begin
    @(posedge inf.CLK);
    inf.RESET_N = 0;
    @(posedge inf.CLK);
    inf.CMD = 3'b001;
    inf.ADDR = 32'hFFFF0000;
    @(inf.CMDACK == 1);
    @(posedge inf.CLK);
    inf.CMD = 3'b000;
  end
  always @(inf.DATAOUT)
    $display("DATAOUT = %b",inf.DATAOUT);
endmodule