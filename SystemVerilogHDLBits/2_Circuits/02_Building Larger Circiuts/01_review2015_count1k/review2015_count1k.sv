module top_module (
    input logic clk,
    input logic reset,
    output logic[9:0] q);


always_ff @( posedge clk ) begin 
    if (reset) begin
        q <= 10'd0 ;
    end
    else if (q == 10'd999) begin
        q <= 10'd0 ;
    end
    else begin
        q <= q + 10'd1 ;
    end
    
end


endmodule
