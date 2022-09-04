
module top_module(
    input logic a, 
    input logic b,
    output wire logic out_assign,
    output var logic out_alwaysblock
);
    
    assign out_assign = a&b ;
    
    always_comb
        begin
            out_alwaysblock = a&b ;
        end

endmodule
