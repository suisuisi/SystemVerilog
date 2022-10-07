module top_module( 
    input logic [99:0] in,
    output logic [98:0] out_both,
    output logic [99:1] out_any,
    output logic [99:0] out_different );

    assign out_both = in[99:1] & in[98:0];
    assign out_any = in[99:1] | in[98:0];
    assign out_different = {in[0], in[99:1]} ^ in;

endmodule
