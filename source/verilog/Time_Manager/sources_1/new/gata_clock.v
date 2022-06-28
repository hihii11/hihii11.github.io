module gata_clock(
        input  wire     CLK_IN,
        input  wire    CLK_ENI,
        output wire    CLK_OUT
    );
    (*KEEP="true"*)reg clk_eno;
    
    assign CLK_OUT = clk_eno & CLK_IN;
    
    always@(posedge CLK_IN)
    begin
        clk_eno <= CLK_ENI;
    end    
endmodule
