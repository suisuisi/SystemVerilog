module top_module (
    input  logic a, b, c, d, e,
    output logic [24:0] out
   );//
    
    wire logic [24:0] temp1,temp2 ;
    
    assign temp1 = {{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}} ;
    assign temp2 = {5{a,b,c,d,e}} ;
    assign out = temp1~^temp2 ;

endmodule
