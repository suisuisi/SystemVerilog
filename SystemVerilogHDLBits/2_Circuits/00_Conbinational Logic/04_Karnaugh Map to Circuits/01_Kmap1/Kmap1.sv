module top_module(
    input logic a,
    input logic b,
    input logic c,
    output logic out  
    ); 
    
 assign out = a | b | c;
    
endmodule