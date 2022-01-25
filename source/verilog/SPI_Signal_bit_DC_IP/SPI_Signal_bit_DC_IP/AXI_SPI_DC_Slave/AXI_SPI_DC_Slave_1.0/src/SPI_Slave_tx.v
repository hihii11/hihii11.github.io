module SPI_Slave_tx#(parameter data_len = 8)//��Ƶϵ������ָ�͵�ƽ����ʱ��
(// 0ģʽSPI�����ؽ����ݴ��뷢��������
       input                       rst  ,
       input                       clk  ,
       input                      tx_en ,
       input                      start ,//һ�η��ʹ����ź�
       input     [data_len-1:0]     din ,//��������д��
       input                        cs  ,//Ƭѡ�ź�
       input                        sck ,//ʱ���ź�
       output    [data_len-1:0]  tx_buff ,//���ͻ�����
       output     reg                so ,//�������
       output    [4:0]          state_tx,
       output     reg              qvld  //��������ź�
    );
    
    reg        [4:0]          state0;
    reg        [4:0]          state1;
    reg        [15:0]       sck_cnt;
    reg        [data_len-1:0]        tx_buf;//���ͻ�����
     reg       [data_len-1:0]      tx_data;//��������
    reg        [7:0]        bit_cnt;//����λ�������� 
    
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
                    5'd1:begin//�ȴ������ȶ� ���ҷ���ģ�������������
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
                            so   <= 1'b0;//���е͵�ƽ
                            if(data_ready)//�������׼����
                            begin
                                tx_data       <= tx_buf;
                                data_tx_ready <= 1'b1;
                                state1        <= state1+5'd1;
                            end
                            else//���ݻ�δ׼����
                            begin
                                tx_data       <= tx_data;
                                data_tx_ready <= 1'b0;//�������ݷ���׼���ź�
                                state1        <= state1;
                            end
                       end
                  5'd1:begin//�ȴ�sck�����ط�������
                            if(bit_cnt == data_len)//�ɹ����12λ���ݷ���
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
                                        bit_cnt <= bit_cnt + 8'd1;//�������һ��bit�ͼ���һ��
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