module SPI_Master_tx#(parameter div0 = 2,parameter data_len = 8)//分频系数这里指低电平持续时长
(// 0模式SPI上升沿将数据打入发送数据线
       input                       rst  ,
       input                       clk  ,
       input                      tx_en ,
       input                      start ,//一次发送触发信号
       input     [data_len-1:0]     din ,//发送数据写入
       output     reg               sck ,//时钟信号
       output     reg                cs ,//片选信号
       output    [data_len-1:0]  tx_buff ,//发送缓冲区
       output     reg              mosi ,//主机输出
       output     reg              qvld  //发送完成信号
    );
    
    reg        [4:0]          state;
    reg        [15:0]       sck_cnt;
    reg        [data_len-1:0]        tx_buf;//发送缓冲区
    reg        [7:0]        bit_cnt;//发送位数计数器 
    
    assign tx_buff = tx_buf;
    
    always @ (posedge clk , posedge start , posedge rst)
    begin
        if(rst)
        begin
            tx_buf <=  12'd0;
            state  <=  5'd0;
            sck_cnt<= 16'd0;
            cs     <=  1'b1;
            qvld   <=  1'b0;
            sck    <=  1'b0;//因为是SPI0模式，所以空闲状态为低电平
            bit_cnt<=  8'd0;
        end
        else
        begin
            if(tx_en)
            begin
                case(state)
                    5'd0:begin//等待发送开始信号,将数据打入发送缓冲器
                            if(start)
                            begin
                                tx_buf <= din;
                                state <= state + 5'd1;
                                cs    <= 1'b1;
                                sck   <= 1'b0;//因为是SPI0模式，所以空闲状态为低电平
                                bit_cnt<= 8'd0;
                            end
                            else
                            begin
                                tx_buf <= 12'd0;
                                state  <= state;
                                cs     <= 1'b1;
                                sck   <= 1'b0;//因为是SPI0模式，所以空闲状态为低电平
                                bit_cnt<= 8'd0;
                            end
                         end
                    5'd1:begin//等待数据稳定
                            if(!start)
                            begin
                                 state  <= state + 5'd1;
                                 cs    <= 1'b0;//打开片选
                                 qvld   <= 1'b0;//复位发送完成信号
                            end
                            else
                            begin
                                tx_buf <= din;
                                state <= state;
                                cs    <= 1'b1;//打开片选
                                sck   <= 1'b0;//因为是SPI0模式，所以空闲状态为低电平
                            end
                          end
                    5'd2:begin//开始发送
                                if(bit_cnt == data_len)//成功完成12位数据发送
                                begin
                                    bit_cnt <= 8'd0;
                                    state <= 5'd0;
                                    cs <= 1'b1;
                                    qvld <= 1'b1;
                                end
                                else
                                begin
                                    if(sck_cnt != div0 - 1)
                                    begin
                                        sck_cnt <= sck_cnt + 16'd1;
                                    end
                                    else
                                    begin
                                        sck_cnt <= 16'd0;
                                        sck   <= 1'b1;//拉高时钟线
                                        mosi  <= tx_buf[data_len-1];
                                        tx_buf <= tx_buf<<1;
                                        state  <= state + 5'd1;
                                    end
                               end
                         end
                    5'd3:begin
                                if(sck_cnt != div0 - 1)
                                begin
                                    sck_cnt <= sck_cnt + 16'd1;
                                end
                                else
                                begin
                                    sck_cnt <= 16'd0;
                                    sck   <= 1'b0;//拉低时钟线
                                    bit_cnt <= bit_cnt + 8'd1;//发送完成一个bit就计数一次
                                    state  <= 5'd2;
                                end
                         end
                         default:begin
                             tx_buf <=  12'd0;
                             state  <=  5'd0;
                             sck_cnt<= 16'd0;
                             cs     <=  1'b1;
                             qvld   <=  1'b0;
                             sck    <=  1'b0;//因为是SPI0模式，所以空闲状态为低电平
                             bit_cnt<=  8'd0;
                         end
                    endcase
            end
            else
            begin
                tx_buf <=  tx_buf ;
                state  <=  state  ;
                sck_cnt<=  sck_cnt;
                cs     <=  cs     ;
                qvld   <=     qvld;
                sck    <=      sck;//因为是SPI 0模式，所以空闲状态为低电平
                bit_cnt <= bit_cnt;
            end
        end
    end 
endmodule