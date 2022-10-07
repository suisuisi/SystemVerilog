module top_module (
    input  logic [7:0] in,
    output logic parity
    ); 
assign parity = ^in ;
endmodule
