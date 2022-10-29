module top_module( 
    input logic [255:0] in,
    input logic [7:0] sel,
    output logic out );
  assign out = in[sel];
endmodule
