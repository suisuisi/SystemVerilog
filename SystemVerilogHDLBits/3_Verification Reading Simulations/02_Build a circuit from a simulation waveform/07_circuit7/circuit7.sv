module top_module (
    input logic clk,
    input logic a,
    output logic q );
    
    always_ff @(posedge clk) begin
        q <= ~a ;
    end

endmodule
