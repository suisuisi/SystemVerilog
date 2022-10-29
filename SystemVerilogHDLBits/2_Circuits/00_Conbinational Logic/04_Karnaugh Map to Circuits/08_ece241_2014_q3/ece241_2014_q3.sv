module top_module (
    input logic c,
    input logic d,
    output logic [3:0] mux_in
); 


assign mux_in = {(c&d),(~d),1'b0, (c|d)};

endmodule
