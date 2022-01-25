module SPI_Slave_tx#(parameter data_len = 8)//分频系数这里指低电平持续时长
(// 0模式SPI上升沿将数据打入发送数据线
       input                       rst  ,
       input                       clk  ,
       input                      tx_en ,
       input                      start ,//一次发送触发信号
       input     [data_len-1:0]     din ,//发送数据写入
       input                        cs  ,//片选信号
       input                        sck ,//时钟信号
       output    [data_len-1:0]  tx_buff ,//发送缓冲区
       output     reg                so ,//主机输出
       output    [4:0]          state_tx,
       output     reg              qvld  //发送完成信号
    );
    
    reg        [4:0]          state0;
    reg        [4:0]          state1;
    reg        [15:0]       sck_cnt;
    reg        [data_len-1:0]        tx_buf;//发送缓冲区
     reg       [data_len-1:0]      tx_data;//发送数据
    reg        [7:0]        bit_cnt;//发送位数计数器 
    
    reg                     data_ready;
    reg                     data_tx_ready;
    
    assign tx_buff = tx_data;
    assign state_tx = state0;
    always @ (posedge clk , posedge start , posedge rst)
    begin
        if(rst)
        begin
            state0 <= 5'd0;
            data_ready <= 1'b0;
            tx_buf <= 12'd0;
        end
        else
        begin
            if((tx_en))
            begin
                case(state0)
                    5'd0:begin
                            data_ready <= 1'b0;
                            if(start)
                            begin
                                tx_buf <= din;
                                state0 <= state0 + 5'd1;
                            end
                            else
                            begin
                                tx_buf <= tx_buf;
                                state0 <= state0;
                            end
                        end
                    5'd1:begin//等待数据稳定 并且发送模块允许接收数据
                            if(start)
                            begin
                                tx_buf <= din;
                                state0 <= state0;
                            end
                            else
                             begin
                                state0 <= state0 + 5'd1;
                            end
                        end
                     5'd2:begin
                                if(data_tx_ready)
                                   state0 <= state0 ; 
                                else
                                    state0 <= state0 + 5'd1;
                            end
                     5'd3:begin
                            data_ready <= 1'b1;
                            if(data_tx_ready)
                            begin
                                data_ready <= 1'b0;
                                state0 <= 5'd0;
                            end
                            else
                                state0 <=  state0;
                            end
                     default:state0 <= 5'd0;
                endcase
            end
            else
            begin
                 state0 <= state0;
                 data_ready <= data_ready;
                 tx_buf <= tx_buf;
            end
        end
    end
    
    always @(posedge clk , posedge sck , posedge rst)
    begin
        if(rst)
        begin
             tx_data<=12'd0;
             state1 <= 5'd0;
             data_tx_ready<=1'b0;
             bit_cnt <= 8'd0;
             qvld <= 1'b0;
             so   <= 1'b0;
        end
        else
        begin
            if(tx_en & ~cs)
            begin
                case(state1)
                5'd0: begin
                            so   <= 1'b0;//空闲低电平
                            if(data_ready)//如果数据准备好
                            begin
                                tx_data       <= tx_buf;
                                data_tx_ready <= 1'b1;
                                state1        <= state1+5'd1;
                            end
                            else//数据还未准备好
                            begin
                                tx_data       <= tx_data;
                                data_tx_ready <= 1'b0;//撤销数据发送准备信号
                                state1        <= state1;
                            end
                       end
                  5'd1:begin//等待sck上升沿发送数据
                            if(bit_cnt == data_len)//成功完成12位数据发送
                                begin
                                    so   <=  1'b0;
                                    bit_cnt <= 8'd0;
                                    state1 <= 5'd0;
                                    qvld <= 1'b1;
                                end
                            else
                            begin
                                if(sck)
                                begin
                                    qvld <= 1'b0;
                                    so   <= tx_data[data_len-1];
                                    tx_data <= tx_data<<1;
                                    state1  <= state1 + 5'd1;
                                end
                                else
                                begin
                                    qvld <= 1'b0;
                                    state1  <= state1;
                                    tx_data <= tx_data;
                                    so   <= so;
                                end
                            end
                        end
                     5'd2:begin
                                data_tx_ready <= 1'b0;
                                if(~sck)
                                begin
                                        bit_cnt <= bit_cnt + 8'd1;//发送完成一个bit就计数一次
                                        state1  <= 5'd1;
                                        if(bit_cnt==data_len-1)
                                        begin
                                            qvld <= 1'b1;
                                        end
                                end
                                else
                                begin
                                        bit_cnt <= bit_cnt;
                                        state1  <= state1;
                                end
                            end
                      default:begin
                             tx_data<=12'd0;
                             state1 <= 5'd0;
                             data_tx_ready<=1'b0;
                             bit_cnt <= 8'd0;
                             qvld <= 1'b0;
                             so   <= 1'b0;      
                             end
                endcase
            end
            else
            begin
                             tx_data      <=tx_data      ;
                             state1       <=state1       ;
                             data_tx_ready<=data_tx_ready;
                             bit_cnt      <=bit_cnt      ;
                             qvld         <=qvld         ;
                             so           <=so           ;      
            end
        end
    end
endmodule