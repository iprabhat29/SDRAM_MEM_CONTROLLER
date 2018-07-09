module DDR_CONTROLLER(ddr_interface.UI_MC inf);
  logic cond;
  logic cond1;
  logic [31:0] a;
  logic [7:0] b;
  logic [31:0] temp;
  logic [3:0] c;
  
  assign inf.DQ = (cond == 1) ? 'bz : c;
  
  always @(*) begin
    if (inf.RESET_N) begin
      $display("RESET");
      inf.SA = 32'bx;
    end
    else begin
      case (inf.CMD)
        3'b000: begin
          inf.RAS_N = 1;
          inf.CAS_N = 1;
          inf.WE_N = 1;
        end        
        3'b001: begin
          @(posedge inf.CLK)
          inf.CMDACK = 1;
          inf.RAS_N = 0;
          inf.CAS_N = 1;
          inf.WE_N = 1;
          inf.SA[11:0] = inf.ADDR[11:0];
          @(posedge inf.CLK);
          inf.CMDACK = 0;
          inf.RAS_N = 1;
          repeat(3) @(posedge inf.CLK);
          inf.RAS_N = 1;
          inf.CAS_N = 0;
          inf.WE_N = 1;
          inf.SA = inf.ADDR;
          cond = 1;
          @(posedge inf.CLK);
          inf.CAS_N = 1;
          @(inf.DQ);
          a[3:0] = inf.DQ;
          $display("DQ1",a[3:0]);
          @(inf.DQ);
          a[7:4] = inf.DQ;
          $display("DQ2",a[7:4]);
          @(inf.DQ);
          a[11:8] = inf.DQ;
          $display("DQ3",a[11:8]);
          @(inf.DQ);
          a[15:12] = inf.DQ;
          $display("DQ4",a[15:12]);
          @(inf.DQ);
          a[19:16] = inf.DQ;
          $display("DQ5",a[19:16]);
          @(inf.DQ);
          a[23:20] = inf.DQ;
          $display("DQ6",a[23:20]);
          @(inf.DQ);
          a[27:24] = inf.DQ;
          $display("DQ7",a[27:24]);
          @(inf.DQ);
          a[31:28] = inf.DQ;
          $display("DQ8",a[31:28]);
          @(inf.R_DATAEND == 1);
          cond = 1'bx;
          @(posedge inf.CLK);
          inf.DATAOUT = a[7:0];
          @(posedge inf.CLK);
          inf.DATAOUT = a[15:8];
          @(posedge inf.CLK);
          inf.DATAOUT = a[23:16];
          @(posedge inf.CLK);
          inf.DATAOUT = a[31:24];
          @(posedge inf.CLK);
		  inf.DATAOUT = inf.DQ;
        end
        3'b010: begin
          $display("WRITEA");
          @(posedge inf.CLK)
          inf.CMDACK = 1;
          inf.RAS_N = 0;
          inf.CAS_N = 1;
          inf.WE_N = 1;
          inf.SA[11:0] = inf.ADDR[11:0];
          //cond1 = 1;
          @(posedge inf.CLK);
          //cond1 = 1'bx;
          inf.CMDACK = 0;
          inf.RAS_N = 1;
          repeat(3) @(posedge inf.CLK);
          inf.RAS_N = 1;
          inf.CAS_N = 0;
          inf.WE_N = 0;
          inf.SA = inf.ADDR;
          //cond = 0;
          //$display("Here-->",inf.DATAIN);
          @(posedge inf.CLK);
          inf.CAS_N = 1;
          inf.WE_N = 1;
          @(posedge inf.CLK);
          cond = 0;
          c = inf.DATAIN[3:0];
          @(posedge inf.CLK);
          c = inf.DATAIN[7:4];
          @(posedge inf.CLK);
          c = inf.DATAIN[11:8];
          @(posedge inf.CLK);
          c = inf.DATAIN[15:12];
          @(posedge inf.CLK);
          c = inf.DATAIN[19:16];
          @(posedge inf.CLK);
          c = inf.DATAIN[23:20];
          @(posedge inf.CLK);
          c = inf.DATAIN[27:24];
          @(posedge inf.CLK);
          c = inf.DATAIN[31:28];
          @(posedge inf.CLK);
          c = 1'bx;
        end
        3'b011: begin
          $display("REFRESH");
          @(posedge inf.CLK)
          inf.CMDACK = 1;
          inf.RAS_N = 0;
          inf.CAS_N = 0;
          inf.WE_N = 1;
          @(posedge inf.CLK);
          inf.CMDACK = 0;
          inf.RAS_N = 1;
          inf.CAS_N = 1;
        end
        3'b100: begin
          //PRECHARGE
        end
        3'b101: begin
          //LOAD_MODE
        end
        3'b110: begin
          //LOAD_REG1          
        end
        3'b111: begin
          //LOAD_REG2
        end
      endcase
    end
  end
endmodule