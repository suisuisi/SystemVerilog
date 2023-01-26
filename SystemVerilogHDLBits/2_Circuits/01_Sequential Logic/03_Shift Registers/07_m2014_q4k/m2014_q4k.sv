module top_module (
    input logic clk,
    input logic resetn,   // synchronous reset
    input logic in,
    output logic out);
    
    var logic [3:0] Q ;
    
    always_ff@(posedge clk) begin
        if(!resetn)     Q <= '0 ;
        else            Q <= {in,Q[3:1]} ;
    end
    
    assign out = Q[0] ;

endmodule
