module SPI_Master_rx#(parameter data_len = 8)(
       input                         clk,
       input                         sck,
       input                         rst,
       input                       rx_en,
       input                        miso,
       output reg                   qvld,//接收完成信号
       output      [data_len-1:0]    test,
       output reg [data_len-1:0]     dout
);
    
    reg [4:0]             state;
    reg [7:0]           bit_cnt;
    reg [data_len-1:0]   rx_buf;
    reg                  miso_0;
    assign test = rx_buf;
    
    
    
    always @ (posedge clk , negedge sck, posedge rst)
    begin
        if(rst)
        begin
            state <= 5'd0;
            rx_buf<= 12'd0;
            bit_cnt<=8'd0;
            qvld   <= 1'b0;
        end
        else
        begin
            if(rx_en)
            begin
                case(state)
                    5'd0:begin
                            if(sck)
                            begin
                                state <= state + 5'd1;
                                rx_buf <= 12'd0;
                                qvld <=  qvld ;
                            end
                             else
                             begin
                                state <= state;
                                rx_buf <= 12'd0;
                                qvld   <=  qvld ;
                             end
                        end
                    5'd1:begin
                            if(~sck)
                            begin
                                qvld   <=  1'b0 ;
                                rx_buf <= {rx_buf[data_len-2:0],miso};
                                bit_cnt <= bit_cnt + 8'd1;
                                state  <= state + 5'd1;
                            end
                            else
                            begin
                                rx_buf <= rx_buf;
                                bit_cnt <= bit_cnt;
                                state <= state;
                                qvld  <= qvld;
                            end
                    end 
                    5'd2:begin
                            if(bit_cnt != data_len)
                            begin
                                if(sck)
                                begin
                                    state <= 5'd1;
                                end
                                else
                                begin
                                    state <= state;
                                end
                            end
                            else
                            begin
                                qvld <= 1'b0;
                                bit_cnt <= 8'd0;
                                dout <= rx_buf;
                                rx_buf <= 12'd0;
                                state <= 5'd3;
                            end
                        end
                     5'd3:begin
                            qvld <= 1'b1;
                            state <= 5'd0;
                          end
                     default:begin state <= 5'd0;end
                endcase
            end
            else
            begin
                state <=  state;
                rx_buf<= rx_buf;
                bit_cnt<= bit_cnt;
            end
        end
    end 
endmodule