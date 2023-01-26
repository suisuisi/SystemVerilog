module top_module (
    input logic clk,
    input logic reset,        // Synchronous active-high reset
    output logic [3:0] q);
    
    always_ff@(posedge clk) begin
        if(reset)           q <= '0 ;
        else if(q == 4'd9)  q <= '0 ;
        else                q <= q + 1;
    end
 
endmodule