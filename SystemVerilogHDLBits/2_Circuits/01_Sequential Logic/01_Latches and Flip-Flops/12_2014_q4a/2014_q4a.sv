module top_module (
    input logic clk,
    input logic w, R, E, L,
    output logic Q
);
    always_ff@(posedge clk) begin
        casex({E,L})
            2'b00: Q <= Q ;
            2'bx1: Q <= R ;
            2'b10: Q <= w ;
        endcase
    end

endmodule
