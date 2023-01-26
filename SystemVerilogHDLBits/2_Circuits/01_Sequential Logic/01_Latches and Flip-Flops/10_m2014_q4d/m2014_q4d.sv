module top_module (
    input logic clk,
    input logic in, 
    output logic out);
    
    var logic d ;
    
    always_comb begin
        d = out^in ;
    end
    
    always_ff@(posedge clk) begin
        out <= d ;
    end

endmodule
