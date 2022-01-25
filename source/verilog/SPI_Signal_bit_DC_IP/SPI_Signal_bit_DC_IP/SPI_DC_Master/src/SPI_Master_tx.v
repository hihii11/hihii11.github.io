module SPI_Master_tx#(parameter div0 = 2,parameter data_len = 8)//��Ƶϵ������ָ�͵�ƽ����ʱ��
(// 0ģʽSPI�����ؽ����ݴ��뷢��������
       input                       rst  ,
       input                       clk  ,
       input                      tx_en ,
       input                      start ,//һ�η��ʹ����ź�
       input     [data_len-1:0]     din ,//��������д��
       output     reg               sck ,//ʱ���ź�
       output     reg                cs ,//Ƭѡ�ź�
       output    [data_len-1:0]  tx_buff ,//���ͻ�����
       output     reg              mosi ,//�������
       output     reg              qvld  //��������ź�
    );
    
    reg        [4:0]          state;
    reg        [15:0]       sck_cnt;
    reg        [data_len-1:0]        tx_buf;//���ͻ�����
    reg        [7:0]        bit_cnt;//����λ�������� 
    
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
            sck    <=  1'b0;//��Ϊ��SPI0ģʽ�����Կ���״̬Ϊ�͵�ƽ
            bit_cnt<=  8'd0;
        end
        else
        begin
            if(tx_en)
            begin
                case(state)
                    5'd0:begin//�ȴ����Ϳ�ʼ�ź�,�����ݴ��뷢�ͻ�����
                            if(start)
                            begin
                                tx_buf <= din;
                                state <= state + 5'd1;
                                cs    <= 1'b1;
                                sck   <= 1'b0;//��Ϊ��SPI0ģʽ�����Կ���״̬Ϊ�͵�ƽ
                                bit_cnt<= 8'd0;
                            end
                            else
                            begin
                                tx_buf <= 12'd0;
                                state  <= state;
                                cs     <= 1'b1;
                                sck   <= 1'b0;//��Ϊ��SPI0ģʽ�����Կ���״̬Ϊ�͵�ƽ
                                bit_cnt<= 8'd0;
                            end
                         end
                    5'd1:begin//�ȴ������ȶ�
                            if(!start)
                            begin
                                 state  <= state + 5'd1;
                                 cs    <= 1'b0;//��Ƭѡ
                                 qvld   <= 1'b0;//��λ��������ź�
                            end
                            else
                            begin
                                tx_buf <= din;
                                state <= state;
                                cs    <= 1'b1;//��Ƭѡ
                                sck   <= 1'b0;//��Ϊ��SPI0ģʽ�����Կ���״̬Ϊ�͵�ƽ
                            end
                          end
                    5'd2:begin//��ʼ����
                                if(bit_cnt == data_len)//�ɹ����12λ���ݷ���
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
                                        sck   <= 1'b1;//����ʱ����
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
                                    sck   <= 1'b0;//����ʱ����
                                    bit_cnt <= bit_cnt + 8'd1;//�������һ��bit�ͼ���һ��
                                    state  <= 5'd2;
                                end
                         end
                         default:begin
                             tx_buf <=  12'd0;
                             state  <=  5'd0;
                             sck_cnt<= 16'd0;
                             cs     <=  1'b1;
                             qvld   <=  1'b0;
                             sck    <=  1'b0;//��Ϊ��SPI0ģʽ�����Կ���״̬Ϊ�͵�ƽ
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
                sck    <=      sck;//��Ϊ��SPI 0ģʽ�����Կ���״̬Ϊ�͵�ƽ
                bit_cnt <= bit_cnt;
            end
        end
    end 
endmodule