module top_module (
    input logic clk,
    input logic areset,   // active high asynchronous reset
    input logic [7:0] d,
    output logic [7:0] q
);
    always_ff@(posedge clk or posedge areset) begin
        if(areset) q <= '0 ;
        else
                   q <=  d ;
    end

endmodule
