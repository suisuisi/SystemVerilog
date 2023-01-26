module top_module (
    input logic clk,
    input logic reset,            // Synchronous reset
    input logic [7:0] d,
    output logic [7:0] q
);

    always_ff@(negedge clk) begin
        if(reset) q <= 8'h34 ;
        else
                  q <=  d ;
    end
endmodule

