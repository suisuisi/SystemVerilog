module top_module( 
    input logic [99:0] a, b,
    input logic sel,
    output logic [99:0] out );

    
    assign out = sel ? b : a;

endmodule
