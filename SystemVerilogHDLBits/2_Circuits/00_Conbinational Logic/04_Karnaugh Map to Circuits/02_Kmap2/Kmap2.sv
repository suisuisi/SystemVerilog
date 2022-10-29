module top_module(
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    output logic out  
    ); 

    assign out = ~a&~d | ~b&~c | a&~b&d | b&c&d ;
    
endmodule
