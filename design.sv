// Code your design here
/*        @(posedge inf.SCLK);
        cmd1 = 1;
        DQ_temp = 4'd7;
        @(posedge inf.SCLK);
        //cmd1 = 0;
        //cmd2 = 1;
        DQ_temp = 4'd8;
        @(posedge inf.SCLK);
        //cmd2 = 0;
        //cmd3 = 1;
        DQ_temp = 4'd9;
        @(posedge inf.SCLK);
        //cmd3 = 0;
        //cmd4 = 1;
        DQ_temp = 4'd10;
        @(posedge inf.SCLK);
        //cmd4 = 0;
        //cmd1 = 1;
        DQ_temp = 4'd11;
        @(posedge inf.SCLK);
        //cmd1 = 0;
        //cmd2 = 1;
        DQ_temp = 4'd12;
        @(posedge inf.SCLK);
        //cmd2 = 0;
        //cmd3 = 1;
        DQ_temp = 4'd13;
        @(posedge inf.SCLK);
        //cmd3 = 0;
        //cmd4 = 1;
        DQ_temp  = 4'd14;
        @(posedge inf.SCLK);
        cmd1 = 0;
        inf.DATAEND = 1;
        @(posedge inf.SCLK);
        inf.DATAEND = 0;
        
        
        
        
  initial begin
    @(inf.DATAIN);
    temp [3:0] = inf.DATAIN;
    @(inf.DATAIN);
    temp [7:4] = inf.DATAIN;
    @(inf.DATAIN);
    temp [11:8] = inf.DATAIN;
    @(inf.DATAIN);
    temp [15:12] = inf.DATAIN;
    @(inf.DATAIN);
    temp [19:16] = inf.DATAIN;
    @(inf.DATAIN);
    temp [23:20] = inf.DATAIN;
    @(inf.DATAIN);
    temp [27:24] = inf.DATAIN;
    @(inf.DATAIN);
    temp [31:28] = inf.DATAIN;
  end*/