module top_module (
    input logic [4:1] x, 
    output logic f );

    assign f = (~x[1] & x[3]) | (x[1] & x[2] & ~x[3]);
endmodule

