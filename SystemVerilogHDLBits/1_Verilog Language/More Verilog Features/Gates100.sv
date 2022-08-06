module top_module( 
    input  logic [99:0] in,
    output logic out_and,
    output logic out_or,
    output logic out_xor 
);

    assign out_and = & in;
    assign out_or = | in;
    assign out_xor = ^ in;

endmodule
