module top_module (
    input logic [3:0] SW,
    input logic [3:0] KEY,
    output logic [3:0] LEDR
); //

    MUXDFF u1_MUXDFF(
        .clk    (KEY[0]	),       
        .w		(KEY[3]	),
        .R		(SW[3]	),
        .E		(KEY[1]	),
        .L		(KEY[2]	),
        .Q		(LEDR[3])
    );
    MUXDFF u2_MUXDFF(
        .clk	(KEY[0]	),
        .w		(LEDR[3]),
        .R		(SW[2]	),
        .E		(KEY[1]	),
        .L		(KEY[2]	),
        .Q		(LEDR[2])
    );
    MUXDFF u3_MUXDFF(
        .clk	(KEY[0]	),
        .w		(LEDR[2]),
        .R		(SW[1]	),
        .E		(KEY[1]	),
        .L		(KEY[2]	),
        .Q		(LEDR[1])
    );
    MUXDFF u4_MUXDFF(
        .clk	(KEY[0]	),
        .w		(LEDR[1]),
        .R		(SW[0]	),
        .E		(KEY[1]	),
        .L		(KEY[2]	),
        .Q		(LEDR[0])
    );
                           
endmodule

module MUXDFF (
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
