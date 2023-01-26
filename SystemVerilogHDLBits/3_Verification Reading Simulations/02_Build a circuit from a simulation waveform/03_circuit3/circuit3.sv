module top_module (
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    output logic q );//
 
    assign q = b & d | b & c | a & d | a & c ;
 
endmodule