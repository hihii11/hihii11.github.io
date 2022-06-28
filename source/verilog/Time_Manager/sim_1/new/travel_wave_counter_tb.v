`timescale 1ns / 1ps
module travel_wave_counter_tb(

    );
    parameter integer       LEVELs = 4;
    reg                           CLK_IN;
    reg                             nRST;
    wire        [LEVELs - 1:0]   CLK_OUT;
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
    
    travel_wave_counter#(
       .LEVELs(LEVELs)
)travel_wave_counter_inist0
(
       . CLK_IN( CLK_IN),
       .   nRST(   nRST),
       .CLK_OUT(CLK_OUT)
    );
endmodule
