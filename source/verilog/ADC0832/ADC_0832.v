module ADC0832_top(
            input                      clk,//ϵͳclk
            input      [1:0]           sel,//ͨ��ѡ���
            input                      rst,//��λ
            input                    D0832,//0832�������
            output                      DI,//0832��������
            output                      cs,//0832Ƭѡ
            output                  finish,//һ�ֲɼ���������ź�
            output                clk_0832,//��ƽ���ʱ��
            output  reg  [7:0]    data_CH0,//0832�ɼ�ֵ���
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
                CH_sel <= 1'b0;//ѡ��CH0ͨ��
            else if(sel == 2'b10)
                CH_sel <= 1'b1;//ѡ��CH1ͨ��
            else
                CH_sel <= 2'b0;
        end
        else
        begin
           case(sel)
                2'b00:   CH_sel <= CH_sel;
                2'b01:   CH_sel <= 1'b0;//CH0
                2'b10:   CH_sel <= 1'b1;//CH1
                2'b11:   CH_sel <= ~CH_sel;//����
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
        . clk_0832   (clk_0832 ),//��ƽ���ʱ��                       
        .      clk   (     clk ),//ϵͳclk����״̬����                 
        .       EN   (      EN ),//ʹ�ܶ˿�                        
        .      rst   (     rst ),//0832��λ                      
        .   CH_sel   (  CH_sel ),//ͨ��ѡ������                      
        .    D0832   (   D0832 ),//0832�������                    
        .       DI   (      DI ),//0832��������                    
        .       cs   (      cs ),//0832Ƭѡ                      
        .   finish   (  finish ),//һ�ֲɼ���������ź�                  
        .   OUT0832  (  OUT0832)//0832�ɼ�ֵ���                   
);                                                             
    
    
endmodule

module ADC_0832_CH(
          output   reg        clk_0832,//��ƽ���ʱ��
           input                    clk,//ϵͳclk����״̬����
           input                     EN,//ʹ�ܶ˿�
           input                    rst,//0832��λ
           input                 CH_sel,//ͨ��ѡ������
           input                  D0832,//0832�������
           output   reg              DI,//0832��������
           output   reg              cs,//0832Ƭѡ
           output   reg          finish,//һ�ֲɼ���������ź�
           output   reg [7:0]    OUT0832//0832�ɼ�ֵ���
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
                6'd0:begin cs<=1'b0;DI<=1'b1;clk_0832<=1'b1;state<=state+6'd1;data<=8'd0;finish<=1'b0; end//ѡ��0832оƬ DI���� 0832clk������
                6'd1:begin clk_0832<=1'b0;state<=state+6'd1;end//��һ��clk DI��λ
                6'd2:begin DI<=1'b1;clk_0832<=1'b1;state<=state+6'd1;  end 
                6'd3:begin clk_0832<=1'b0;state<=state+6'd1;  end //�ڶ���clkд��DI ˫ͨ��������
                6'd4:begin DI<=CH_sel;clk_0832<=1'b1;state<=state+6'd1;  end 
                6'd5:begin clk_0832<=1'b0;state<=state+6'd1;  end //������clkд��DI ѡ��CH1
                
                6'd6:begin state<=state+6'd1; end//�ղ���
                
                6'd7:begin state<=state+6'd1;clk_0832<=1'b1; end//����clk
                6'd8:begin state<=state+6'd1;clk_0832<=1'b0; end//����clk
                6'd9:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//�ɼ�data��һλ ����clk
                
                6'd10:begin state<=state+6'd1;clk_0832<=1'b0; end//����clk
                6'd11:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//�ɼ�data�ڶ�λ ����clk
                
                6'd12:begin state<=state+6'd1;clk_0832<=1'b0; end//����clk
                6'd13:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//�ɼ�data����λ ����clk
                
                6'd14:begin state<=state+6'd1;clk_0832<=1'b0; end//����clk          
                6'd15:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//�ɼ�data����λ ����clk
                
                6'd16:begin state<=state+6'd1;clk_0832<=1'b0; end//����clk          
                6'd17:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//�ɼ�data����λ ����clk
                
                6'd18:begin state<=state+6'd1;clk_0832<=1'b0; end//����clk          
                6'd19:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//�ɼ�data����λ ����clk
                
                6'd20:begin state<=state+6'd1;clk_0832<=1'b0; end//����clk          
                6'd21:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//�ɼ�data����λ ����clk
                
                6'd22:begin state<=state+6'd1;clk_0832<=1'b0; end//����clk          
                6'd23:begin data<=data<<1|D0832; clk_0832<=1'b1;state<=state+6'd1; end//�ɼ�data�ڰ�λ ����clk
                
                6'd24:begin  state<=state+6'd1; OUT0832<= data; end
                6'd25:begin  finish<=1'b1;state<=6'd0;cs<=1'b1; end//����һ������
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