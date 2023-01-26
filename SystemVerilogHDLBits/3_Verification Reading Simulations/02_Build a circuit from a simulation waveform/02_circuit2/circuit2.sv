module top_module (
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    output logic q );//
 
    assign q = ~a & ~b & ~c & ~d | ~a & ~b & c & d | ~a & b & ~c & d |
               ~a & b & c & ~d | a & b & ~c & ~d | a & b & c & d | a & ~b & ~c & d | a & ~b & c & ~d ;
       		   
endmodule