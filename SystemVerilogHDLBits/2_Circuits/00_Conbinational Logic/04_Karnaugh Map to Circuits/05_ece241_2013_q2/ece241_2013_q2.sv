module top_module (
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    output logic out_sop,
    output logic out_pos
); 

    assign out_sop = c&d | ~a&~b&~d ;
    assign out_pos = c&(~a|b)&(~b|~c|d) ;
endmodule
