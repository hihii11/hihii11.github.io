`timescale 1ns / 1ps
module SPI_DC_Slave_tb(

    );
    reg                       rst  ;            
    reg                       clk  ;            
    reg                      tx_en ;            
    reg                      start ;//一次发送触发信号   
    reg     [7:0]              din ;//发送数据写入     
    reg                        cs  ;//片选信号       
    reg                        sck ;//时钟信号       
    wire    [11:0]          tx_buff;//发送缓冲区 
    wire    [11:0]          Han_tx_data;    
    wire                         so;//主机输出       
    wire                   sed_qvld;//发送完成信号 
    wire                  Data_Fra;  
    wire     [4:0]          state_tx;  
    
    
    
        reg                         rx_en;//接收使能
        wire                           si;//数据输入信号
        wire     [7:0]             dout;//接收数据输出
        wire     [3:0]         err_addr;//错误数据地址
        wire                 error_only;//1bit错误标志位
        wire                  error_mul;//2比特或以上错误标志位
        wire                   rec_qvld; //接收数据完成信号
    assign si = so;
    
    integer i ;
    
    
    initial begin
        clk = 0;
        forever
         #1 clk=~clk;
    end
    
    initial begin
         tx_en = 1'b0;
         rst   = 1'b0;
         start = 1'b0;
         din   =12'd0;
         cs    = 1'b1;
         sck   = 1'b0;
      #1 rst   = 1'b1;
      #1 rst   = 1'b0;
         tx_en  = 1'b1;   //使能发送
         rx_en  = 1'b1;
         din    =  8'h01;
      #4 start  = 1'b1;
      #4 start  = 1'b0;
      #100 i = 0;
          cs = 1'b0;
          while(i<12)
          begin
             #4 sck = 1'b0;
             #4 sck = 1'b1;
                i = i+1;
          end
          #4sck = 1'b0;
          #2cs = 1'b1;
     #100     
         din    =  8'h13;
      #4 start  = 1'b1;
      #4 start  = 1'b0;
      #10 i = 0;
          cs = 1'b0;
          while(i<12)
          begin
             #4 sck = 1'b0;
             #4 sck = 1'b1;
                i = i+1;
          end
          #4sck = 1'b0;
          #2cs = 1'b1;
    end
    SPI_Signal_bit_DC_slave SPI_Signal_bit_DC_slave0(                                               
        .       rst  (     rst ),//复位信号                              
        .       clk  (     clk ),//系统时钟                                          
        .      tx_en (    tx_en),//发送使能                              
        .      start (    start),//一次发送触发信号                          
        .        din (      din),//发送数据写入                            
        .        cs  (      cs ),//片选信号                              
        .        sck (      sck),//时钟信号                              
        .    tx_buff (  tx_buff),//发送缓冲区                             
        .         so (       so),//从机输出                 
        . sed_qvld ( sed_qvld), //从机发送完成信号 
        
       .      rx_en(rx_en),//接收使能
       .         si(si),//数据输入信号
       .       dout(dout),//接收数据输出
       .   err_addr(err_addr),//错误数据地址
       . error_only(error_only),//1bit错误标志位
       .  error_mul(error_mul),//2比特或以上错误标志位
       .   rec_qvld(rec_qvld) //接收数据完成信号                         
    );                                                                        
//    SPI_Slave_tx#(.data_len(12)) SPI_Slave_tx0//分频系数这里指低电平持续时长
//(// 0模式SPI上升沿将数据打入发送数据线
//      .   rst  (  rst  ),
//      .   clk  (  clk  ),
//      .  tx_en ( tx_en ),
//      .  start ( start ),//一次发送触发信号
//      .    din (   din ),//发送数据写入
//      .    cs  (   cs  ),//片选信号
//      .    sck (   sck ),//时钟信号
//      . tx_buff(tx_buff) ,//发送缓冲区
//      .     so (    so ),//主机输出
//      .   qvld (  qvld ) //发送完成信号
//    );
endmodule
