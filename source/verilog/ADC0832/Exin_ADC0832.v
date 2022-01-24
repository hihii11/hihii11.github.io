module               Exin_ADC0832(
    output   reg     clk_0832,//电平检测时钟
    input                 clk,//系统clk控制状态机的
    input                 rst,//0832复位
    input                  D0832,//0832数据输出
    output   reg           DI,//0832数据输入
    output   reg           cs,//0832片选
    output   reg       finish,//一轮采集结束输出信号
    output   reg [7:0] OUT0832//0832采集值输出
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
            case(state)
            6'd0:begin cs<=1'b0;DI<=1'b1;clk_0832<=1'b1;state<=state+6'd1;data<=8'd0;finish<=1'b0; end//选中0832芯片 DI拉高 0832clk；拉高
            6'd1:begin clk_0832<=1'b0;state<=state+6'd1;end//第一个clk DI置位
            6'd2:begin DI<=1'b1;clk_0832<=1'b1;state<=state+6'd1;  end 
            6'd3:begin clk_0832<=1'b0;state<=state+6'd1;  end //第二个clk写入DI 双通道单极性
            6'd4:begin DI<=1'b1;clk_0832<=1'b1;state<=state+6'd1;  end 
            6'd5:begin clk_0832<=1'b0;state<=state+6'd1;  end //第三个clk写入DI 选择CH2
            
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
            
            6'd24:begin  finish<=1'b1;state<=6'd0; OUT0832<= data;cs<=1'b1; end//结束一个周期
            default:begin  finish<=1'b1;state<=6'd0; OUT0832<= 6'd0;data<=6'd0;  cs<=1'b1; end
            endcase
         end
    end
endmodule
