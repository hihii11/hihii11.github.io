`timescale 1ns / 1ps
module tb_0832(

    );
      reg                      clk;//ϵͳclk                    
      reg      [1:0]           sel;//ͨ��ѡ���                    
      reg                      rst;//��λ                       
      reg                    D0832;//0832�������                 
      wire                      DI;//0832��������                 
      wire                      cs;//0832Ƭѡ                   
      wire                  finish;//һ�ֲɼ���������ź�               
      wire                clk_0832;//��ƽ���ʱ��                   
      wire       [7:0]    data_CH0;//0832�ɼ�ֵ���                
      wire       [7:0]    data_CH1;                            
    
    initial begin
        clk = 0;
        forever 
        #1 clk = ~clk;
    end
    
    initial begin
        rst=0;
        sel=2'b11;
        D0832=1;
       #2 rst=1;
       #2 rst=0;
       // sel=2'b01;
       // sel=2'b10;
       //sel=2'b11;
    end
    
    ADC0832_top  adc0832(                                                
   .     clk(     clk),//ϵͳclk                 
   .     sel(     sel),//ͨ��ѡ���                 
   .     rst(     rst),//��λ                    
   .   D0832(   D0832),//0832�������              
   .      DI(      DI),//0832��������              
   .      cs(      cs),//0832Ƭѡ                
   .  finish(  finish),//һ�ֲɼ���������ź�            
   .clk_0832(clk_0832),//��ƽ���ʱ��                
   .data_CH0(data_CH0),//0832�ɼ�ֵ���             
   .data_CH1(data_CH1)                         
     );
endmodule
