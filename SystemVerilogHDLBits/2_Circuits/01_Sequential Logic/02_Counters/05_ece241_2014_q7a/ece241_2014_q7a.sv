module top_module (
    input logic clk,
    input logic reset,
    input logic enable,
    output logic [3:0] Q,
    output logic c_enable,
    output logic c_load,
    output logic [3:0] c_d
); //

    count4 u1_count4 (clk, c_enable, c_load, c_d ,Q);
    
    assign c_enable = enable ;
    assign c_load   = reset | ((Q == 4'd12)&&enable) ;
    assign c_d      = c_load ? 4'd1:4'd0 ;

endmodule
