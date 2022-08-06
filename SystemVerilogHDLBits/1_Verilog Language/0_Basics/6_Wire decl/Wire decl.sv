`default_nettype none
module top_module(
    input   wire logic a,b,c,d,
    output  logic out,
    output  logic out_n   ); 
    
    var logic an1,an2;
    assign an1 = a&b ;
    assign an2 = c&d ;
    assign out =an1|an2 ;
    assign out_n = ~out ;

endmodule
