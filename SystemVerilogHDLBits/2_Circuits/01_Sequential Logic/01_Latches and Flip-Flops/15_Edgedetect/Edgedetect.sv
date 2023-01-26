module top_module (
    input logic clk,
    input logic [7:0] in,
    output logic[7:0] pedge
);
    wire logic [7:0] in_reg_n ,in_reg_l ;
    
    always_ff@(posedge clk) begin
        in_reg_n <= in ;
        in_reg_l <= in_reg_n ;
    end
    
    assign pedge = in_reg_n&~in_reg_l ;


endmodule
