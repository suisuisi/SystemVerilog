module top_module (
    input logic clk,
    input logic slowena,
    input logic reset,
    output logic [3:0] q);

    always_ff@(posedge clk) begin
        if(reset)                  q <= '0 ;
        else if(slowena & q==4'd9) q <= '0 ;
        else if(slowena & q!=4'd9) q <= q + 1 ;
        else                       q <= q  ;
    end
endmodule
