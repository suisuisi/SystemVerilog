module top_module (
    input logic clk,
    input logic a,
    output logic [3:0] q );
    
    always_ff @(posedge clk)begin
        if(a)begin
            q <= 4'd4;
        end
        else if(q == 4'd6)begin
            q <= 4'd0;
        end
        else begin
            q <= q + 4'b1;
        end
    end
 
endmodule