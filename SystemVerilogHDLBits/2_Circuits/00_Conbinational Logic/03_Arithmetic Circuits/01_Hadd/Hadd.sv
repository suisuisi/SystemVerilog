module top_module( 
    input logic a, b,
    output logic cout, sum 
    );
    assign cout = a & b;
    assign sum = a ^ b;
endmodule
