//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sun Jan 23 23:16:43 2022
//Host        : DESKTOP-P7K6OD1 running 64-bit major release  (build 9200)
//Command     : generate_target SPI_DC_slave_wrapper.bd
//Design      : SPI_DC_slave_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SPI_DC_slave_wrapper
   (sys_clock);
  input sys_clock;

  wire sys_clock;

  SPI_DC_slave SPI_DC_slave_i
       (.sys_clock(sys_clock));
endmodule
