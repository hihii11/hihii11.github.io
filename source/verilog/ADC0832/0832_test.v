`timescale 1ns / 1ps
module tb_0832(

    );
      reg                      clk;//系统clk                    
      reg      [1:0]           sel;//通道选择端                    
      reg                      rst;//复位                       
      reg                    D0832;//0832数据输出                 
      wire                      DI;//0832数据输入                 
      wire                      cs;//0832片选                   
      wire                  finish;//一轮采集结束输出信号               
      wire                clk_0832;//电平检测时钟                   
      wire       [7:0]    data_CH0;//0832采集值输出                
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
   .     clk(     clk),//系统clk                 
   .     sel(     sel),//通道选择端                 
   .     rst(     rst),//复位                    
   .   D0832(   D0832),//0832数据输出              
   .      DI(      DI),//0832数据输入              
   .      cs(      cs),//0832片选                
   .  finish(  finish),//一轮采集结束输出信号            
   .clk_0832(clk_0832),//电平检测时钟                
   .data_CH0(data_CH0),//0832采集值输出             
   .data_CH1(data_CH1)                         
     );
endmodule
