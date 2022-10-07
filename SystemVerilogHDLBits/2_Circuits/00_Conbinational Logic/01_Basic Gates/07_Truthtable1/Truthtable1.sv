module top_module( 
    input logic x3,
    input logic x2,
    input logic x1,  // three inputs
    output logic f   // one output
);

    assign f = x3 & x1 | x2 & x1 | ~x3 & x2;
endmodule
