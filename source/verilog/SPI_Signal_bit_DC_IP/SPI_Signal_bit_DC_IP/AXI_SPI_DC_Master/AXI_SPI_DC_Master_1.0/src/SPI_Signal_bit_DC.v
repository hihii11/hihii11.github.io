module SPI_Signal_bit_DC#(parameter CLK_DIV = 2)(
          input                 sed_rst  ,  //���ͻ���λ�ź�             
          input                     clk  ,  //ϵͳʱ��          
          input                    tx_en ,  //����ʹ��          
          input                    start ,  //һ�η��ʹ����ź�     
          input     [7:0]            din ,  //��������д��       
          output                 sck_out ,  //���ͻ�ͬ��ʱ��      
          output                      cs ,  //Ƭѡ�ź�         
          output    [11:0]        tx_buff,//���ͻ�����       
          output                    mosi ,  //�������   
          output                 sed_qvld,  //��������ź�  
          
          input                     sck_in,  //���ջ���ͬ��ʱ��
          input                    rec_rst,  //���ջ���λ�ź�
          input                      rx_en,  //����ʹ��
          input                       miso,  //���ջ��ź�����
          output                  rec_qvld,  //��������ź�
          output      [11:0]          test,  //�����ź�
          output      [7:0]           dout,  //�����������  
          
          output       [3:0]      err_addr, 
          output                error_mul,//2���ش����־λ 
          output                error_only//1���ش����־λ 
    );
    
    wire [11:0] tx_hanming_data;
    wire             Data_Fram0;//����ͬ��������֡
   
    wire [11:0] rx_hanming_data;
    wire  SPI_rec_qvld;
    
    HanMing_encoder HanMing_encoder0(//����������
       .   Data_in(  din),//��λ��������
       . Data_Fram(start),//����ͬ���ź�
       .       clk(  clk),//ʱ��
       .        EN(tx_en),//ģ��ʹ���ź�
       .       rst(sed_rst),//��λ
       .      qvld(Data_Fram0),//�����ع�����ź�
       .  Data_out(tx_hanming_data) //12λ�ع��������
);
    
    
       HanMing_decoder  HanMing_decoder0(//����������                           
        .  Data_Fram(SPI_rec_qvld),//����ͬ��֡����                
        .    Data_in(rx_hanming_data),//12λ����������               
        .        clk(clk),//ʱ�������                  
        .         EN(rx_en),//ʹ��                     
        .        rst(rec_rst),//��λ                     
        .   err_addr(err_addr),//�����ַ              
        .   Data_out(dout),//�����ع����������              
        .   error_only(error_only),//1bit�����־λ  
        .   error_mul(error_mul),//2bit�����־λ                   
        .       qvld(rec_qvld)//��������ź�                  
    );                                                         
    
    
    SPI_Master_tx#(.div0(CLK_DIV),.data_len(12)) tx_SPI_DC(//���ͻ�
                  .   rst  (sed_rst),
                  .   clk  (clk),
                  .  tx_en (tx_en),
                  .  start (Data_Fram0),//һ�η��ʹ����ź�
                  .    din (tx_hanming_data),//��������д��
                  .    sck (sck_out),//ʱ���ź�
                  .     cs (cs),//Ƭѡ�ź�
                  . tx_buff(tx_buff) ,//���ͻ�����
                  .    mosi(mosi) ,//�������
                  .    qvld(sed_qvld)  //��������ź�
    );
    
     SPI_Master_rx#(.data_len(12)) rx_SPI_DC(//���ջ�
                .   clk(clk),
                .   sck(sck_in),
                .   rst(rec_rst),
                . rx_en(rx_en),
                .  miso(miso),
                .  qvld(SPI_rec_qvld),//��������ź�
                .  test(test),
                .  dout(rx_hanming_data)
     );
endmodule