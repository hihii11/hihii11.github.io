module HanMing_encoder(//汉明编码器
        input  [7:0]          Data_in,//八位数据输入
        input               Data_Fram,//数据同步信号
        input                     clk,//时钟
        input                      EN,//模块使能信号
        input                     rst,//复位
        output reg               qvld,//编码重构完成信号
        output reg [11:0]    Data_out //12位重构数据输出
);
    
    reg [7:0] datain_buff0;
    reg [7:0] datain_buff1;
    reg [7:0] datain_buff;
    
    reg qvld1,qvld2,qvld3,qvld4;//帧同步
    
    wire c1,c2,c3,c4;//对1偶校验
    
    assign c1 = datain_buff[0]^datain_buff[2]^datain_buff[4]^datain_buff[6];
    assign c2 = datain_buff[1]^datain_buff[2]^datain_buff[5]^datain_buff[6];
    assign c3 = datain_buff[3]^datain_buff[4]^datain_buff[5]^datain_buff[6];
    assign c4 = (1'b0)^datain_buff[7];
    
    always @ (posedge clk,posedge rst)
    begin
        if(rst)
        begin
            qvld <= 1'b0;
            qvld1<= 1'b0;
            qvld2<= 1'b0;
            qvld3<= 1'b0;
            qvld4<= 1'b0;
        end
        else
        begin
            if(EN)
            begin
                qvld <=  qvld1;
                qvld1<=  qvld2;
                qvld2<=  qvld3;
                qvld3<=  qvld4;
                qvld4<= Data_Fram;
            end
            else
            begin
                qvld <=  qvld ;
                qvld1<=  qvld1;
                qvld2<=  qvld2;
                qvld3<=  qvld3;
                qvld4<=  qvld4;
            end
        end
    end
    
    always @ (posedge Data_Fram,posedge rst)
    begin
        if(rst)
        begin
            datain_buff0 <= 8'd0;
        end
        else
        begin
            if(EN)
                datain_buff0 <= Data_in;//数据打入缓冲区
            else
                datain_buff0 <= datain_buff0;
        end
    end
    
    always @ (posedge clk,posedge rst)//跨时钟域处理
    begin
        if(rst)
        begin
           datain_buff1<=8'd0;
           datain_buff <=8'd0; 
        end
        else
        begin
            if(EN)
            begin
                 datain_buff1<=datain_buff0;
                 datain_buff <=datain_buff1; 
            end
            else
            begin
                  datain_buff1<=datain_buff1;
                  datain_buff <=datain_buff; 
            end
        end    
    end
    
    always @(posedge clk , posedge rst)
    begin
        if(rst)
        begin
             Data_out <= 12'd0;
        end    
        else
        begin
            if(EN)
            begin
                //数据重构
                Data_out <= {datain_buff[7],datain_buff[6],datain_buff[5],datain_buff[4],
                                c4,datain_buff[3],datain_buff[2],datain_buff[1],
                                c3,datain_buff[0],c2,c1
                            };
            end
            else
                Data_out <= Data_out;
        end
    end
endmodule
