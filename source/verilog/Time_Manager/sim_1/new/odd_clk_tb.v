`timescale 1ns / 1ps
module odd_clk_tb(

    );
    reg                     CLK_IN;
    reg                       nRST;
    wire                   CLK_OUT;
    wire                    LOGIC0;
    wire                    LOGIC1;
    wire   [15:0] CLK_CNT0,CLK_CNT1;
    initial begin   
        CLK_IN = 0;
        forever begin
            #1 CLK_IN = ~CLK_IN;
        end
    end
    
    initial begin   
        nRST = 0;
        #4 nRST = 1;
    end
    
   odd_clk_div#(
        . DIV_NUM (7)
)odd_clk_div_inist0(
        .  CLK_IN(CLK_IN),
        .    nRST(  nRST),
        . CLK_OUT(CLK_OUT),
        . LOGIC0( LOGIC0),
        .CLK_CNT0(CLK_CNT0),
        .CLK_CNT1(CLK_CNT1),
        . LOGIC1( LOGIC1)   
    );
endmodule
