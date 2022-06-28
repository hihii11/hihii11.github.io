`timescale 1ns / 1ps
module gata_clock_tb(

    );
        reg             CLK_IN;
        reg            CLK_ENI;
        wire           CLK_OUT;
        initial begin
            CLK_IN = 1'b0;
            forever #2 CLK_IN = ~CLK_IN;
        end
        
        initial begin
            CLK_ENI = 0;
            #15 CLK_ENI = 1;
            #16 CLK_ENI = 0;
            #6 CLK_ENI = 1;
            #17 CLK_ENI = 0;
            forever #2 CLK_ENI = ~CLK_ENI;
        end
        
    gata_clock gata_clock_inist(
        .     CLK_IN( CLK_IN),
        .    CLK_ENI(CLK_ENI),
        .    CLK_OUT(CLK_OUT)
    );
endmodule
