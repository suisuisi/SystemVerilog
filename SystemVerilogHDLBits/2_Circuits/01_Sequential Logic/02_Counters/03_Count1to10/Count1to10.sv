module top_module (
    input logic clk,
    input logic reset,
    output logic [3:0] q);
    
    always_ff@(posedge clk)begin
        if(reset)           q <= 4'd1;
        else if(q == 4'd10) q <= 4'd1;
        else                q <= q + 1;
    end
endmodule