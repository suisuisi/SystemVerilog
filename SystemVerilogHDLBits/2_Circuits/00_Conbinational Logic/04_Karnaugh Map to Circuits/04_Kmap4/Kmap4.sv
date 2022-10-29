module top_module(
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    output logic out  
    );
    
    assign out = ~a&b&~c&~d | a&~b&~c&~d | ~a&~b&~c&d | a&b&~c&d
                 | ~a&b&c&d | a&~b&c&d | ~a&~b&c&~d | a&b&c&~d ;

endmodule
