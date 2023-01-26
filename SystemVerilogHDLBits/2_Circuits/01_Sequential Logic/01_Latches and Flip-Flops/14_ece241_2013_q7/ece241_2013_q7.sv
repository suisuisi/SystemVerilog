module top_module (
    input logic clk,
    input logic j,
    input logic k,
    output logic Q); 

    var logic D ;
    always_comb begin
        case({j,k})
            2'b00: D = Q  ;
            2'b01: D = '0 ;
            2'b11: D = ~Q ;
            2'b10: D = '1 ;
        endcase
    end
    
    always_ff@(posedge clk) begin
        Q <= D;
    end
endmodule
