module top_module (
    input logic [1:0] sel,
    input logic [7:0] a,
    input logic [7:0] b,
    input logic [7:0] c,
    input logic [7:0] d,
    output logic [7:0] out  
    ); //

    var logic [7:0] mux0, mux1;
    mux2 u1_mux0 ( sel[0],    a,    b, mux0 );
    mux2 u2_mux1 ( sel[0],    c,    d, mux1 );
    mux2 u3_mux2 ( sel[1], mux0, mux1,  out );

endmodule
