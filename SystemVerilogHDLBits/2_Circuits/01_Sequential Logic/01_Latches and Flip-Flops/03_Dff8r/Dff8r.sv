module top_module (
    input logic clk,
    input logic reset,            // Synchronous reset
    input logic [7:0] d,
    output logic [7:0] q
);

    always_ff@(posedge clk) begin
        if(reset) q <= '0 ;
        else
                  q <=  d ;
    end
endmodule
