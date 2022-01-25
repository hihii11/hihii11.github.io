module   HanMing_decoder(//汉明解码器
    input               Data_Fram,//数据同步帧输入
    input     [11:0]      Data_in,//12位汉明码输入
    input                     clk,//时钟输入端
    input                      EN,//使能
    input                     rst,//复位
    output     [3:0]     err_addr,//错误地址位
    output  reg[7:0]     Data_out,//解码重构后数据输出
    output  reg        error_only,//1bit错误标志位
    output  reg         error_mul,//2比特或以上错误标志位
    output  reg              qvld//解码完成信号
);
   
    reg [11:0] Data_buff;
    
    reg qvld1,qvld2;
     
    wire c1;//校验位
    wire c2;
    wire c3;
    wire c4;
    
    wire p1;//校验结果
    wire p2;
    wire p3;
    wire p4;
    
    assign c1 = Data_buff[0];
    assign c2 = Data_buff[1];
    assign c3 = Data_buff[3];
    assign c4 = Data_buff[7];
    
    assign p1 = c1^Data_buff[2]^Data_buff[5]^Data_buff[8]^Data_buff[10];
    assign p2 = c2^Data_buff[4]^Data_buff[5]^Data_buff[9]^Data_buff[10];
    assign p3 = c3^Data_buff[6]^Data_buff[8]^Data_buff[9]^Data_buff[10];
    assign p4 = c4^Data_buff[11];
    
    assign err_addr = {p4,p3,p2,p1};//错误地址
    
     always @ (posedge clk,posedge rst)
    begin
        if(rst)
        begin
            qvld <= 1'b0;
            qvld1<= 1'b0;
            qvld2<= 1'b0;
        end
        else
        begin
            if(EN)
            begin
                qvld <=  qvld1;
                qvld1<=  qvld2;
                qvld2<= Data_Fram;
            end
            else
            begin
                qvld <=  qvld ;
                qvld1<=  qvld1;
                qvld2<=  qvld2;
            end
        end
    end
    
    always @(posedge Data_Fram,posedge rst)
    begin
        if(rst)
             Data_buff <= 12'd0;
        else
        begin
            if(EN)
                Data_buff <= Data_in;
            else
                Data_buff <= Data_buff;
        end
    end
    
    
    always @(posedge clk,posedge rst)
    begin
        if(rst)
        begin
            error_only <= 1'b0;
            error_mul <= 1'b0;
            Data_out <= 8'd0;
            qvld    <= 1'b0;
        end
        else
        begin
            if(EN)
            begin
                case(err_addr)
                    4'b0000:begin 
                                error_only<=1'b0;
                                error_mul <= 1'b0;
                                Data_out <={Data_buff[11],Data_buff[10],Data_buff[9],Data_buff[8],
                                            Data_buff[6],Data_buff[5],Data_buff[4],Data_buff[2]};
                            end
                    4'b0001:begin 
                                error_only<= 1'b1;
                                error_mul <= 1'b0;
                                Data_out <={Data_buff[11],Data_buff[10],Data_buff[9],Data_buff[8],
                                            Data_buff[6],Data_buff[5],Data_buff[4],~Data_buff[2]};
                            end
                    4'b0010:begin 
                                error_only<= 1'b1;
                                error_mul <= 1'b0;
                                Data_out <={Data_buff[11],Data_buff[10],Data_buff[9],Data_buff[8],
                                            Data_buff[6],Data_buff[5],~Data_buff[4],Data_buff[2]};
                           end
                    4'b0011:begin 
                                error_only<= 1'b1;
                                error_mul <= 1'b0;
                                Data_out <={Data_buff[11],Data_buff[10],Data_buff[9],Data_buff[8],
                                            Data_buff[6],~Data_buff[5],Data_buff[4],Data_buff[2]};
                           end
                    4'b0100:begin 
                                error_only<= 1'b1;
                                error_mul <= 1'b0;
                                Data_out <={Data_buff[11],Data_buff[10],Data_buff[9],Data_buff[8],
                                            ~Data_buff[6],Data_buff[5],Data_buff[4],Data_buff[2]};
                           end
                    4'b0101:begin 
                                error_only<= 1'b1;
                                error_mul <= 1'b0;
                                Data_out <={Data_buff[11],Data_buff[10],Data_buff[9],~Data_buff[8],
                                            Data_buff[6],Data_buff[5],Data_buff[4],Data_buff[2]};
                           end
                    4'b0110:begin 
                                error_only<= 1'b1;
                                error_mul <= 1'b0;
                                Data_out <={Data_buff[11],Data_buff[10],~Data_buff[9],Data_buff[8],
                                            Data_buff[6],Data_buff[5],Data_buff[4],Data_buff[2]};
                           end
                    4'b0111:begin 
                                error_only<= 1'b1;
                                error_mul <= 1'b0;
                                Data_out <={Data_buff[11],~Data_buff[10],Data_buff[9],Data_buff[8],
                                            Data_buff[6],Data_buff[5],Data_buff[4],Data_buff[2]};
                           end
                    4'b1000:begin 
                                error_only<= 1'b1;
                                error_mul <= 1'b0;
                                Data_out <={~Data_buff[11],Data_buff[10],Data_buff[9],Data_buff[8],
                                            Data_buff[6],Data_buff[5],Data_buff[4],Data_buff[2]};
                           end
                     default:begin 
                                 error_only<= 1'b1;
                                 error_mul <= 1'b1;
                                  Data_out <={Data_buff[11],Data_buff[10],Data_buff[9],Data_buff[8],
                                            Data_buff[6],Data_buff[5],Data_buff[4],Data_buff[2]};
                             end
                endcase
            end
            else
             begin
                Data_out <= Data_out;
                error_only<= 1'b0;
                error_mul <= 1'b0;
                qvld     <=  qvld;
             end
        end
    end
endmodule