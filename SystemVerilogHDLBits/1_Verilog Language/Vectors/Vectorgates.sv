module top_module( 
    input logic [2:0] a,
    input logic [2:0] b,
    output logic [2:0] out_or_bitwise,
    output logic out_or_logical,
    output logic [5:0] out_not
);

    assign out_or_bitwise = a|b ;
    assign out_or_logical = a||b ;
    assign out_not = {~b,~a} ;
    
endmodule
