module top_module( 
    input logic [99:0] a, b,
    input logic cin,
    output logic cout,
    output logic [99:0] sum 
    );

    assign {cout, sum} = a + b  + cin;
endmodule
