timeunit 1ps ;
timeprecision 1ps ;
 
module top_module();
    logic  [1:0]in ;
    wire logic out ;
    
    andgate u_andgate(
                      .in(in),
                      .out(out)
    );
    
    initial begin
        in <= 2'b00 ;
        #10 ;
        in <= 2'b01 ;
        #10 ;
        in <= 2'b10 ;
        #10 ;
        in <= 2'b11 ;
    end  
        
endmodule
