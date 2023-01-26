timeunit 1ps ;
timeprecision 1ps ;
module top_module ( );   
    logic clk ;
    
    dut u1_dut(
               .clk(clk)
              );
    
    initial begin
        clk <= 1'b0 ;
    end

    
    always #5 clk <= ~clk ;

 
endmodule