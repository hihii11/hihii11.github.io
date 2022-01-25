module SPI_Signal_bit_DC_slave(
        input                       rst  ,//复位信号
        input                       clk  ,//系统时钟
        
        input                      tx_en ,//发送使能
        input                      start ,//一次发送触发信号
        input     [7:0]              din ,//发送数据写入
        input                        cs  ,//片选信号
        input                        sck ,//时钟信号
        output    [11:0]         tx_buff ,//发送缓冲区
        output                        so ,//从机输出
        output                  sed_qvld , //从机发送完成信号
        //output    [11:0]        Han_tx_data,
        //output                   Data_Fra,
        //output    [4:0]          state_tx,
        
        
        input                       rx_en,//接收使能
        input                          si,//数据输入信号
        output     [7:0]             dout,//接收数据输出
        output     [3:0]         err_addr,//错误数据地址
        output                 error_only,//1bit错误标志位
        output                  error_mul,//2比特或以上错误标志位
        output                   rec_qvld //接收数据完成信号
    );
    
    wire              Data_Fram0;//汉明编码器数据同步帧
    wire  [11:0] tx_hanming_data;//汉明编码器数据输出
    
    wire              Data_Fram1;//汉明解码器数据同步帧
    wire  [11:0] rx_hanming_data;//汉明编码器数据输入
    //assign Data_Fra = Data_Fram0;
    //assign Han_tx_data = tx_hanming_data;
    
    
    
     HanMing_encoder HanMing_encoder0(//汉明编码器
        .    Data_in(din),//八位数据输入
        .  Data_Fram(start),//数据同步信号
        .        clk(clk),//时钟
        .         EN(tx_en),//模块使能信号
        .        rst(rst),//复位
        .       qvld(Data_Fram0),//编码重构完成信号
        .   Data_out(tx_hanming_data) //12位重构数据输出
     );

     HanMing_decoder HanMing_decoder0(//汉明解码器
       .  Data_Fram(Data_Fram1),//数据同步帧输入
       .    Data_in(rx_hanming_data),//12位汉明码输入
       .        clk(clk),//时钟输入端
       .         EN(rx_en),//使能
       .        rst(rst),//复位
       .   err_addr(err_addr),//错误地址位
       .   Data_out(dout),//解码重构后数据输出
       . error_only(error_only),//1bit错误标志位
       .  error_mul(error_mul),//2比特或以上错误标志位
       .       qvld(rec_qvld)//解码完成信号
    );

    SPI_Slave_tx#(.data_len(12)) SPI_Slave_tx0
    (
       .   rst  (rst),
       .   clk  (clk),
       .  tx_en (tx_en),
       .  start (Data_Fram0),//一次发送触发信号
       .    din (tx_hanming_data),//发送数据写入
       .    cs  (cs),//片选信号
       .    sck (sck),//时钟信号
       . tx_buff(tx_buff),//发送缓冲区
       .     so (so),//从机输出
//       .  state_tx(state_tx),
       .   qvld (sed_qvld) //发送完成信号
    );
    
     SPI_Slave_rx#(.data_len(12)) SPI_Slave_rx0
     (
       .    clk(clk),
       .    sck(sck),
       .    rst(rst),
       .  rx_en(rx_en),
       .        si(si),
       .   qvld(Data_Fram1),//接收完成信号
       .   dout(rx_hanming_data)
     );
   
endmodule