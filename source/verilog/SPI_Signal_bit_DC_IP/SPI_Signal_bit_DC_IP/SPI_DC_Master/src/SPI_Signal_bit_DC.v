module SPI_Signal_bit_DC#(parameter CLK_DIV = 2)(
          input                 sed_rst  ,  //发送机复位信号             
          input                     clk  ,  //系统时钟          
          input                    tx_en ,  //发送使能          
          input                    start ,  //一次发送触发信号     
          input     [7:0]            din ,  //发送数据写入       
          output                 sck_out ,  //发送机同步时钟      
          output                      cs ,  //片选信号         
          output    [11:0]        tx_buff,//发送缓冲区       
          output                    mosi ,  //主机输出   
          output                 sed_qvld,  //发送完成信号  
          
          input                     sck_in,  //接收机机同步时钟
          input                    rec_rst,  //接收机复位信号
          input                      rx_en,  //接收使能
          input                       miso,  //接收机信号输入
          output                  rec_qvld,  //接收完成信号
          output      [11:0]          test,  //测试信号
          output      [7:0]           dout,  //接收数据输出  
          
          output       [3:0]      err_addr, 
          output                error_mul,//2比特错误标志位 
          output                error_only//1比特错误标志位 
    );
    
    wire [11:0] tx_hanming_data;
    wire             Data_Fram0;//发送同步后数据帧
   
    wire [11:0] rx_hanming_data;
    wire  SPI_rec_qvld;
    
    HanMing_encoder HanMing_encoder0(//汉明编码器
       .   Data_in(  din),//八位数据输入
       . Data_Fram(start),//数据同步信号
       .       clk(  clk),//时钟
       .        EN(tx_en),//模块使能信号
       .       rst(sed_rst),//复位
       .      qvld(Data_Fram0),//编码重构完成信号
       .  Data_out(tx_hanming_data) //12位重构数据输出
);
    
    
       HanMing_decoder  HanMing_decoder0(//汉明解码器                           
        .  Data_Fram(SPI_rec_qvld),//数据同步帧输入                
        .    Data_in(rx_hanming_data),//12位汉明码输入               
        .        clk(clk),//时钟输入端                  
        .         EN(rx_en),//使能                     
        .        rst(rec_rst),//复位                     
        .   err_addr(err_addr),//错误地址              
        .   Data_out(dout),//解码重构后数据输出              
        .   error_only(error_only),//1bit错误标志位  
        .   error_mul(error_mul),//2bit错误标志位                   
        .       qvld(rec_qvld)//解码完成信号                  
    );                                                         
    
    
    SPI_Master_tx#(.div0(CLK_DIV),.data_len(12)) tx_SPI_DC(//发送机
                  .   rst  (sed_rst),
                  .   clk  (clk),
                  .  tx_en (tx_en),
                  .  start (Data_Fram0),//一次发送触发信号
                  .    din (tx_hanming_data),//发送数据写入
                  .    sck (sck_out),//时钟信号
                  .     cs (cs),//片选信号
                  . tx_buff(tx_buff) ,//发送缓冲区
                  .    mosi(mosi) ,//主机输出
                  .    qvld(sed_qvld)  //发送完成信号
    );
    
     SPI_Master_rx#(.data_len(12)) rx_SPI_DC(//接收机
                .   clk(clk),
                .   sck(sck_in),
                .   rst(rec_rst),
                . rx_en(rx_en),
                .  miso(miso),
                .  qvld(SPI_rec_qvld),//接收完成信号
                .  test(test),
                .  dout(rx_hanming_data)
     );
endmodule