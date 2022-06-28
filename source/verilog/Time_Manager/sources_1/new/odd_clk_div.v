//module odd_clk_div#(
//        parameter integer DIV_NUM = 3
//)(
//       input  wire  CLK_IN,
//       input  wire    nRST,
//       output wire  TFF_EN0,
//       output wire  TFF_EN1,
//       output wire   LOGIC0,
//       output wire   LOGIC1,
//       output wire   [15:0] CLK_CNT,
//       output wire CLK_OUT
//    );
    
//    reg [15:0] clk_cnt;//clock counter
//    wire tff_en0,tff_en1;
//    assign CLK_CNT = clk_cnt;
//    assign tff_en0 = (clk_cnt == 'd0)?1'b1:1'b0;
//    assign tff_en1 = (clk_cnt == (DIV_NUM+1)/2)?1'b1:1'b0;
//    assign TFF_EN0 = tff_en0;
//    assign TFF_EN1 = tff_en1;
//    //counter
//    always@(posedge CLK_IN)
//    begin
//        if(~nRST)
//        begin
//            clk_cnt <= 16'd0;
//        end
//        else
//        begin
//            if(clk_cnt != DIV_NUM - 1)
//            begin
//                clk_cnt <= clk_cnt + 16'd1;
//            end 
//            else clk_cnt <= 16'd0;
//        end
//    end
    
//    //clock bulid logic
//    reg clk_div0_lgic;//sample tff_en0 at clk posegde
//    reg clk_div1_lgic;//sample tff_en1 at clk negedge
//    assign CLK_OUT = clk_div0_lgic ^ clk_div1_lgic;
//    assign LOGIC0 = clk_div0_lgic;
//    assign LOGIC1 = clk_div1_lgic;
//    //TFF 0
//    always@(posedge CLK_IN)
//    begin
//        if(~nRST)
//        begin
//            clk_div0_lgic <= 1'b0;
//        end
//        else
//        begin
//            if(tff_en0)
//                clk_div0_lgic <= ~clk_div0_lgic;
//            else
//                clk_div0_lgic <= clk_div0_lgic;
//        end
//    end
//    //TFF 1
//    always@(negedge CLK_IN)
//    begin
//        if(~nRST)
//        begin
//            clk_div1_lgic <= 1'b0;
//        end
//        else
//        begin
//             if(tff_en1)
//                clk_div1_lgic <= ~clk_div1_lgic;
//            else
//                clk_div1_lgic <= clk_div1_lgic;
//        end
//    end
//endmodule
module odd_clk_div#(
        parameter integer DIV_NUM = 3
)(
       input  wire  CLK_IN,
       input  wire    nRST,
       output wire   LOGIC0,
       output wire   LOGIC1,
       output wire   [15:0] CLK_CNT0,
       output wire   [15:0] CLK_CNT1,
       output wire CLK_OUT
    );
    
    reg [15:0] clk_cnt0;//clock counter
    reg [15:0] clk_cnt1;//clock counter
    wire logic0,logic1;
    assign LOGIC0 = logic0;    
    assign LOGIC1 = logic1;    
    assign CLK_CNT0 = clk_cnt0;
    assign CLK_CNT1 = clk_cnt1;
    
    
    
    assign CLK_OUT = logic0 ^ logic1;
    assign logic0 = (clk_cnt0 < DIV_NUM ) ? 1'b1:1'b0;
    assign logic1 = (clk_cnt1 < DIV_NUM ) ? 1'b1:1'b0;
    //counter
    always@(posedge CLK_IN)
    begin
        if(~nRST)
        begin
            clk_cnt0 <= 16'd0;
        end
        else
        begin
            if(clk_cnt0 != 2*DIV_NUM - 1)
            begin
                clk_cnt0 <= clk_cnt0 + 16'd1;
            end 
            else clk_cnt0 <= 16'd0;
        end
    end
    always@(negedge CLK_IN)
    begin
        if(~nRST)
        begin
            clk_cnt1 <= (DIV_NUM+1)/2 - 1;
        end
        else
        begin
            if(clk_cnt1 != 2*DIV_NUM - 1)
            begin
                clk_cnt1 <= clk_cnt1 + 16'd1;
            end 
            else clk_cnt1 <= 16'd0;
        end
    end
   
endmodule
