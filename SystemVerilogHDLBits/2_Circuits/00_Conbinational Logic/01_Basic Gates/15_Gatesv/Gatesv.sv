module top_module( 
    input logic [3:0] in,
    output logic [2:0] out_both,
    output logic [3:1] out_any,
    output logic [3:0] out_different );

    
    assign out_both[0] = in[1] & in[0];
    assign out_both[1] = in[2] & in[1];
    assign out_both[2] = in[3] & in[2];
    assign out_any[1] = in[1] | in[0];
    assign out_any[2] = in[2] | in[1];
    assign out_any[3] = in[3] | in[2];
    assign out_different[0] = in[1] ^ in[0];
    assign out_different[1] = in[2] ^ in[1];
    assign out_different[2] = in[3] ^ in[2];
    assign out_different[3] = in[0] ^ in[3];

    
endmodule
