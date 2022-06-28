module div_counter#(
        parameter integer DIV_NUM = 2
)(
        input  wire  CLK_IN,
        input  wire    nRST,
        output wire CLK_OUT
    );
    
    reg [15:0] clk_cnt;
    reg clk_out;
    assign CLK_OUT = (clk_cnt < DIV_NUM/2)?1'b1:1'b0;
    always@(posedge CLK_IN)
    begin
        if(~nRST)
        begin
            clk_cnt <= 16'd0;
        end
        else
        begin
            if(clk_cnt != DIV_NUM - 1)
                clk_cnt <= clk_cnt + 16'd1;
            else
                clk_cnt <= 16'd0;
        end
    end
    
//    always@(posedge CLK_IN)
//    begin
//        if(~nRST)
//        begin
//            clk_out <= 1'b0;
//        end
//        else
//        begin
//            if(clk_cnt < DIV_NUM/2)
//                clk_out <= 1'b1;
//            else
//                clk_out <= 1'b0;
//        end
//    end
endmodule
