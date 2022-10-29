module top_module( 
    input logic a, b, cin,
    output logic cout, sum );

    assign sum = a^b^cin ;
    assign cout = a&b | cin&(a^b) ;
endmodule
