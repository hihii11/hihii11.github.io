module ADC0832_top(
            input                      clk,//系统clk
            input      [1:0]           sel,//通道选择端
            input                      rst,//复位
            input                    D0832,//0832数据输出
            output                      DI,//0832数据输入
            output                      cs,//0832片选
            output                  finish,//一轮采集结束输出信号
            output                clk_0832,//电平检测时钟
            output  reg  [7:0]    data_CH0,//0832采集值输出
            output  reg  [7:0]    data_CH1 
);
    reg          CH_sel;
    wire             EN;
    wire [7:0]  OUT0832;
    
    assign EN = (sel == 2'b00) ? 0:1; 
    
    always @ (posedge finish , posedge rst)
    begin
        if(rst)
        begin
            if(sel == 2'b01 || sel == 2'b11)
                CH_sel <= 1'b0;//选择CH0通道
            else if(sel == 2'b10)
                CH_sel <= 1'b1;//选择CH1通道
            else
                CH_sel <= 2'b0;
        end
        else
        begin
           case(sel)
                2'b00:   CH_sel <= CH_sel;
                2'b01:   CH_sel <= 1'b0;//CH0
                2'b10:   CH_sel <= 1'b1;//CH1
                2'b11:   CH_sel <= ~CH_sel;//交替
                default: CH_sel <= 1'b0;
           endcase
        end
    end
    
    always @ (posedge finish , posedge rst)
    begin
        if(rst)
        begin
             data_CH0 <= 8'd0;
             data_CH1 <= 8'd0;
        end 
        else
        begin
            if(CH_sel == 0)
            begin
                data_CH0 <= OUT0832;
            end
            else
            begin
                data_CH1 <= OUT0832;
            end
        end
    end
    
    ADC_0832_CH adc_0832(                                                   
        . clk_0832   (clk_0832 ),//电平检测时钟                       
        .      clk   (     clk ),//系统clk控制状态机的                 
        .       EN   (      EN ),//使能端口                        
        .      rst   (     rst ),//0832复位                      
        .   CH_sel   (  CH_sel ),//通道选择数据                      
        .    D0832   (   D0832 ),//0832数据输出                    
        .       DI   (      DI ),//0832数据输入                    
        .       cs   (      cs ),//0832片选                      
        .   finish   (  finish ),//一轮采集结束输出信号                  
        .   OUT0832  (  OUT0832)//0832采集值输出                   
);                                                             
    
    
endmodule

module ADC_0832_CH(
          output   reg        clk_0832,//电平检测时钟
           input                    clk,//系统clk控制状态机的
           input                     EN,//使能端口
           input                    rst,//0832复位
           input                 CH_sel,//通道选择数据
           input                  D0832,//0832数据输出
           output   reg              DI,//0832数据输入
           output   reg              cs,//0832片选
           output   reg          finish,//一轮采集结束输出信号
           output   reg [7:0]    OUT0832//0832采集值输出
       );
    
    reg [5:0]state;
    reg [7:0]data;
    always @ (posedge clk or posedge rst)
    begin
        if(rst)
            begin
                 OUT0832<=8'd0;
                 data<=8'd0;
                 state<=4'd0;
                 cs<=1'b1;
            end
         else
         begin
            if(EN)
            begin
                case(state)
                6'd0:begin cs<=1'b0;DI<=1'b1;clk_0832<=1'b1;state<=state+6'd1;data<=8'd0;finish<=1'b0; end//选中0832芯片 DI拉高 0832clk；拉高
                6'd1:begin clk_0832<=1'b0;state<=state+6'd1;end//第一个clk DI置位
                6'd2:begin DI<=1'b1;clk_0832<=1'b1;state<=state+6'd1;  end 
                6'd3:begin clk_0832<=1'b0;state<=state+6'd1;  end //第二个clk写入DI 双通道单极性
                6'd4:begin DI<=CH_sel;clk_0832<=1'b1;state<=state+6'd1;  end 
                6'd5:begin clk_0832<=1'b0;state<=state+6'd1;  end //第三个clk写入DI 选择CH1
                
                6'd6:begin state<=state+6'd1; end//空操作
                
                6'd7:begin state<=state+6'd1;clk_0832<=1'b1; end//拉高clk
                6'd8:begin state<=state+6'd1;clk_0832<=1'b0; end//拉低clk
                6'd9:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//采集data第一位 拉高clk
                
                6'd10:begin state<=state+6'd1;clk_0832<=1'b0; end//拉低clk
                6'd11:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//采集data第二位 拉高clk
                
                6'd12:begin state<=state+6'd1;clk_0832<=1'b0; end//拉低clk
                6'd13:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//采集data第三位 拉高clk
                
                6'd14:begin state<=state+6'd1;clk_0832<=1'b0; end//拉低clk          
                6'd15:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//采集data第四位 拉高clk
                
                6'd16:begin state<=state+6'd1;clk_0832<=1'b0; end//拉低clk          
                6'd17:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//采集data第五位 拉高clk
                
                6'd18:begin state<=state+6'd1;clk_0832<=1'b0; end//拉低clk          
                6'd19:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//采集data第六位 拉高clk
                
                6'd20:begin state<=state+6'd1;clk_0832<=1'b0; end//拉低clk          
                6'd21:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//采集data第七位 拉高clk
                
                6'd22:begin state<=state+6'd1;clk_0832<=1'b0; end//拉低clk          
                6'd23:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//采集data第八位 拉高clk
                
                6'd24:begin  state<=state+6'd1; OUT0832<= data; end
                6'd25:begin  finish<=1'b1;state<=6'd0;cs<=1'b1; end//结束一个周期
                default:begin  finish<=1'b1;state<=6'd0; OUT0832<= 6'd0;data<=6'd0;  cs<=1'b1; end
                endcase
            end
            else
            begin
                 state <= 4'd0;
                 data  <= data;
                 cs    <= 1'b1;
            end
         end
    end
endmodule