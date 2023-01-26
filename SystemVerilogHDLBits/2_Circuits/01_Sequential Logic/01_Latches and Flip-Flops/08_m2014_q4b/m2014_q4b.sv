module top_module (
    input logic clk,
    input logic d, 
    input logic ar,   // asynchronous reset
    output logic q);

    always_ff@(posedge clk or posedge ar) begin
        if(ar) q <= '0 ;
        else
                q <=  d ;
    end
endmodule
