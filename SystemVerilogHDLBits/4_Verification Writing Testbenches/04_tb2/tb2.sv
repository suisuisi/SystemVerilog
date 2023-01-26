timeunit 1ps ;
timeprecision 1ps ;

module top_module();
    logic		clk ;
    logic		in ;
    logic [2:0]	s ;
    wire logic	out ;
    
    q7 u1_q7(
        .clk	(clk),
        .in     (in ),
        .s      (s  ),
        .out    (out)
    );
    
    initial begin
        clk <= 1'b0 ;
        forever
        #5 clk <= ~clk ;
    end
    
    initial begin
        in <= 1'b0 ;
        s  <= 3'd2 ;
        #10 ;
        in <= 1'b0 ;
        s  <= 3'd6 ;
        #10 ;
        in <= 1'b1 ;
        s  <= 3'd2 ;
        #10 ;
        in <= 1'b0 ;
        s  <= 3'd7 ;
        #10 ;
        in <= 1'b1 ;
        s  <= 3'd0 ;
        #30 ;
        in <= 1'b0 ;
        s  <= 3'd0 ;
    end
        
endmodule