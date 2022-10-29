module top_module( 
    input logic [1023:0] in,
    input logic [7:0] sel,
    output logic [3:0] out );
  assign out = in[sel * 4 +: 4];
endmodule
