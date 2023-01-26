timeunit 1ps ;
timeprecision 1ps ;
module top_module ();
    logic clk ;
    logic reset ;
    logic t ;
    wire logic q ;
    
    tff u_tff(
        .clk	(clk  ),
        .reset	(reset),
        .t      (t    ),
        .q      (q    )
    );
    
    initial begin
        clk <= 1'b0 ;
        forever
        #5
        clk <= ~clk ;
    end
    
    initial begin
        reset <= 1'b0 ;
        t <= 1'b0 ;
        #3;
        reset <= 1'b1 ;
        t <= 1'b1 ;
        #10;
        reset <= 1'b0 ;
        t <= 1'b1 ;

    end

 
endmodule