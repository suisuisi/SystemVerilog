module top_module(
    input logic clk,
    input logic reset,    // Active-high synchronous reset to 5'h1
    output logic [4:0] q
); 
    always_ff@(posedge clk) begin
        if(reset)         q <= 5'h1 ;
        else begin
        q[4] <= 1'd0 ^ q[0] ;
        q[3] <= q[4];
        q[2] <= q[3] ^ q[0] ;
        q[1] <= q[2] ;
        q[0] <= q[1] ;
        end
    end
        
endmodule
