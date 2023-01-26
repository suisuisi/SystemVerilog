timeunit 1ps ;
timeprecision 1ps ;
module top_module ( output logic A, 
                    output logic B );//

    
    // generate input patterns here
    initial begin
        A <=1'b0 ;
        B <=1'b0 ;
        #10 ;
        A <= 1'b1 ;
        B <= 1'b0 ;
        #5 ;
        A <= 1'b1 ;
        B <= 1'b1 ;
        #5 ;
        A <= 1'b0 ;
        B <= 1'b1 ;
        #20 ;
        A <= 1'b0 ;
        B <= 1'b0 ;
    end
endmodule
