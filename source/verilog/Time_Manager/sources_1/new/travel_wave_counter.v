module travel_wave_counter#(
       parameter integer LEVELs = 3
)
(
       input  wire                  CLK_IN,
       input  wire                    nRST,
       output wire [LEVELs-1:0]    CLK_OUT
    );
    
    genvar i;
    generate
        for(i = 0;i < LEVELs;i = i+1)
        begin
            if(i == 0)
            begin
                travel_wave_level travel_wave_level_inist0(
                   .CLK_IN(CLK_IN),.nRST(nRST),.DOUT(CLK_OUT[i]));
            end
            else
            begin
                travel_wave_level travel_wave_level_inist0(
                   .CLK_IN(CLK_OUT[i-1]),.nRST(nRST),.DOUT(CLK_OUT[i]));
            end
        end
    endgenerate    
endmodule

module travel_wave_level(
       input  wire  CLK_IN,
       input  wire    nRST,
       output wire    DOUT
);
    reg dout;
    assign DOUT = dout;
    always@(posedge CLK_IN,negedge nRST)
    begin
        if(~nRST)
        begin
            dout <= 1'b0;
        end
        else
        begin
            dout <= ~dout;
        end
    end
endmodule
