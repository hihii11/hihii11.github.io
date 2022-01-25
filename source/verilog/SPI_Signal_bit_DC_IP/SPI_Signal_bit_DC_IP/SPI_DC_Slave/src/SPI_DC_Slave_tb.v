`timescale 1ns / 1ps
module SPI_DC_Slave_tb(

    );
    reg                       rst  ;            
    reg                       clk  ;            
    reg                      tx_en ;            
    reg                      start ;//һ�η��ʹ����ź�   
    reg     [7:0]              din ;//��������д��     
    reg                        cs  ;//Ƭѡ�ź�       
    reg                        sck ;//ʱ���ź�       
    wire    [11:0]          tx_buff;//���ͻ����� 
    wire    [11:0]          Han_tx_data;    
    wire                         so;//�������       
    wire                   sed_qvld;//��������ź� 
    wire                  Data_Fra;  
    wire     [4:0]          state_tx;  
    
    
    
        reg                         rx_en;//����ʹ��
        wire                           si;//���������ź�
        wire     [7:0]             dout;//�����������
        wire     [3:0]         err_addr;//�������ݵ�ַ
        wire                 error_only;//1bit�����־λ
        wire                  error_mul;//2���ػ����ϴ����־λ
        wire                   rec_qvld; //������������ź�
    assign si = so;
    
    integer i ;
    
    
    initial begin
        clk = 0;
        forever
         #1 clk=~clk;
    end
    
    initial begin
         tx_en = 1'b0;
         rst   = 1'b0;
         start = 1'b0;
         din   =12'd0;
         cs    = 1'b1;
         sck   = 1'b0;
      #1 rst   = 1'b1;
      #1 rst   = 1'b0;
         tx_en  = 1'b1;   //ʹ�ܷ���
         rx_en  = 1'b1;
         din    =  8'h01;
      #4 start  = 1'b1;
      #4 start  = 1'b0;
      #100 i = 0;
          cs = 1'b0;
          while(i<12)
          begin
             #4 sck = 1'b0;
             #4 sck = 1'b1;
                i = i+1;
          end
          #4sck = 1'b0;
          #2cs = 1'b1;
     #100     
         din    =  8'h13;
      #4 start  = 1'b1;
      #4 start  = 1'b0;
      #10 i = 0;
          cs = 1'b0;
          while(i<12)
          begin
             #4 sck = 1'b0;
             #4 sck = 1'b1;
                i = i+1;
          end
          #4sck = 1'b0;
          #2cs = 1'b1;
    end
    SPI_Signal_bit_DC_slave SPI_Signal_bit_DC_slave0(                                               
        .       rst  (     rst ),//��λ�ź�                              
        .       clk  (     clk ),//ϵͳʱ��                                          
        .      tx_en (    tx_en),//����ʹ��                              
        .      start (    start),//һ�η��ʹ����ź�                          
        .        din (      din),//��������д��                            
        .        cs  (      cs ),//Ƭѡ�ź�                              
        .        sck (      sck),//ʱ���ź�                              
        .    tx_buff (  tx_buff),//���ͻ�����                             
        .         so (       so),//�ӻ����                 
        . sed_qvld ( sed_qvld), //�ӻ���������ź� 
        
       .      rx_en(rx_en),//����ʹ��
       .         si(si),//���������ź�
       .       dout(dout),//�����������
       .   err_addr(err_addr),//�������ݵ�ַ
       . error_only(error_only),//1bit�����־λ
       .  error_mul(error_mul),//2���ػ����ϴ����־λ
       .   rec_qvld(rec_qvld) //������������ź�                         
    );                                                                        
//    SPI_Slave_tx#(.data_len(12)) SPI_Slave_tx0//��Ƶϵ������ָ�͵�ƽ����ʱ��
//(// 0ģʽSPI�����ؽ����ݴ��뷢��������
//      .   rst  (  rst  ),
//      .   clk  (  clk  ),
//      .  tx_en ( tx_en ),
//      .  start ( start ),//һ�η��ʹ����ź�
//      .    din (   din ),//��������д��
//      .    cs  (   cs  ),//Ƭѡ�ź�
//      .    sck (   sck ),//ʱ���ź�
//      . tx_buff(tx_buff) ,//���ͻ�����
//      .     so (    so ),//�������
//      .   qvld (  qvld ) //��������ź�
//    );
endmodule
