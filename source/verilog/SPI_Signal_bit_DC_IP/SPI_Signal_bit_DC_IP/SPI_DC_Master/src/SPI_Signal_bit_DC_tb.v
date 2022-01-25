`timescale 1ns / 1ps

module SPI_Signal_bit_DC_tb(

    );
         reg                     rst  ;  //��λ�ź�             
         reg                     clk  ;  //ϵͳʱ��          
         reg                    tx_en ;  //����ʹ��          
         reg                    start ;  //һ�η��ʹ����ź�     
         reg     [7:0]            din ;  //��������д��        
         wire                      cs ;  //Ƭѡ�ź�         
         wire    [11:0]        tx_buff;//���ͻ�����       
         wire                    mosi ;  //�������   
         wire                 sed_qvld;  //��������ź�  
          
          wire                      sck;  //����ͬ��ʱ��
          reg                      rx_en;  //����ʹ��
          wire                  rec_qvld;  //��������ź�
          wire      [11:0]          test;  //�����ź�
          wire      [7:0]          dout;  //�����������     
          wire       [3:0]      err_addr; 
          wire                error_only;//1���ش����־λ 
          wire                error_mul ;//2���ش����־λ 
          
          integer i;
          
    initial begin//����ϵͳʱ��
        clk = 0;
        forever
            #1 clk = ~clk;
    end
    
    initial begin
        rst   =     0;
        start =     0;
        tx_en =     0;
        rx_en =     0;
        din   = 12'd0;
        
        rst = 1;
     #1 rst = 0;//ϵͳ��λ
     i=0;
        {tx_en,rx_en}=2'b11;//ʹ���շ�������
        
        din = 8'h000;
     #2 start = 1;
     #2 start = 0;  
        
        while(i<=8'hff)
        begin
             #100 
              din =din+8'h01;
             #2 start = 1;
             #2 start = 0;  
        end
    end   
    
    SPI_Signal_bit_DC#(.CLK_DIV(2)) SPI_Signal_bit_DC0(                                         
          .sed_rst  (rst),  //���ͻ���λ�ź�                                     
          .   clk   (clk),  //ϵͳʱ��                                        
          .  tx_en  (tx_en),  //����ʹ��                                        
          .  start  (start),  //һ�η��ʹ����ź�                                    
          .    din  (din),  //��������д��                                      
          .sck_out  (sck),  //���ͻ�ͬ��ʱ��                                     
          .     cs  (cs),  //Ƭѡ�ź�                                        
          . tx_buff (tx_buff),//���ͻ�����                                      
          .   mosi  (mosi),  //�������                                        
          .sed_qvld (sed_qvld),  //��������ź�                                      
                                                                   
          .   sck_in (sck),  //���ջ���ͬ��ʱ��                                   
          .  rec_rst (rst),  //���ջ���λ�ź�                                    
          .    rx_en (rx_en),  //����ʹ��                                       
          .     miso (mosi),  //���ջ��ź�����                                    
          . rec_qvld (rec_qvld),  //��������ź�                                     
          .     test (test),  //�����ź�                                       
          .     dout (dout),   //�����������     
          
          .   err_addr (  err_addr),
          . error_only (error_only),
          .  error_mul (error_mul)                                
    );
endmodule
