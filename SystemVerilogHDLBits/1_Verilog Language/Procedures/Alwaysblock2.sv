module top_module(
    input logic clk,
    input logic a,
    input logic b,
    output wire logic out_assign,
    output logic out_always_comb,
    output logic out_always_ff   );

    assign out_assign = a ^ b;
    
    always_comb begin
        out_always_comb = a ^ b;
    end
    
    always_ff@(posedge clk) begin
        out_always_ff <= a ^ b;
    end

endmodule
