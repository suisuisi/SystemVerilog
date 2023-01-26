module top_module(
    input logic clk,
    input logic areset,  // async active-high reset to zero
    input logic load,
    input logic ena,
    input logic [3:0] data,
    output logic [3:0] q ); 
    
    always_ff@(posedge clk or posedge areset) begin
        if(areset)       q <= '0 ;
        else if (load)   q <= data ;
        else if (ena)    q <= {1'd0,q[3:1]} ;
        else             q <= q ;
    end

endmodule
