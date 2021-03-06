module SRAM_MEM(ddr_interface.SRAM inf);
  logic cond;
  logic [3:0] DQ_temp;
  assign inf.DQ = (cond == 1) ? DQ_temp : 'bz;
  always @(*) begin
    case ({inf.RAS_N,inf.CAS_N,inf.WE_N})
      3'b011: begin
        $display("ACT");
        $display("ADDR  %b",inf.SA);
      end
      3'b101: begin
        $display("READ");
        @(posedge inf.SCLK);
        //cond = 1;
        @(posedge inf.SCLK);
        cond = 1;
        DQ_temp = 4'd3;
        @(posedge inf.SCLK);
        DQ_temp = 4'd4;
        @(posedge inf.SCLK);
        DQ_temp = 4'd5;
        @(posedge inf.SCLK);
        DQ_temp = 4'd6;
        @(posedge inf.SCLK);
        DQ_temp = 4'd7;
        @(posedge inf.SCLK);
        DQ_temp = 4'd8;  
        @(posedge inf.SCLK);
        DQ_temp = 4'd9;
        @(posedge inf.SCLK);
        DQ_temp = 4'd10;  
        @(posedge inf.SCLK);
        inf.R_DATAEND = 1;
        cond = 0;
      end
      3'b100: begin
        $display("FULL ADDR . %b",inf.SA);
        $monitor("DQ   ",inf.DQ);
      end
      3'b001: begin
		        
      end
    endcase
  end
  
  
endmodule