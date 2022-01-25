//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sun Jan 23 23:16:43 2022
//Host        : DESKTOP-P7K6OD1 running 64-bit major release  (build 9200)
//Command     : generate_target SPI_DC_slave.bd
//Design      : SPI_DC_slave
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SPI_DC_slave,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SPI_DC_slave,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "SPI_DC_slave.hwdef" *) 
module SPI_DC_slave
   (sys_clock);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN SPI_DC_slave_sys_clock, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000" *) input sys_clock;

  wire clk_wiz_0_clk_out1;
  wire sys_clock_1;

  assign sys_clock_1 = sys_clock;
  SPI_DC_slave_SPI_Signal_bit_DC_sl_0_1 SPI_Signal_bit_DC_sl_0
       (.clk(clk_wiz_0_clk_out1),
        .cs(1'b0),
        .din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rst(1'b0),
        .rx_en(1'b0),
        .sck(1'b0),
        .si(1'b0),
        .start(1'b0),
        .tx_en(1'b0));
  SPI_DC_slave_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clock_1),
        .clk_out1(clk_wiz_0_clk_out1));
endmodule
