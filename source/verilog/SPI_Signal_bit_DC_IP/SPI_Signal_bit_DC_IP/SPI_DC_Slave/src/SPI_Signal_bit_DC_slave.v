module SPI_Signal_bit_DC_slave(
        input                       rst  ,//��λ�ź�
        input                       clk  ,//ϵͳʱ��
        
        input                      tx_en ,//����ʹ��
        input                      start ,//һ�η��ʹ����ź�
        input     [7:0]              din ,//��������д��
        input                        cs  ,//Ƭѡ�ź�
        input                        sck ,//ʱ���ź�
        output    [11:0]         tx_buff ,//���ͻ�����
        output                        so ,//�ӻ����
        output                  sed_qvld , //�ӻ���������ź�
        //output    [11:0]        Han_tx_data,
        //output                   Data_Fra,
        //output    [4:0]          state_tx,
        
        
        input                       rx_en,//����ʹ��
        input                          si,//���������ź�
        output     [7:0]             dout,//�����������
        output     [3:0]         err_addr,//�������ݵ�ַ
        output                 error_only,//1bit�����־λ
        output                  error_mul,//2���ػ����ϴ����־λ
        output                   rec_qvld //������������ź�
    );
    
    wire              Data_Fram0;//��������������ͬ��֡
    wire  [11:0] tx_hanming_data;//�����������������
    
    wire              Data_Fram1;//��������������ͬ��֡
    wire  [11:0] rx_hanming_data;//������������������
    //assign Data_Fra = Data_Fram0;
    //assign Han_tx_data = tx_hanming_data;
    
    
    
     HanMing_encoder HanMing_encoder0(//����������
        .    Data_in(din),//��λ��������
        .  Data_Fram(start),//����ͬ���ź�
        .        clk(clk),//ʱ��
        .         EN(tx_en),//ģ��ʹ���ź�
        .        rst(rst),//��λ
        .       qvld(Data_Fram0),//�����ع�����ź�
        .   Data_out(tx_hanming_data) //12λ�ع��������
     );

     HanMing_decoder HanMing_decoder0(//����������
       .  Data_Fram(Data_Fram1),//����ͬ��֡����
       .    Data_in(rx_hanming_data),//12λ����������
       .        clk(clk),//ʱ�������
       .         EN(rx_en),//ʹ��
       .        rst(rst),//��λ
       .   err_addr(err_addr),//�����ַλ
       .   Data_out(dout),//�����ع����������
       . error_only(error_only),//1bit�����־λ
       .  error_mul(error_mul),//2���ػ����ϴ����־λ
       .       qvld(rec_qvld)//��������ź�
    );

    SPI_Slave_tx#(.data_len(12)) SPI_Slave_tx0
    (
       .   rst  (rst),
       .   clk  (clk),
       .  tx_en (tx_en),
       .  start (Data_Fram0),//һ�η��ʹ����ź�
       .    din (tx_hanming_data),//��������д��
       .    cs  (cs),//Ƭѡ�ź�
       .    sck (sck),//ʱ���ź�
       . tx_buff(tx_buff),//���ͻ�����
       .     so (so),//�ӻ����
//       .  state_tx(state_tx),
       .   qvld (sed_qvld) //��������ź�
    );
    
     SPI_Slave_rx#(.data_len(12)) SPI_Slave_rx0
     (
       .    clk(clk),
       .    sck(sck),
       .    rst(rst),
       .  rx_en(rx_en),
       .        si(si),
       .   qvld(Data_Fram1),//��������ź�
       .   dout(rx_hanming_data)
     );
   
endmodule