`timescale 1ns / 1ps

module SPI_Signal_bit_DC_tb(

    );
         reg                     rst  ;  //复位信号             
         reg                     clk  ;  //系统时钟          
         reg                    tx_en ;  //发送使能          
         reg                    start ;  //一次发送触发信号     
         reg     [7:0]            din ;  //发送数据写入        
         wire                      cs ;  //片选信号         
         wire    [11:0]        tx_buff;//发送缓冲区       
         wire                    mosi ;  //主机输出   
         wire                 sed_qvld;  //发送完成信号  
          
          wire                      sck;  //数据同步时钟
          reg                      rx_en;  //接收使能
          wire                  rec_qvld;  //接收完成信号
          wire      [11:0]          test;  //测试信号
          wire      [7:0]          dout;  //接收数据输出     
          wire       [3:0]      err_addr; 
          wire                error_only;//1比特错误标志位 
          wire                error_mul ;//2比特错误标志位 
          
          integer i;
          
    initial begin//产生系统时钟
        clk = 0;
        forever
            #1 clk = ~clk;
    end
    
    initial begin
        rst   =     0;
        start =     0;
        tx_en =     0;
        rx_en =     0;
        din   = 12'd0;
        
        rst = 1;
     #1 rst = 0;//系统复位
     i=0;
        {tx_en,rx_en}=2'b11;//使能收发传输器
        
        din = 8'h000;
     #2 start = 1;
     #2 start = 0;  
        
        while(i<=8'hff)
        begin
             #100 
              din =din+8'h01;
             #2 start = 1;
             #2 start = 0;  
        end
    end   
    
    SPI_Signal_bit_DC#(.CLK_DIV(2)) SPI_Signal_bit_DC0(                                         
          .sed_rst  (rst),  //发送机复位信号                                     
          .   clk   (clk),  //系统时钟                                        
          .  tx_en  (tx_en),  //发送使能                                        
          .  start  (start),  //一次发送触发信号                                    
          .    din  (din),  //发送数据写入                                      
          .sck_out  (sck),  //发送机同步时钟                                     
          .     cs  (cs),  //片选信号                                        
          . tx_buff (tx_buff),//发送缓冲区                                      
          .   mosi  (mosi),  //主机输出                                        
          .sed_qvld (sed_qvld),  //发送完成信号                                      
                                                                   
          .   sck_in (sck),  //接收机机同步时钟                                   
          .  rec_rst (rst),  //接收机复位信号                                    
          .    rx_en (rx_en),  //接收使能                                       
          .     miso (mosi),  //接收机信号输入                                    
          . rec_qvld (rec_qvld),  //接收完成信号                                     
          .     test (test),  //测试信号                                       
          .     dout (dout),   //接收数据输出     
          
          .   err_addr (  err_addr),
          . error_only (error_only),
          .  error_mul (error_mul)                                
    );
endmodule
